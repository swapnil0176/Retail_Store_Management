package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.dto.ProductDTO;
import com.dao.RetailDAO;

public class ProductDAO {
	private String driver = "com.mysql.cj.jdbc.Driver"; // Driver name
	private String url = "jdbc:mysql://localhost:3306/retailstore";// url
	private String username = "root";
	private String password = "Swapnil@123";
	private final static String selectQuery = "select * from product";
	private final static String searchQuery = "select * from product where pname=?";
	private final static String insertQuery = "insert into product value(?,?,?,?)";
	private final static String deleteQuery = "delete from product where pid=?";
	private final static String updateQuery = "update product set quantity=?,price=? where pname=?";

	private Connection getConnection() {
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public ArrayList<ProductDTO> displayAll() {
		ArrayList<ProductDTO> products = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Connection con = getConnection();
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery();
			while (rs.next()) {
				ProductDTO p = new ProductDTO();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPrice(rs.getInt(3));
				p.setQuantity(rs.getInt(4));
				products.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return products;
	}

	public boolean addProduct(String pname, int price, int quantity) {
		boolean flag = false;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Connection con = getConnection();
			ps = con.prepareStatement(selectQuery);
			rs = ps.executeQuery("select * from product");
			int id = 0;
			while (rs.next()) {
				id = rs.getInt(1);
			}
			ps = con.prepareStatement(insertQuery);
			System.out.println("Value of id is " + id);
			ps.setInt(1, ++id);
			ps.setString(2, pname);
			ps.setInt(3, quantity);
			ps.setInt(4, price);
			ps.execute();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public int deleteProduct(int pid) {
		PreparedStatement ps = null;
		int result = 0;
		try {
			Connection con = getConnection();
			ps = con.prepareStatement(deleteQuery);
			ps.setInt(1, pid);
			result = ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public LinkedList<ProductDTO> searchProduct(String pname) {
		LinkedList<ProductDTO> products = null;
		ProductDTO product = new ProductDTO();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Connection con = getConnection();
			ps = con.prepareStatement(searchQuery);
			ps.setString(1, pname);
			System.out.println("Hello before rs");
			rs = ps.executeQuery();
			System.out.println("Hello before if");
			System.out.println("Value of rs" + rs);
			if (rs.next()) {
				products = new LinkedList();
				product.setPid(rs.getInt(1));
				product.setPname(rs.getString(2));
				product.setQuantity(rs.getInt(3));
				product.setPrice(rs.getInt(4));
				products.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(products);
		return products;
	}

	public int updateProduct(String pname, int price, int quantity) {
		int flag=0;
		Connection con=getConnection();
		PreparedStatement ps=null;
		try{
			ps=con.prepareStatement(updateQuery);
			ps.setInt(1,quantity);
			ps.setInt(2,price);
			ps.setString(3, pname);
			flag=ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
}
