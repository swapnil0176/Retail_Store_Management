package com.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ProductDAO;
import com.dto.MessageDisplay;

@WebServlet("/updateProduct")
public class UpdateProduct extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse rep){
		try {
			String pname=req.getParameter("productName");
			String fname =req.getParameter("fname");
			int price=Integer.parseInt(req.getParameter("productPrice"));
			int quantity=Integer.parseInt(req.getParameter("productQuantity"));
			
			System.out.println("name "+pname+" price "+price+" Quantity"+quantity);
			ProductDAO dao= new ProductDAO();
			if(0!=dao.updateProduct(pname,price,quantity)) {
				HttpSession session=req.getSession();
				MessageDisplay m= new MessageDisplay("Product Updated Succesfully","success","alert-success");
				session.setAttribute("msg", m);
				rep.sendRedirect("editProduct.jsp");
			}
	
			else {
				HttpSession h=req.getSession();
				MessageDisplay m= new MessageDisplay("Error","error","alert-danger");
				h.setAttribute("msg", m);
				rep.sendRedirect("editProduct.jsp");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
