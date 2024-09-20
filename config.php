<?php
// Credenciales de la base de datos
$host = "localhost";  // Host (normalmente es localhost)
$port = "3306";  // Puerto por defecto de MySQL
$dbname = "plataforma"; 
$username = "root"; // Usuario de MySQL
$password = ""; // Contraseña de MySQL (deja vacío si no hay)

try {
    // Crear una nueva conexión PDO con el puerto correcto
    $conn = new PDO("mysql:host=$host;port=$port;dbname=$dbname", $username, $password);
    // Establecer el modo de error de PDO a excepciones
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // Mostrar error si la conexión falla
    die("Error al conectar con la base de datos: " . $e->getMessage());
}