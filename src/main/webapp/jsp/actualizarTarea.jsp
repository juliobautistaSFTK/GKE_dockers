<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.softtek.model.Task"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Actualizar Tarea</title>
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
    <base href="${pageContext.request.contextPath}/">
</head>
<body>

    <div class="container">
        <h2>Editar Tarea</h2>

        <!-- Formulario para Actualizar Tarea -->
        <div class="form-container">
            <form action="EditarTareaServlet" method="post">
                <input type="hidden" name="id" value="${param.id}">

                <div class="form-group">
                    <label for="titulo">Título:</label>
                    <input type="text" name="titulo" id="titulo" value="${param.titulo}" required>
                </div>

                <div class="form-group">
                    <label for="descripcion">Descripción:</label>
                    <textarea name="descripcion" id="descripcion" rows="4" required>${param.descripcion}</textarea>
                </div>

                <div class="form-group">
                    <label for="fechaCreacion">Fecha Creación:</label>
                    <input type="date" name="fechaCreacion" id="fechaCreacion" value="${param.fechaCreacion}" disabled>
                </div>

                <div class="form-group">
                    <label for="fechaVencimiento">Fecha Vencimiento:</label>
                    <input type="date" name="fechaVencimiento" id="fechaVencimiento" value="${param.fechaVencimiento}" required>
                </div>

                <div class="form-group">
                    <label for="estado">Estado:</label>
                    <select name="estado" id="estado" required>
                        <option value="Pendiente" ${param.estado == 'Pendiente' ? 'selected' : ''}>Pendiente</option>
                        <option value="En Proceso" ${param.estado == 'En Proceso' ? 'selected' : ''}>En Proceso</option>
                        <option value="Completada" ${param.estado == 'Completada' ? 'selected' : ''}>Completada</option>
                    </select>
                </div>

                <div class="button-group">
                    <button type="submit" class="btn btn-edit">✏️ Actualizar</button>
                    <a href="ListarTareasServlet" class="btn btn-back">⬅️ Cancelar</a>
                </div>
            </form>
        </div>
    </div>

</body>
</html>