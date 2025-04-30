<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.softtek.model.Task"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<%
    Task tarea = (Task)request.getAttribute("tarea");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Eliminar Tarea</title>
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
    <base href="${pageContext.request.contextPath}/">
</head>
<body>

    <div class="container">
        <h2>Eliminar Tarea</h2>
        <p>¿Estás seguro de que deseas eliminar la siguiente tarea?</p>

        <div class="form-container">
            <form action="${pageContext.request.contextPath}/EliminarTareaServlet" method="post">
                <input type="hidden" name="id" value="${param.id}">

                <div class="form-group">
                    <label>ID:</label>
                    <span>${param.id}</span>
                </div>

                <div class="form-group">
                    <label>Título:</label>
                    <span>${param.titulo}</span>
                </div>

                <div class="form-group">
                    <label>Fecha Vencimiento:</label>
                    <span>${param.fechaVencimiento}</span>
                </div>

                <div class="form-group">
                    <label>Estado:</label>
                    <span>${param.estado}</span>
                </div>

                <div class="button-group">
                    <button type="submit" class="btn btn-delete">🗑️ Eliminar</button>
                    <a href="ListarTareasServlet" class="btn btn-back">⬅️ Cancelar</a>
                </div>
            </form>
        </div>
    </div>

</body>
</html>


<!--  %@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <title>Eliminar Tarea</title>
    <link rel="stylesheet" type="text/css" href="../css/styles.css">
      <base href="${pageContext.request.contextPath}/">
</head>
<body>
    <h2>¿Estás seguro de que deseas eliminar esta tarea?</h2>
    
    <form action="EliminarTareaServlet" method="post">
        <input type="hidden" name="id" value="">
        <button type="submit">Sí, eliminar</button>
    </form>
    
    <a href="ListarTareasServlet">❌ Cancelar</a>
</body>
</html-->