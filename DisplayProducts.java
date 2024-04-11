package com.controller;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProductDAO;
import com.dto.ProductDTO;

@WebServlet("/displayProducts")
public class DisplayProducts extends HttpServlet {
	
	public void service(HttpServletRequest req, HttpServletResponse rep){
		try {
			ProductDAO products= new ProductDAO(); 
			List<ProductDTO> ll= products.displayAll();
			req.setAttribute("Products", ll);
			
			RequestDispatcher rd = req.getRequestDispatcher("displayproducts.jsp");
			rd.forward(req, rep);
			if(ll!=null) {
				
				for(ProductDTO a : ll) {
					System.out.println(a.getPid()+" "+a.getPname()+" "+a.getQuantity()+" "+a.getPrice());
				}
			}
			else {
				System.out.println("Data not found");
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
