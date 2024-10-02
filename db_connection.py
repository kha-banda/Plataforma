import mysql.connector
from mysql.connector import Error

def create_connection():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='plataforma',  # Cambia por el nombre de tu base de datos
            user='root',  # Cambia por tu usuario de MySQL
            password=''  # Cambia por tu contraseña de MySQL
        )
        if connection.is_connected():
            print("Conexión exitosa a la base de datos")
            return connection
    except Error as e:
        print(f"Error al conectarse a la base de datos: {e}")
        return None

def close_connection(connection):
    if connection.is_connected():
        connection.close()
        print("Conexión cerrada")

# Ejemplo de uso
if __name__ == "__main__":
    conn = create_connection()
    if conn:
        close_connection(conn)