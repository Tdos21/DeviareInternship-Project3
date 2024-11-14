<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Check if the user is logged in
    Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");

    if (loggedIn == null || !loggedIn) {
        // If not logged in, redirect to login page
        response.sendRedirect("loginForm.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        /* Basic styling for the dashboard */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            text-align: center;
            margin: 0;
            padding: 0;
        }
        h2 {
            margin-top: 20px;
        }
        .dashboard-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            margin-top: 40px;
        }
        .card {
            background-color: #fff;
            width: 250px;
            margin: 20px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: 0.3s;
        }
        .card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }
        .card h3 {
            margin: 10px 0;
            color: #333;
        }
        .card a {
            display: inline-block;
            padding: 10px 15px;
            margin-top: 15px;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .card a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h2>Welcome to the Admin Dashboard</h2>
    <p>This page is only accessible to authenticated users.</p>

    <div class="dashboard-container">
        <!-- Card for Creating Participants -->
        <div class="card">
            <h3>Create Participants</h3>
            <p>Click below to add new participants to the system.</p>
            <a href="participantForm.jsp">Go to Create Participants</a>
        </div>

        <!-- Card for Creating Batches -->
        <div class="card">
            <h3>Create Batches</h3>
            <p>Click below to set up new batches in the system.</p>
            <a href="batchForm.jsp">Go to Create Batches</a>
        </div>
        
        <div class="card">
            <h3>Participants List</h3>
            <p>Click below to see list of all participants.</p>
            <a href="partList.jsp">Go to List</a>
        </div>
        
        <div class="card">
            <h3>Schedules and Participants</h3>
            <p>Click below to see schedule with participants.</p>
            <a href="zumbaSchedules.jsp">Go to Schedules</a>
        </div>
    </div>

    <p><a href="logout.jsp">Logout</a></p>
</body>
</html>
