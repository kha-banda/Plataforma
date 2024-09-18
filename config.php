<?php
// Credenciales de la base de datos
$host = "localhost:8080"; 
$dbname = "plataforma"; 
$username = "root"; // Usuario de MySQL (normalmente es root en servidores locales)
$password = ""; // Contraseña de MySQL (deja vacío si no hay)

try {
    // Crear una nueva conexión PDO
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    // Establecer el modo de error de PDO a excepciones
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    // Mostrar error si la conexión falla
    die("Error al conectar con la base de datos: " . $e->getMessage());
}
?>
