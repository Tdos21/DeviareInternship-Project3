package com.zumbaclasses.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet(
		name = "LoginServlet", 
		urlPatterns = { 
				"/LoginServlet", 
				"/Login"
		})
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				String email = request.getParameter("txtEmail");
				String password = request.getParameter("txtPassword");
				
				System.out.println("[LoginServlet]User Details:"+email+" "+password);
				
				response.setContentType("text/html");
				String LoginTimeStamp = new Date().toString();
				String htmlResponse = "<center><h3>Welcome"+email+"</h3><p>You Logged in at "+LoginTimeStamp+"</p></center>";
				
				PrintWriter out = response.getWriter();
				out.print(htmlResponse);
	}

}
