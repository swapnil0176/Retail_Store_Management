package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RetailDAO;
import com.dto.MessageDisplay;
import com.dto.RetailDTO;


@WebServlet("/registeradmin")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	public void service(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
		RetailDTO dto=new RetailDTO();
		rep.setContentType("text/html");
		String fname=req.getParameter("fname");
		String mobile=req.getParameter("mobile");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		dto.setEmail(email);
		dto.setPassword(password);
		dto.setFname(fname);
		dto.setMobileno(mobile);
		
		
		RetailDAO dao= new RetailDAO(); 
		if(dao.registerAdmin(dto)) {
			rep.sendRedirect("Login.jsp");
		}
		else {
			MessageDisplay msg=new MessageDisplay("Username already taken","error","alert-danger");
			HttpSession s=req.getSession();
			s.setAttribute("msg",msg);
			rep.sendRedirect("Login.jsp");
		}
		
	}



}
