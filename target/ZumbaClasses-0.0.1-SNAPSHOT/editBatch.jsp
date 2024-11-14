<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Batch</title>
    <style>
        /* Basic page styling */
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

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin: 10px 0 5px;
            font-size: 14px;
        }

        input[type="text"], input[type="time"] {
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
        <h2>Edit Batch Details</h2>
        <form action="updateBatch.jsp" method="post">
            <label for="batchId">Batch ID:</label>
            <input type="text" id="batchId" name="batchId" value="<%= request.getParameter("batchId") %>" readonly>

            <label for="batchName">Batch Name:</label>
            <input type="text" id="batchName" name="batchName" value="<%= request.getParameter("batchName") %>" required>

            <label for="startTime">Start Time (HH:MM:SS):</label>
            <input type="time" id="startTime" name="startTime" value="<%= request.getParameter("startTime") %>" required>

            <label for="endTime">End Time (HH:MM:SS):</label>
            <input type="time" id="endTime" name="endTime" value="<%= request.getParameter("endTime") %>" required>

            <input type="submit" value="Update Batch">
        </form>
    </div>
</body>
</html>
