package com.softtek.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.softtek.dao.TaskDAO;
import com.softtek.model.Task;

/**
 * Servlet implementation class ListarTareasServlet
 */

@WebServlet("/ListarTareasServlet")
public class ListarTareasServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6511507631448849197L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		TaskDAO taskDAO = new TaskDAO();
		List<Task> listaTareas = null;
		try {
			listaTareas = taskDAO.obtenerTareas();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("listaTareas", listaTareas);
		request.getRequestDispatcher("jsp/listarTareas.jsp").forward(request, response);
	}
}
