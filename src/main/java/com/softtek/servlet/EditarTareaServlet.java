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

/**
 * Servlet implementation class EditarTareaServlet
 */
@WebServlet("/EditarTareaServlet")
public class EditarTareaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarTareaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: Editar ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id= request.getParameter("id");
		String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String fechaVencimiento = request.getParameter("fechaVencimiento");
        String estado = request.getParameter("estado");
		
		//String fechaVencimiento = request.getParameter("fechaVencimiento");
		System.out.println("Entro al post"+fechaVencimiento+" desc"+descripcion);
		//doGet(request, response);
		

        Task tarea = new Task();
        tarea.setId(Integer.valueOf(id));
        tarea.setTitulo(titulo);
        tarea.setDescripcion(descripcion);
        tarea.setFechaCreacion(LocalDate.now());
        tarea.setFechaVencimiento(fechaVencimiento.isEmpty() ? null : LocalDate.parse(fechaVencimiento));
        tarea.setEstado(estado);
        System.out.println("Servlet Editar tareas");
        TaskDAO taskDAO = new TaskDAO();
        try {
			taskDAO.editarTarea(tarea);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        response.sendRedirect("ListarTareasServlet");
	}

}
