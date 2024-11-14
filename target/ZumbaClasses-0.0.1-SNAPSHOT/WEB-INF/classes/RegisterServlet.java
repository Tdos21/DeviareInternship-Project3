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
 * Servlet implementation class RegisterServlet
 */
@WebServlet({ "/RegisterServlet", "/Register" })
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("txtName");
		String lastname = request.getParameter("txtLastname");
		String email = request.getParameter("txtEmail");
		String address = request.getParameter("txtAddress");
		String phone = request.getParameter("txtPhone");
		String password = request.getParameter("txtPassword");
		
		System.out.println("[RegisterServlet]User Details:"+name+""+email+" "+password);
		
		response.setContentType("text/html");
		String RegisterTimeStamp = new Date().toString();
		String htmlResponse = "<center><h3>Thank you "+name+"</h3><p>You Registered with this email "+email+"at"+RegisterTimeStamp+" time</p></center>";
		
		PrintWriter out = response.getWriter();
		out.print(htmlResponse);
	}

}
