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
    <title>Update Participant</title>
    <style>
        .card {
            width: 400px;
            padding: 20px;
            margin: 0 auto;
            border: 1px solid #ddd;
            border-radius: 0px; /* No rounded corners */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<%
    // Retrieve form data from the request
    String participantId = request.getParameter("id");
    String partName = request.getParameter("partName");
    String partLastName = request.getParameter("partLastName");
    String partPhone = request.getParameter("partPhone");
    String partEmail = request.getParameter("partEmail");
    String partAddress = request.getParameter("partAddress");
    String password = request.getParameter("password");
    boolean isEmployed = request.getParameter("isEmployed") != null;

    // Connection and update logic
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        // Assuming you have a method to get the DB connection
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "root", "password");

        // SQL query to update participant details
        String updateQuery = "UPDATE participants SET partName = ?, partLastName = ?, partPhone = ?, partEmail = ?, partAddress = ?, password = ?, isEmployed = ? WHERE id = ?";
        preparedStatement = connection.prepareStatement(updateQuery);

        // Set the values to be updated
        preparedStatement.setString(1, partName);
        preparedStatement.setString(2, partLastName);
        preparedStatement.setString(3, partPhone);
        preparedStatement.setString(4, partEmail);
        preparedStatement.setString(5, partAddress);
        preparedStatement.setString(6, password);
        preparedStatement.setBoolean(7, isEmployed);
        preparedStatement.setString(8, participantId);

        // Execute the update query
        int rowsUpdated = preparedStatement.executeUpdate();

        if (rowsUpdated > 0) {
            out.println("<h3>Participant updated successfully.</h3>");
        } else {
            out.println("<h3>Error: Participant could not be updated.</h3>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<h3>Error: Could not update participant. Please try again later.</h3>");
    } finally {
        try {
            if (preparedStatement != null) preparedStatement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

    <div class="card">
        <h2>Update Participant Details</h2>
        <form action="EditParticipants.jsp" method="get">
            <input type="hidden" name="id" value="<%= participantId %>">
            <input type="submit" value="Back to Edit">
        </form>
        <form action="ParticipantList.jsp" method="get">
            <input type="submit" value="Back to List">
        </form>
    </div>
</body>
</html>
