package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.MessageDisplay;

@WebServlet("/LogoutController")
public class LogoutController extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse rep){
		try {
			HttpSession s=req.getSession();
			s.removeAttribute("currentUser");
			MessageDisplay m= new MessageDisplay("Logout Succesfully","success","alert-success");
			s.setAttribute("msg", m);
			rep.sendRedirect("homepage1.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
