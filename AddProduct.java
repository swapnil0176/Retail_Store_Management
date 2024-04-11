package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ProductDAO;
import com.dto.MessageDisplay;


@WebServlet("/addproduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	public void service(HttpServletRequest req, HttpServletResponse rep){
		try {
			String pname=req.getParameter("productName");
			int price=Integer.parseInt(req.getParameter("productPrice"));
			int quantity=Integer.parseInt(req.getParameter("productQuantity"));
			ProductDAO dao= new ProductDAO();
			if(dao.addProduct(pname,price,quantity)) {
				rep.sendRedirect("homepage2.jsp");
			}
			else {
				HttpSession h=req.getSession();
				MessageDisplay m= new MessageDisplay("Product already Exist","error","alert-danger");
				h.setAttribute("msg", m);
				rep.sendRedirect("addproducts.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
