<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Participant</title>
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
            width: 400px;
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

        label {
            display: block;
            margin: 10px 0 5px;
            font-size: 14px;
        }

        input[type="text"], input[type="email"], input[type="tel"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 3px;
            font-size: 14px;
        }

        input[type="submit"] {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Edit Participant</h2>
        
        <%
            // Retrieve the participant's ID from the request
            String participantId = request.getParameter("id");
            
            // Initialize participant data variables
            String firstName = "";
            String lastName = "";
            String phone = "";
            String email = "";
            String address = "";
            String password = "";
            boolean isEmployed = false;

            // Database connection details
            String url = "jdbc:mysql://localhost:3306/funfil_db";
            String dbUser = "root";
            String dbPassword = "123@Ntara$!!";
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            try {
                // Load JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Connect to the database
                connection = DriverManager.getConnection(url, dbUser, dbPassword);

                // Retrieve the participant's existing data
                String sql = "SELECT * FROM participants WHERE id = ?";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, participantId);
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    firstName = resultSet.getString("firstName");
                    lastName = resultSet.getString("lastName");
                    phone = resultSet.getString("phone");
                    email = resultSet.getString("email");
                    address = resultSet.getString("address");
                    password = resultSet.getString("password");
                    isEmployed = resultSet.getBoolean("isEmployed");
                }
            } catch (Exception e) {
                out.println("<p class='error'>Error loading participant data: " + e.getMessage() + "</p>");
            } finally {
                if (resultSet != null) try { resultSet.close(); } catch (SQLException e) { }
                if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException e) { }
                if (connection != null) try { connection.close(); } catch (SQLException e) { }
            }
        %>

        <!-- Edit participant form -->
        <form action="updateParticipant.jsp" method="post">
            <input type="hidden" name="id" value="<%= participantId %>">
            
            <label for="partName">First Name:</label>
            <input type="text" id="partName" name="partName" value="<%= firstName %>" required>
            
            <label for="partLastName">Last Name:</label>
            <input type="text" id="partLastName" name="partLastName" value="<%= lastName %>" required>
            
            <label for="partPhone">Phone Number:</label>
            <input type="tel" id="partPhone" name="partPhone" value="<%= phone %>" required>
            
            <label for="partEmail">Email:</label>
            <input type="email" id="partEmail" name="partEmail" value="<%= email %>" required>
            
            <label for="partAddress">Address:</label>
            <input type="text" id="partAddress" name="partAddress" value="<%= address %>">
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" value="<%= password %>" required>
            
            <label for="isEmployed">Employed:</label>
            <input type="checkbox" id="isEmployed" name="isEmployed" <%= isEmployed ? "checked" : "" %>>

            <input type="submit" value="Update Participant">
        </form>
    </div>
</body>
</html>
