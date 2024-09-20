<?php
// Conectar a la base de datos (ajusta las credenciales según tu entorno)
$host = "localhost";
$port = "3306";
$dbname = "plataforma";
$username = "root";
$password = "";

try {
    $conn = new PDO("mysql:host=$host;port=$port;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Obtener datos del formulario
    $categoria = $_POST['categoria'];
    $mensaje = $_POST['mensaje'];

    // Insertar en la base de datos
    $sql = "INSERT INTO solicitudes (categoria, mensaje, fecha) VALUES (:categoria, :mensaje, NOW())";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':categoria', $categoria);
    $stmt->bindParam(':mensaje', $mensaje);
    $stmt->execute();

    // Confirmar que el mensaje se ha enviado
    echo "Su solicitud ha sido enviada exitosamente.";

} catch (PDOException $e) {
    echo "Error al conectar con la base de datos: " . $e->getMessage();
}
?>
