package com.zumbaclasses;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;


public class BatchesCRUD {

	public static void createBatch(String batchName
			, Timestamp startTime, Timestamp endTime) {
        String sql = "INSERT INTO batches (batchName"
        		+ ",startTime, endTime) VALUES (?, ?, ?)";
        try (Connection conn = DB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, batchName);
            pstmt.setTimestamp(2, startTime);
            pstmt.setTimestamp(3, endTime);

            int rowsInserted = pstmt.executeUpdate();
            System.out.println(rowsInserted > 0 ? "User added successfully!" : "Insert failed");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	public static void deleteBatch(int id) {
        String sql = "DELETE FROM batches WHERE id = ?";
        try (Connection conn = DB.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);

            int rowsDeleted = pstmt.executeUpdate();
            System.out.println(rowsDeleted > 0 ? "Batch deleted successfully!" : "Delete failed");

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
}
