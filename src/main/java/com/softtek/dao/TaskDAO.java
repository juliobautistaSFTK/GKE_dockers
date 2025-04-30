package com.softtek.dao;

import com.softtek.model.Task;
import com.softtek.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TaskDAO {
	private Connection connection;

	public TaskDAO() {
		try {
			connection = DatabaseConnection.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public List<Task> obtenerTareas() throws SQLException {
		List<Task> lista = new ArrayList<>();
		String sql = "SELECT id, titulo,descripcion,fecha_creacion,fecha_vencimiento,estado FROM tasks";
		try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(sql)) {
			while (rs.next()) {
				Task tarea = new Task();
				tarea.setId(rs.getInt("id"));
				tarea.setTitulo(rs.getString("titulo"));
				tarea.setDescripcion(rs.getString("descripcion"));
				tarea.setFechaCreacion(rs.getDate("fecha_creacion").toLocalDate());
				tarea.setFechaVencimiento(rs.getDate("fecha_vencimiento").toLocalDate());
				tarea.setEstado(rs.getString("estado"));
				lista.add(tarea);
			}
		}
		return lista;
	}

	public void agregarTarea(Task tarea) throws SQLException {
		String sql = "INSERT INTO tasks (titulo, descripcion,fecha_creacion, fecha_vencimiento,estado) VALUES (?,?,?,?,?)";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {

			stmt.setString(1, tarea.getTitulo());
			stmt.setString(2, tarea.getDescripcion());
			stmt.setDate(3, java.sql.Date.valueOf(tarea.getFechaCreacion()));
			stmt.setDate(4, java.sql.Date.valueOf(tarea.getFechaVencimiento()));
			stmt.setString(5, tarea.getEstado());

			stmt.executeUpdate();
		}
	}

	public void editarTarea(Task tarea) throws SQLException {

		String sql = "UPDATE tasks SET titulo = ?, descripcion = ?, fecha_vencimiento = ?, estado = ? WHERE id = ?";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setString(1, tarea.getTitulo());
			stmt.setString(2, tarea.getDescripcion());
			stmt.setDate(3, java.sql.Date.valueOf(tarea.getFechaVencimiento()));
			stmt.setString(4, tarea.getEstado());
			stmt.setInt(5, tarea.getId());
			stmt.executeUpdate();
		}
	}

	public void eliminarTarea(int id) throws SQLException {
		String sql = "DELETE FROM tasks WHERE id = ?";

		try (Connection conn = DatabaseConnection.getConnection();
				PreparedStatement stmt = conn.prepareStatement(sql)) {
			stmt.setInt(1, id);
			stmt.executeUpdate();
		}
		System.out.println("Tarea eliminada"+id);
	}

	public Task obtenerTareaPorTitulo(String titulo) throws SQLException {
	    String sql = "SELECT id, titulo, descripcion, fecha_creacion, fecha_vencimiento, estado FROM tasks WHERE titulo = ?";
	    Task tarea = null;

	    try (Connection conn = DatabaseConnection.getConnection();
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	        stmt.setString(1, titulo);
	        try (ResultSet rs = stmt.executeQuery()) {
	            if (rs.next()) {
	                tarea = new Task();
	                tarea.setId(rs.getInt("id"));
	                tarea.setTitulo(rs.getString("titulo"));
	                tarea.setDescripcion(rs.getString("descripcion"));
	                tarea.setFechaCreacion(rs.getDate("fecha_creacion").toLocalDate());
					tarea.setFechaVencimiento(rs.getDate("fecha_vencimiento").toLocalDate());    
	                tarea.setEstado(rs.getString("estado"));
	            }
	        }
	    }
	    return tarea;
	}

}