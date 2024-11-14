<!-- logout.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate the session to log out the user
    session.invalidate();
    response.sendRedirect("loginForm.jsp"); // Redirect to login page
%>
