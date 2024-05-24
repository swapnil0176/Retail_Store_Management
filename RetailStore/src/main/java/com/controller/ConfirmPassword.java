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

@WebServlet("/confirmpassword1")
public class ConfirmPassword extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
		HttpSession s=req.getSession();
		String email=(String) s.getAttribute("emailid");
		String newPass=req.getParameter("newpassword");
		RetailDAO dao=new RetailDAO();
		if(1!=dao.changePassword(newPass,email)) {
			
			MessageDisplay msg=new MessageDisplay("Error is occur","error","alert-danger");
			s=req.getSession();
			s.setAttribute("msg",msg);
			rep.sendRedirect("confirmpassword.jsp");
		}
		else {
			MessageDisplay msg=new MessageDisplay("Password change successfully","success","alert-success");
			s=req.getSession();
			s.setAttribute("msg",msg);
			rep.sendRedirect("Login.jsp");
			
		}
		
	}

}
