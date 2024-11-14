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
    <title>Edit Participant</title>
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
    // Retrieve participant ID from the URL
    String participantId = request.getParameter("id");

    // Connection and retrieval logic
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    String partName = "", partLastName = "", partPhone = "", partEmail = "", partAddress = "", password = "";
    boolean isEmployed = false;

    try {
        // Assuming you have a method to get the DB connection
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/your_database", "root", "password");

        // SQL query to fetch participant details based on ID
        String selectQuery = "SELECT * FROM participants WHERE id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(selectQuery);
        preparedStatement.setString(1, participantId);
        
        resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            // Fetch existing participant data
            partName = resultSet.getString("partName");
            partLastName = resultSet.getString("partLastName");
            partPhone = resultSet.getString("partPhone");
            partEmail = resultSet.getString("partEmail");
            partAddress = resultSet.getString("partAddress");
            password = resultSet.getString("password");
            isEmployed = resultSet.getBoolean("isEmployed");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

    <div class="card">
        <h2>Edit Participant Details</h2>
        <form action="UpdateParticipant.jsp" method="post">
            <input type="hidden" name="id" value="<%= participantId %>">
            
            <label for="partName">First Name:</label>
            <input type="text" id="partName" name="partName" value="<%= partName %>" required><br><br>

            <label for="partLastName">Last Name:</label>
            <input type="text" id="partLastName" name="partLastName" value="<%= partLastName %>" required><br><br>

            <label for="partPhone">Phone Number:</label>
            <input type="text" id="partPhone" name="partPhone" value="<%= partPhone %>" required><br><br>

            <label for="partEmail">Email:</label>
            <input type="email" id="partEmail" name="partEmail" value="<%= partEmail %>" required><br><br>

            <label for="partAddress">Address:</label>
            <input type="text" id="partAddress" name="partAddress" value="<%= partAddress %>" required><br><br>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="<%= password %>" required><br><br>

            <label for="isEmployed">Employed:</label>
            <input type="checkbox" id="isEmployed" name="isEmployed" <%= isEmployed ? "checked" : "" %>><br><br>

            <input type="submit" value="Update">
        </form>
    </div>

</body>
</html>
