package com.zumbaclasses.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jakarta.servlet.annotation.WebServlet;
import java.io.PrintWriter;

@WebServlet("/participant")
public class ParticipantsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        // Fetch participants from database or list and return as JSON
        out.print("[{\"id\":1,\"name\":\"John Doe\"},{\"id\":2,\"name\":\"Jane Smith\"}]"); // Example response
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        // Add participant to database or list
        response.setContentType("application/json");
        response.getWriter().print("{\"message\":\"Participant added successfully\"}");
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        // Update participant in database or list
        response.setContentType("application/json");
        response.getWriter().print("{\"message\":\"Participant updated successfully\"}");
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        // Delete participant from database or list
        response.setContentType("application/json");
        response.getWriter().print("{\"message\":\"Participant deleted successfully\"}");
    }
}