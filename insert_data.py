from db_connection import create_connection, close_connection

def insert_categoria(connection, nombre):
    cursor = connection.cursor()
    cursor.execute("INSERT INTO categoria (nombre) VALUES (%s)", (nombre,))
    connection.commit()
    print(f"Categoría '{nombre}' insertada.")

def insert_direccion(connection, estado, ciudad, colonia, cp, calle, numero):
    cursor = connection.cursor()
    cursor.execute("""
    INSERT INTO direccion (estado, ciudad, colonia, cp, calle, numero)
    VALUES (%s, %s, %s, %s, %s, %s)
    """, (estado, ciudad, colonia, cp, calle, numero))
    connection.commit()
    print(f"Dirección '{calle} {numero}' insertada.")

# Agrega más funciones según sea necesario

if __name__ == "__main__":
    conn = create_connection()
    if conn:
        insert_categoria(conn, "Electrónica")
        insert_direccion(conn, "Oaxaca", "Teotitlán", "Centro", "71000", "Calle Principal", 123)
        close_connection(conn)
