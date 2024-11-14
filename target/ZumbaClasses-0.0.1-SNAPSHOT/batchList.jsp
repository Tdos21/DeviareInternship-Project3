<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Batch List</title>
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
    <h2>Batch List</h2>
    
    <table>
        <thead>
            <tr>
                <th>Batch ID</th>
                <th>Batch Name</th>
                <th>Start Time</th>
                <th>End Time</th>
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

                // Query to retrieve data from batches table
                String query = "SELECT * FROM batches";
                resultSet = statement.executeQuery(query);

                // Loop through and display results for batches
                while (resultSet.next()) {
        %>
                    <tr>
                        <td><%= resultSet.getInt("id") %></td>
                        <td><%= resultSet.getString("batchName") %></td>
                        <td><%= resultSet.getString("startTime") %></td>
                        <td><%= resultSet.getString("endTime") %></td>
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
    <br>
        <p><a href="batchForm.jsp">Create Batch</a></p>
</body>
</html>
