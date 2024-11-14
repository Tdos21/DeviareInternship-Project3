<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<%
    // Database connection details
    String dbURL = "jdbc:mysql://localhost:3306/funfil_db";
    String dbUser = "root";
    String dbPassword = "123@Ntara$!!";

    // Get username and password from the login form
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    boolean isAuthenticated = false;

    try {
        // Establish connection to the database
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        // Hash the input password to compare with the hashed password in the database
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashedPasswordBytes = md.digest(password.getBytes());
        StringBuilder hashedPassword = new StringBuilder();
        for (byte b : hashedPasswordBytes) {
            hashedPassword.append(String.format("%02x", b));
        }

        // Query to check if the admin exists with the provided username and hashed password
        String query = "SELECT * FROM admin WHERE username = ? AND password = ?";
        PreparedStatement statement = connection.prepareStatement(query);
        statement.setString(1, username);
        statement.setString(2, password);

        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()) {
            isAuthenticated = true;  // Credentials are valid
        }

        // Close connections
        resultSet.close();
        statement.close();
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("An error occurred while connecting to the database.");
    }

    if (isAuthenticated) {
        // Set session attribute and redirect to dashboard if authenticated
        session.setAttribute("loggedIn", true);
        response.sendRedirect("dashboard.jsp");
    } else {
        // Authentication failed, show an error message
        out.println("<p>Invalid username or password. Please try again.</p>");
        out.println("<a href='loginForm.jsp'>Go back to Login</a>");
    }
%>
