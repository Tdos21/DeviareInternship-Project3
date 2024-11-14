<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Participant</title>
    <style>
        /* Basic styling for the page and card */
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
            height: 700px;
            width: 400px;
            padding: 40px;
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
        
        input[type="text"],
        input[type="email"],
        input[type="password"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 3px;
            font-size: 14px;
        }
        
        input[type="checkbox"] {
            margin-bottom: 15px;
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
        <h2>Create Participant</h2>
        <form action="participantsResult.jsp" method="post">
        
        <label for="id">Participant ID:</label>
            <input type="text" id="id" name="id" required>

            <label for="partName">First Name:</label>
            <input type="text" id="partName" name="partName" required>

            <label for="partLastName">Last Name:</label>
            <input type="text" id="partLastName" name="partLastName" required>

            <label for="partPhone">Phone Number:</label>
            <input type="text" id="partPhone" name="partPhone" required>
            <label for="partEmail">Email:</label>
            <input type="email" id="partEmail" name="partEmail" required>

            <label for="partAddress">Address:</label>
            <input type="text" id="partAddress" name="partAddress" required>
             
             
            <label for="isEmployed">Employed:</label>
            <input type="checkbox" id="isEmployed" name="isEmployed">
        
        
            <input type="submit" value="Create Participant">
        </form>
    </div>
</body>
</html>
