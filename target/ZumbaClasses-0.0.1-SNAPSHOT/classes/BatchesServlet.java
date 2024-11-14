

import javax.servlet.*;
import javax.servlet.http.*;

import com.zumbaclasses.DB;

import java.io.*;
import java.sql.*;

public class BatchesServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String batchId = request.getParameter("batchId");
        String batchName = request.getParameter("batchName");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");

        // Database connection and SQL query
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            // Get the DB connection from DBUtil
            connection = DB.getConnection();

            // SQL query to insert the batch details
            String insertQuery = "INSERT INTO batches (batchId, batchName, startTime, endTime) VALUES (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertQuery);

            // Set the values from the form data
            preparedStatement.setString(1, batchId);
            preparedStatement.setString(2, batchName);
            preparedStatement.setString(3, startTime);
            preparedStatement.setString(4, endTime);

            // Execute the query
            int rowsInserted = preparedStatement.executeUpdate();

            // Check if the insert was successful
            if (rowsInserted > 0) {
                response.sendRedirect("batchResult.jsp?success=true");
            } else {
                response.sendRedirect("batchResult.jsp?success=false");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("batchResult.jsp?success=false");
        } finally {
            try {
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
