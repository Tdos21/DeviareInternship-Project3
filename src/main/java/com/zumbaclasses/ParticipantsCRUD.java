package com.zumbaclasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ParticipantsCRUD {

	public static void createUser(String participantName
			, String participantLastName, String participantEmail,
			String participantAddress,int participantPhone,
			String participantPassword, boolean isEmployed) {
        String sql = "INSERT INTO participants (partName,partLastName,"
        		+ "partEmail,partPhone,password,"
        		+ " isEmployed,partAddress) VALUES (?, ?, ?,?,?,?)";
        try (Connection conn = DB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, participantName);
            pstmt.setString(2, participantLastName);
            pstmt.setString(3, participantEmail);
            pstmt.setString(3, participantAddress);
            pstmt.setInt(3, participantPhone);
            pstmt.setString(3, participantPassword);
            pstmt.setBoolean(3, isEmployed);

            int rowsInserted = pstmt.executeUpdate();
            System.out.println(rowsInserted > 0 ? "User added successfully!" : "Insert failed");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	
	public static void readUser(int id) {
        String sql = "SELECT * FROM Participants WHERE id = ?";
        try (Connection conn = DB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);

            ResultSet resultSet = pstmt.executeQuery();
            while (resultSet.next()) {
                System.out.println("ID: " + resultSet.getInt("id"));
                System.out.println("Name: " + resultSet.getString("partName"));
                System.out.println("Email: " + resultSet.getString("partLastName"));
                System.out.println("Age: " + resultSet.getInt("partPhone"));
                System.out.println("Age: " + resultSet.getString("partEmail"));
                System.out.println("Age: " + resultSet.getString("partAddress"));
                System.out.println("Age: " + resultSet.getString("password"));
                System.out.println("Age: " + resultSet.getBoolean("isEmployed"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	public static void updateUser(int id, String partName, String partLastName
			, int partPhone, String partEmail, String partAddress, String password,
			boolean isEmployed) {
        String sql = "UPDATE participants SET partName = ?, partLastName = ?, partPhone = ?,"
        		+ "partAddress = ?, partEmail = ?, password = ?, isEmployed = ? WHERE id = ?";
        try (Connection conn = DB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

        	pstmt.setString(1, partName);
            pstmt.setString(2, partLastName);
            pstmt.setString(3, partEmail);
            pstmt.setString(3, partAddress);
            pstmt.setInt(3, partPhone);
            pstmt.setString(3, password);
            pstmt.setBoolean(3, isEmployed);

            int rowsUpdated = pstmt.executeUpdate();
            System.out.println(rowsUpdated > 0 ? "User updated successfully!" : "Update failed");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	public static void deleteUser(int id) {
        String sql = "DELETE FROM participants WHERE id = ?";
        try (Connection conn = DB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);

            int rowsDeleted = pstmt.executeUpdate();
            System.out.println(rowsDeleted > 0 ? "User deleted successfully!" : "Delete failed");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
