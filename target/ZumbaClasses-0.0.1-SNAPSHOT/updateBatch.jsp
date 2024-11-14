<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.ServletException" %>
<%@ page import="javax.servlet.annotation.WebServlet" %>
<%@ page import="javax.servlet.http.HttpServlet" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpServletResponse" %>
<%@ page import="javax.servlet.RequestDispatcher" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Batch</title>
</head>
<body>
<%
    // Retrieve the updated batch information from the form
    String batchId = request.getParameter("batchId");
    String batchName = request.getParameter("batchName");
    String startTime = request.getParameter("startTime");
    String endTime = request.getParameter("endTime");

    // Connection and update logic
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        // Assuming you have a method to get the DB connection
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "root", "123@Ntara$!!");

        // SQL query to update the batch details
        String updateQuery = "UPDATE batches SET batchName = ?, startTime = ?, endTime = ? WHERE batchId = ?";

        preparedStatement = connection.prepareStatement(updateQuery);
        preparedStatement.setString(1, batchName);
        preparedStatement.setString(2, startTime);
        preparedStatement.setString(3, endTime);
        preparedStatement.setString(4, batchId);

        // Execute the update query
        int rowsUpdated = preparedStatement.executeUpdate();

        if (rowsUpdated > 0) {
            out.println("<h2>Batch updated successfully!</h2>");
            out.println("<a href='batchResult.jsp'>Go to Batch List</a>");
        } else {
            out.println("<h2>Error: Batch update failed!</h2>");
            out.println("<a href='Edit.jsp?batchId=" + batchId + "'>Try Again</a>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<h2>Error: " + e.getMessage() + "</h2>");
    } finally {
        // Close the resources
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
