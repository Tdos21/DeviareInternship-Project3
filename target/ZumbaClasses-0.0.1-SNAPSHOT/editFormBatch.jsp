<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> -->
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

        /* Card styling */
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

        input[type="text"] {
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
        <form action="UpdateBatch.jsp" method="post">
            <!-- Hidden field to store the batch ID -->
            <input type="hidden" name="batchId" value="${batchId}">

            <label for="batchName">Batch Name:</label>
            <input type="text" id="batchName" name="batchName" value="${batchName}" required>

            <label for="startTime">Start Time (HH:MM:SS):</label>
            <input type="time" id="startTime" name="startTime" value="${startTime}" required>

            <label for="endTime">End Time (HH:MM:SS):</label>
            <input type="time" id="endTime" name="endTime" value="${endTime}" required>

            <input type="submit" value="Update Batch">
        </form>
    </div>
</body>
</html>
