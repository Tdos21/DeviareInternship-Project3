<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Schedule Results</title>
    <style>
        /* Basic styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        h2 {
            text-align: center;
        }
    </style>
</head>
<body>
    <h2>Schedule Results</h2>

    <!-- Afternoon Schedule Table -->
    <h3>Afternoon Schedule</h3>
    <table>
        <thead>
            <tr>
                <th>Schedule ID</th>
                <th>Participant ID</th>
                <th>Participant Name</th>
                <th>Participant Last Name</th>
            </tr>
        </thead>
        <tbody>
        <% 
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            try {
                // Database connection setup
                String url = "jdbc:mysql://localhost:3306/funfil_db";
                String dbUser = "root";
                String dbPassword = "123@Ntara$!!";
                
                // Establish connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(url, dbUser, dbPassword);
                statement = connection.createStatement();

                // Query to retrieve data from afternoonSchedule
                String queryAfternoon = "SELECT * FROM afternoonSchedule";
                resultSet = statement.executeQuery(queryAfternoon);

                // Loop through and display results for afternoonSchedule
                while (resultSet.next()) {
        %>
                    <tr>
                        <td><%= resultSet.getInt("id") %></td>
                        <td><%= resultSet.getInt("partId") %></td>
                        <td><%= resultSet.getString("partName") %></td>
                        <td><%= resultSet.getString("partLastName") %></td>
                    </tr>
        <% 
                }
            } catch (Exception e) {
                out.println("<p class='error'>An error occurred: " + e.getMessage() + "</p>");
            } finally {
                // Close resources
                try {
                    if (resultSet != null) resultSet.close();
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
        </tbody>
    </table>

    <!-- Morning Schedule Table -->
    <h3>Morning Schedule</h3>
    <table>
        <thead>
            <tr>
                <th>Schedule ID</th>
                <th>Participant ID</th>
                <th>Participant Name</th>
                <th>Participant Last Name</th>
            </tr>
        </thead>
        <tbody>
        <% 
            try {
            	// Database connection setup
                String url = "jdbc:mysql://localhost:3306/funfil_db";
                String dbUser = "root";
                String dbPassword = "123@Ntara$!!";
                
                // Establish connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(url, dbUser, dbPassword);
                statement = connection.createStatement();

                // Query to retrieve data from morningSchedule
                String queryMorning = "SELECT * FROM morningSchedule";
                resultSet = statement.executeQuery(queryMorning);

                // Loop through and display results for morningSchedule
                while (resultSet.next()) {
        %>
                    <tr>
                        <td><%= resultSet.getInt("id") %></td>
                        <td><%= resultSet.getInt("partId") %></td>
                        <td><%= resultSet.getString("partName") %></td>
                        <td><%= resultSet.getString("partLastName") %></td>
                    </tr>
        <% 
                }
            } catch (Exception e) {
                out.println("<p class='error'>An error occurred: " + e.getMessage() + "</p>");
            } finally {
                // Close resources
                try {
                    if (resultSet != null) resultSet.close();
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
        </tbody>
    </table>
</body>
</html>
