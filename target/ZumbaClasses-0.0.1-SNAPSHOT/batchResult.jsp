<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Batch Result</title>
    <style>
        /* Basic Styling */
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

        .success {
            color: green;
            font-weight: bold;
        }

        .error {
            color: red;
            font-weight: bold;
        }

        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Batch Result</h2>

        <%
            // Retrieve form data
            String batchId = request.getParameter("batchId");
            String batchName = request.getParameter("batchName");
            String startTime = request.getParameter("startTime");
            String endTime = request.getParameter("endTime");

            // Check and append :00 if time is in HH:MM format
            if (startTime != null && startTime.length() == 5) {
                startTime += ":00"; // Append seconds
            }
            if (endTime != null && endTime.length() == 5) {
                endTime += ":00"; // Append seconds
            }

            // Database connection setup
            String url = "jdbc:mysql://localhost:3306/funfil_db";
            String dbUser = "root";
            String dbPassword = "123@Ntara$!!";
            Connection connection = null;
            PreparedStatement preparedStatement = null;
            boolean isSaved = false;

            try {
                // Load MySQL JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish connection
                connection = DriverManager.getConnection(url, dbUser, dbPassword);

                // Insert batch data into the database
                String sql = "INSERT INTO batches (id,batchName, startTime, endTime) VALUES (?,?, ?, ?)";
                preparedStatement = connection.prepareStatement(sql);
                preparedStatement.setString(1, batchId);
                preparedStatement.setString(2, batchName);
                preparedStatement.setString(3, startTime);
                preparedStatement.setString(4, endTime);

                int rowsInserted = preparedStatement.executeUpdate();
                if (rowsInserted > 0) {
                    isSaved = true;
                }

            } catch (Exception e) {
                out.println("<p class='error'>An error occurred while saving data: " + e.getMessage() + "</p>");
            } finally {
                // Close resources
                if (preparedStatement != null) try { preparedStatement.close(); } catch (SQLException e) { }
                if (connection != null) try { connection.close(); } catch (SQLException e) { }
            }

            // Display result
            if (isSaved) {
        %>
                <p class="success">Batch saved successfully!</p>
                <table>
                    <tr>
                        <th>Batch Name</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                    </tr>
                    <tr>
                        <td><%= batchName %></td>
                        <td><%= startTime %></td>
                        <td><%= endTime %></td>
                    </tr>
                </table>
        <%
            } else {
        %>
                <p class="error">Failed to save batch data.</p>
        <%
            }
        %>
    </div>
</body>
</html>
