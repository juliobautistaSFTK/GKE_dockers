package com.softtek.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	private static final String URL = "jdbc:mariadb://mariadb_1:3306/taskmanager";
	private static final String USER = "root";
	private static final String PASSWORD = "12345678";

	public static Connection getConnection() throws SQLException {
		Connection conn =null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {
			throw new SQLException("Error cargando el driver JDBC de MariaDB", e);
		       
		} catch (SQLException e) {
			throw e;
		}
		return conn;
	}
}