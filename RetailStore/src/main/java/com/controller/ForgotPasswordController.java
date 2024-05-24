package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RetailDAO;

@WebServlet("/forgotpassword1")
public class ForgotPasswordController extends HttpServlet {
	
	
	public void service(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
		
		String email=req.getParameter("email");
		String mobile=req.getParameter("mobile");
		RetailDAO dao=new RetailDAO();
		if(1!=dao.forgotPassword(email,mobile)) {
			rep.sendRedirect("forgotPass.jsp");
		}
		else {
			HttpSession s=req.getSession();
			s.setAttribute("emailid", email);
			rep.sendRedirect("confirmpassword.jsp");
		
		}
		
	}

}
