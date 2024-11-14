package com.zumbaclasses;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DB {
	
	public static Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/funfil_db";
        String user = "root";
        String password = "123@Ntara$!!";
        return DriverManager.getConnection(url, user, password);
    }
	
	/*public static Connection getConnection() throws SQLException {
        try {
            // Register the MySQL JDBC driver (if needed)
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        // Establish the connection
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/funfil_db", "root", "123@Ntara$!!");
    }
	
	/*Connection connection;
	
	
	private static DB db = new DB();
	/*public DB() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost/funfil_db";
			String user = "root";
			String password = "123@Ntara$!!";
			connection = DriverManager.getConnection(url,user,password);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	*/
	
	/*public DB getConnection() {
		return db;
	}
	/*
	public int executeUpdate(PreparedStatement preparedStatements) {
		int result = 0;
		try {
			result = preparedStatements.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public ResultSet executeQuery(PreparedStatement statement) {
		ResultSet set = null;
		try {
			int result = statement.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return set;
	}
	public void closeConnection() {
		try {
			connection.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
*/
}
