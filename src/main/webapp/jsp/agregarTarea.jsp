<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Tarea</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">
     <base href="${pageContext.request.contextPath}/">
</head>
<body>

<div class="container">
    <h2>Agregar Nueva Tarea</h2>
    
    <form action="AgregarTareaServlet" method="post" onsubmit="return validarFecha()">
        <div class="form-group">
            <label for="titulo">Título:</label>
            <input type="text" id="titulo" name="titulo" required>
        </div>

        <div class="form-group">
            <label for="descripcion">Descripción:</label>
            <input type="text" id="descripcion" name="descripcion" required>
        </div>

        <div class="form-group">
            <label for="fechaVencimiento">Fecha de Vencimiento:</label>
            <input type="date" id="fechaVencimiento" name="fecha_vencimiento" required>
        </div>

        <div class="form-group">
            <label for="estado">Estado:</label>
            <select id="estado" name="estado" required>
                <option value="pendiente">Pendiente</option>
                <option value="en_progreso">En Progreso</option>
                <option value="completada">Completada</option>
            </select>
        </div>

        <button type="submit" class="btn btn-add">Guardar Tarea</button>
    </form>

    <!-- Botón para regresar a la página anterior -->
    <button class="btn btn-back" onclick="window.history.back();">Regresar</button>
</div>

<script>
    function validarFecha() {
        let fechaVencimiento = document.getElementById("fechaVencimiento").value;
        let fechaActual = new Date().toISOString().split("T")[0];

        if (fechaVencimiento <= fechaActual) {
            alert("La fecha de vencimiento debe ser posterior a la fecha actual.");
            return false;
        }
        return true;
    }

    // Establecer la fecha mínima como el día actual
    document.getElementById("fechaVencimiento").setAttribute("min", new Date().toISOString().split("T")[0]);
</script>

</body>
</html>

<!--  !DOCTYPE html>
<html>
<head>
    <title>Agregar Nueva Tarea</title>
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
     <base href="${pageContext.request.contextPath}/">
</head>
<body>
<h2>Agregar nueva tarea</h2>

    <form action="AgregarTareaServlet" method="post">
        <label for="titulo">Título:</label>
        <input type="text" name="titulo" required maxlength="100"><br>

        <label for="descripcion">Descripción:</label>
        <textarea name="descripcion" maxlength="500"></textarea><br>

        <label for="fecha_vencimiento">Fecha de Vencimiento:</label>
        <input type="date" name="fecha_vencimiento"><br>

        <label for="estado">Estado:</label>
        <select name="estado">
            <option value="Pendiente">Pendiente</option>
            <option value="En Proceso">En Proceso</option>
            <option value="Completada">Completada</option>
            <option value="Cancelada">Cancelada</option>
        </select><br>

        <button type="submit">Guardar Tarea</button>
    </form>
    
    <a href="ListarTareasServlet">⬅️ Volver</a>
</body>
</html-->