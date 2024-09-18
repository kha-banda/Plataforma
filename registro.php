<?php
// Incluir el archivo de configuración
include 'config.php';

// Verificar si el formulario ha sido enviado
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Obtener los datos del formulario
    $nombre_completo = $_POST['fullName'];
    $fecha_nacimiento = $_POST['birthDate'];
    $telefono = $_POST['phoneNumber'];
    $email = $_POST['email'];
    $numero_tienda = $_POST['storeName'];
    $direccion_tienda = $_POST['storeAddress'];
    $comunidad_tienda = $_POST['storeCity'];
    $tipo_producto = $_POST['storeType'];
    $nombre_usuario = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT); // Encriptar la contraseña

    // Preparar la consulta SQL
    $sql = "INSERT INTO encargados_tienda (nombre_completo, fecha_nacimiento, telefono, email, nombre_tienda, direccion_tienda, ciudad_tienda, estado_tienda, tipo_producto, nombre_usuario, password)
            VALUES (:nombre_completo, :fecha_nacimiento, :telefono, :email, :nombre_tienda, :direccion_tienda, :ciudad_tienda, :estado_tienda, :tipo_producto, :nombre_usuario, :password)";

    // Preparar la declaración SQL
    $stmt = $conn->prepare($sql);

    // Enlazar los valores a la consulta
    $stmt->bindParam(':nombre_completo', $nombre_completo);
    $stmt->bindParam(':fecha_nacimiento', $fecha_nacimiento);
    $stmt->bindParam(':telefono', $telefono);
    $stmt->bindParam(':email', $email);
    $stmt->bindParam(':numero_tienda', $nombre_tienda);
    $stmt->bindParam(':direccion_tienda', $direccion_tienda);
    $stmt->bindParam(':comunidad_tienda', $ciudad_tienda);
    $stmt->bindParam(':tipo_producto', $tipo_producto);
    $stmt->bindParam(':nombre_usuario', $nombre_usuario);
    $stmt->bindParam(':password', $password);

    // Ejecutar la consulta
    if ($stmt->execute()) {
        echo "Registro exitoso";
    } else {
        echo "Error en el registro";
    }
}
?>
