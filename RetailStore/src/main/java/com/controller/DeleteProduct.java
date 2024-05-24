package com.controller;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProductDAO;

@WebServlet("/delete")
public class DeleteProduct extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse rep){
		try {
			int pid=Integer.parseInt(req.getParameter("id"));
			ProductDAO dao= new ProductDAO();
			if(1==dao.deleteProduct(pid)) {
				rep.sendRedirect("homepage2.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
