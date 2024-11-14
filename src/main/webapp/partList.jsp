<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Participants</title>
    <style>
        /* Basic table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .container {
            width: 80%;
            margin: 0 auto;
        }

        .heading {
            text-align: center;
            margin: 20px 0;
        }
    </style>
</head>
<body>

<div class="container">
    <h1 class="heading">List of Participants</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Address</th>
                <th>Employed</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Database connection setup
                String url = "jdbc:mysql://localhost:3306/funfil_db";
                String dbUser = "root";
                String dbPassword = "123@Ntara$!!";
                Connection connection = null;
                Statement stmt = null;
                ResultSet resultSet = null;

                try {
                    // Load MySQL JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Establish connection
                    connection = DriverManager.getConnection(url, dbUser, dbPassword);

                    // Create SQL query to fetch all participants
                    String sql = "SELECT * FROM participants";
                    stmt = connection.createStatement();
                    resultSet = stmt.executeQuery(sql);

                    // Loop through the result set and display data
                    while (resultSet.next()) {
                        int id = resultSet.getInt("id");
                        String firstName = resultSet.getString("partName");
                        String lastName = resultSet.getString("partLastName");
                        String phone = resultSet.getString("partPhone");
                        String email = resultSet.getString("partEmail");
                        String address = resultSet.getString("partAddress");
                        String isEmployed = resultSet.getString("isEmployed");

            %>
            <tr>
                <td><%= id %></td>
                <td><%= firstName %></td>
                <td><%= lastName %></td>
                <td><%= phone %></td>
                <td><%= email %></td>
                <td><%= address %></td>
                <td><%= isEmployed %></td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    out.println("<p class='error'>An error occurred: " + e.getMessage() + "</p>");
                } finally {
                    // Close the resources
                    try {
                        if (resultSet != null) resultSet.close();
                        if (stmt != null) stmt.close();
                        if (connection != null) connection.close();
                    } catch (SQLException e) {
                        out.println("<p class='error'>Error closing resources: " + e.getMessage() + "</p>");
                    }
                }
            %>
        </tbody>
    </table>
    
    <br>
        <p><a href="participantForm.jsp">Create Participant</a></p>
</div>

</body>
</html>
