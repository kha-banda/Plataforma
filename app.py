from flask import Flask, render_template, request, redirect, url_for, session, flash
from db_connection import create_connection, close_connection

app = Flask(__name__)
app.secret_key = 'supersecretkey'  # Clave secreta para manejar las sesiones

@app.route('/')
def Index():
    if 'loggedin' in session:
        return render_template('index.html',session = session )
    else:
        return render_template('index.html')

# Ruta para la página de inicio de sesión
@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        usuario = request.form["usuario"]
        contrasena = request.form["contrasena"]
        
        # Conectarse a la base de datos para verificar las credenciales
        conn = create_connection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM usuario WHERE nombre = %s AND contraseña = %s", (usuario, contrasena))
        user = cursor.fetchone()
        
        # Si las credenciales son correctas, redirigir al panel de control
        if user:
            session["usuario"] = usuario
            session["usuario_id"] = user[0]  # Almacena el ID del usuario en la sesión
            return redirect(url_for("panel_control"))
        else:
            # Si las credenciales no son válidas, mostrar un mensaje de error
            error = "Usuario o contraseña incorrectos"
            return render_template("iniciasesion.html", error=error)
    
    return render_template("iniciasesion.html")

# Ruta para el panel de control después de iniciar sesión
@app.route("/panel_control")
def panel_control():
    if "usuario" in session:
        # Aquí puedes mostrar el CRUD para pedidos, reclamos, etc.
        return render_template("panel_control.html", usuario=session["usuario"])
    else:
        return redirect(url_for("login"))

# Ruta para cerrar sesión
@app.route("/logout")
def logout():
    session.pop("usuario", None)
    session.pop("usuario_id", None)  # Limpia el ID del usuario de la sesión
    return redirect(url_for("login"))

# Ruta para mostrar productos
@app.route('/productos')
def productos():
    return render_template('productos.html')

# Ruta para enviar reclamos
@app.route('/enviar_reclamo', methods=['POST'])
def enviar_reclamo():
    usuario_id = session.get("usuario_id")
    if not usuario_id:
        return redirect(url_for("login"))

    producto_id = request.form["producto_id"]
    categoria = request.form["categoria"]
    mensaje = request.form["mensaje"]
    
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO reclamo (usuario_id, producto_id, categoria, mensaje)
        VALUES (%s, %s, %s, %s)
    """, (usuario_id, producto_id, categoria, mensaje))
    conn.commit()
    close_connection(conn)
    
    flash("Tu reclamo fue enviado con éxito.")
    return redirect(url_for("panel_control"))

@app.route('/quejas')
def quejas():
    return render_template('quejas.html')

if __name__ == "__main__":
    app.run(debug=True)
