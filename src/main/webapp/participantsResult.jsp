<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en"> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Participant Result</title>
    <style>
        /* Basic styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        
        .card {
            width: 900px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
        }
        
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        
        p {
            font-size: 14px;
            margin: 10px 0;
        }
        
        .success {
            color: green;
            font-weight: bold;
        }

        .error {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Participant Result</h2>
        
        <%
            // Retrieve form data
            String id = request.getParameter("id");
            String firstName = request.getParameter("partName");
            String lastName = request.getParameter("partLastName");
            String phone = request.getParameter("partPhone");
            String email = request.getParameter("partEmail");
            String address = request.getParameter("partAddress");
            boolean isEmployed = request.getParameter("isEmployed") != null;

            // Database connection setup
            String url = "jdbc:mysql://localhost:3306/funfil_db";
            String dbUser = "root";
            String dbPassword = "123@Ntara$!!";
            Connection connection = null;
            PreparedStatement participantStatement = null;
            PreparedStatement scheduleStatement = null;
            boolean isSaved = false;

            try {
                // Load MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish connection
                connection = DriverManager.getConnection(url, dbUser, dbPassword);

                // Insert data into participants table
                String participantSql = "INSERT INTO participants (id, partName, partLastName,partPhone, partEmail, partAddress,  isEmployed) VALUES ( ?, ?, ?, ?, ?, ?, ?)";
                participantStatement = connection.prepareStatement(participantSql);
                participantStatement.setString(1, id);
                participantStatement.setString(2, firstName);
                participantStatement.setString(3, lastName);
                participantStatement.setString(4, phone);
                participantStatement.setString(5, email);
                participantStatement.setString(6, address);
                participantStatement.setBoolean(7, isEmployed);

                int rowsInserted = participantStatement.executeUpdate();
                if (rowsInserted > 0) {
                    isSaved = true;

                    // Insert into morningSchedule if participant is employed
                    if (isEmployed) {
                        String scheduleSql = "INSERT INTO afternoonSchedule (id,partId, partName, partLastName) VALUES (1, ?, ?, ?)";
                        scheduleStatement = connection.prepareStatement(scheduleSql);
                        scheduleStatement.setString(1, id);
                        scheduleStatement.setString(2, firstName);
                        scheduleStatement.setString(3, lastName);
                        scheduleStatement.executeUpdate();
                    }else{
                    	String scheduleSql = "INSERT INTO morningSchedule (id,partId, partName, partLastName) VALUES (1, ?, ?, ?)";
                        scheduleStatement = connection.prepareStatement(scheduleSql);
                        scheduleStatement.setString(1, id);
                        scheduleStatement.setString(2, firstName);
                        scheduleStatement.setString(3, lastName);
                        scheduleStatement.executeUpdate();
                    }
                }

            } catch (Exception e) {
                out.println("<p class='error'>An error occurred while saving data: " + e.getMessage() + "</p>");
            } finally {
                // Close resources
                if (participantStatement != null) try { participantStatement.close(); } catch (SQLException e) { }
                if (scheduleStatement != null) try { scheduleStatement.close(); } catch (SQLException e) { }
                if (connection != null) try { connection.close(); } catch (SQLException e) { }
            }

            // Display result
            if (isSaved) {
        %>
                <p class="success">Participant saved successfully!</p>
        <%
            } else {
        %>
                <p class="error">Failed to save participant data.</p>
        <%
            }
        %>

        <!-- Display participant details -->
        <table border="1" cellpadding="5" cellspacing="0">
    <thead>
        <tr>
            <th>ID</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Email</th>
            <th>Address</th>
            <th>Phone</th>
            <th>isEmployed?</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><%= id %></td>
            <td><%= firstName %></td>
            <td><%= lastName %></td>
            <td><%= email %></td>
             <td><%= address %></td>
             <td><%= phone %></td>
             <td><%= isEmployed ? "Yes" : "No" %></td>
        </tr>
    </tbody>
</table>
  <br>
        <p><a href="participantForm.jsp">Create Participant</a></p>
    </div>
</body>
</html>
