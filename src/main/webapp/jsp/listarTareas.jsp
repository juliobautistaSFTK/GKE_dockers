<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.softtek.model.Task"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Lista de Tareas</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/styles.css">

    <base href="${pageContext.request.contextPath}/">
</head>
<body>

<div class="container">
    <h2>Lista de Tareas</h2>

    <a href="jsp/agregarTarea.jsp" class="btn btn-add">➕ Agregar Nueva Tarea</a>

    <table class="task-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Título</th>
                <th>Descripción</th>
                <th>Fecha Creación</th>
                <th>Fecha Vencimiento</th>
                <th>Estado</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="tarea" items="${listaTareas}">
                <tr>
                    <td><c:out value="${tarea.id}" /></td>
                    <td>${tarea.titulo}</td>
                    <td>${tarea.descripcion}</td>
                    <td>${tarea.fechaCreacion}</td>
                    <td>${tarea.fechaVencimiento}</td>
                    <td class="estado-${tarea.estado}">${tarea.estado}</td>
                    <td>
                        <a href="jsp/actualizarTarea.jsp?id=${tarea.id}&titulo=${tarea.titulo}&descripcion=${tarea.descripcion}&fechaCreacion=${tarea.fechaCreacion}&fechaVencimiento=${tarea.fechaVencimiento}&estado=${tarea.estado}" class="btn btn-edit">✏️ Editar</a>
                        <a href="jsp/eliminarTarea.jsp?id=${tarea.id}&titulo=${tarea.titulo}&fechaVencimiento=${tarea.fechaVencimiento}&estado=${tarea.estado}" class="btn btn-delete">🗑️ Eliminar</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- Botón para regresar -->
    <!-- button class="btn btn-back" onclick="window.history.back();">Regresar</button-->
</div>

</body>
</html>

<!--%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.softtek.model.Task"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Tareas</title>
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
    <base href="${pageContext.request.contextPath}/">
</head>
<body>

	<h2>Lista de Tareas</h2>
	<a href="jsp/agregarTarea.jsp">➕ Agregar Nueva Tarea</a>
	<br>
	<br>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Título</th>
			<th>Descripción</th>
			<th>Fecha Creación</th>
			<th>Fecha Vencimiento</th>
			<th>Estado</th>
			<th>Acciones</th>
		</tr>
		<c:forEach var="tarea" items="${listaTareas}">
			<tr>
				<td><c:out value="${tarea.id}" /></td>
				<td>${tarea.titulo}</td>
				<td>${tarea.descripcion}</td>
				<td>${tarea.fechaCreacion}</td>
				<td>${tarea.fechaVencimiento}</td>
				<td>${tarea.estado}</td>
				<td><a href="editarTarea.jsp?id=${tarea.id}">✏️ Editar</a> <a
					href="jsp/eliminarTarea.jsp?id=${tarea.id}">🗑️ Eliminar</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html-->