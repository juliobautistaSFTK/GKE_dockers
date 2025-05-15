package com.softtek.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.softtek.dao.TaskDAO;
import com.softtek.model.Task;

@WebServlet("/AgregarTareaServlet")
public class AgregarTareaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String titulo = request.getParameter("titulo");
		String descripcion = request.getParameter("descripcion");
		String fechaVencimiento = request.getParameter("fecha_vencimiento");
		String estado = request.getParameter("estado");

		Task tarea = new Task();
		tarea.setTitulo(titulo);
		tarea.setDescripcion(descripcion);
		tarea.setFechaCreacion(LocalDate.now());
		tarea.setFechaVencimiento(fechaVencimiento.isEmpty() ? null : LocalDate.parse(fechaVencimiento));
		tarea.setEstado(estado);
		System.out.println("Servlet Agrega tareas");
		TaskDAO taskDAO = new TaskDAO();
		try {
			taskDAO.agregarTarea(tarea);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect("ListarTareasServlet");
	}
}
