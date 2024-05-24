package com.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.RetailDAO;
import com.dto.MessageDisplay;
import com.dto.RetailDTO;


@WebServlet("/login")
public class LoginController extends HttpServlet {

	public void service(HttpServletRequest req,HttpServletResponse rep) {
		String user=null,pass=null;
		try {
			rep.setContentType("text/html");
			user=req.getParameter("email");
			pass=req.getParameter("password");
			RetailDAO dao=new RetailDAO();
			RetailDTO dto=dao.getUsernameAndPassword(user, pass);
			if(dto==null) {
				MessageDisplay msg=new MessageDisplay("Invalid username or Password","error","alert-danger");
				HttpSession s=req.getSession();
				s.setAttribute("msg",msg);
				rep.sendRedirect("Login.jsp");	
			}
			else {
				HttpSession s=req.getSession();
				s.setAttribute("currentUser", dto);
				rep.sendRedirect("homepage2.jsp");
			}
						
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}


}
