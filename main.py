from create_tables import create_tables
from insert_data import insert_categoria, insert_direccion
from db_connection import create_connection, close_connection

if __name__ == "__main__":
    conn = create_connection()
    if conn:
        create_tables(conn)  # Crea las tablas (opcional si ya están creadas)
        insert_categoria(conn, "Electrónica")
        insert_direccion(conn, "Oaxaca", "Teotitlán", "Centro", "71000", "Calle Principal", 123)
        close_connection(conn)
