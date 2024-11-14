<!-- login.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        /* Basic styling for the page */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
        }

        /* Styling for the login card */
        .login-card {
            width: 300px;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border: 1px solid #ddd;
        }

        /* Remove rounded corners */
        .login-card, .login-card input, .login-card button {
            border-radius: 0;
        }

        /* Styling for the form elements */
        .login-card h2 {
            margin-top: 0;
            font-size: 24px;
            text-align: center;
            color: #333;
        }

        .login-card label {
            display: block;
            margin: 15px 0 5px;
            font-size: 14px;
            color: #333;
        }

        .login-card input[type="text"],
        .login-card input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .login-card input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .login-card input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="login-card">
        <h2>Admin Login</h2>
        <form action="LoginProcess.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Login">
        </form>
    </div>
</body></html>
