from db_connection import create_connection, close_connection

def create_tables(connection):
    cursor = connection.cursor()
    
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS categoria (
      id INT AUTO_INCREMENT PRIMARY KEY,
      nombre VARCHAR(50) NOT NULL
    );
    """)
    
    cursor.execute("""
    CREATE TABLE IF NOT EXISTS direccion (
      id INT AUTO_INCREMENT PRIMARY KEY,
      estado VARCHAR(50) NOT NULL,
      ciudad VARCHAR(50) NOT NULL,
      colonia VARCHAR(50) NOT NULL,
      cp VARCHAR(10) NOT NULL,
      calle VARCHAR(50) NOT NULL,
      numero INT NOT NULL
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS usuario (
      id INT AUTO_INCREMENT PRIMARY KEY,
      nombre VARCHAR(50) NOT NULL,
      apellidos VARCHAR(100) NOT NULL,
      correo VARCHAR(100) NOT NULL UNIQUE,
      telefono VARCHAR(15) NOT NULL,
      contraseña VARCHAR(255) NOT NULL,
      direccion_id INT NOT NULL,
      FOREIGN KEY (direccion_id) REFERENCES direccion(id) ON DELETE CASCADE
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS producto (
      id INT AUTO_INCREMENT PRIMARY KEY,
      nombre VARCHAR(100) NOT NULL,
      descripcion TEXT NOT NULL,
      cantidad INT NOT NULL,
      precio DECIMAL(10, 2) NOT NULL,
      imagen VARCHAR(255) NOT NULL,
      categoria_id INT NOT NULL,
      FOREIGN KEY (categoria_id) REFERENCES categoria(id)
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS pedido (
      id INT AUTO_INCREMENT PRIMARY KEY,
      usuario_id INT NOT NULL,
      fecha DATE NOT NULL,
      status VARCHAR(50) NOT NULL,
      FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS pedido_producto (
      pedido_id INT NOT NULL,
      producto_id INT NOT NULL,
      cantidad INT NOT NULL,
      PRIMARY KEY (pedido_id, producto_id),
      FOREIGN KEY (pedido_id) REFERENCES pedido(id) ON DELETE CASCADE,
      FOREIGN KEY (producto_id) REFERENCES producto(id) ON DELETE CASCADE
    );
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS reclamo (
      id INT AUTO_INCREMENT PRIMARY KEY,
      usuario_id INT NOT NULL,
      producto_id INT NOT NULL,
      fecha DATE NOT NULL,
      descripcion TEXT NOT NULL,
      FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE,
      FOREIGN KEY (producto_id) REFERENCES producto(id) ON DELETE CASCADE
    );
    """)

    connection.commit()
    print("Tablas creadas exitosamente.")

if __name__ == "__main__":
    conn = create_connection()
    if conn:
        create_tables(conn)
        close_connection(conn)
