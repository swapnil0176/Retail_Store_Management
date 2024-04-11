package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.dto.RetailDTO;

public class RetailDAO {
	private String driver="com.mysql.cj.jdbc.Driver"; //Driver name
	private String url="jdbc:mysql://localhost:3306/retailstore";//url
	private String username="root";
	private String password="Swapnil@123";
	private final static String insertQuery="insert into admintable value(?,?,?,?)";
	private final static String findUsername="select * from admintable where admin_username=?";
	private final static String updateQuery="update admintable set password=? where email=?";
	private final static String selectQuery="select * from admintable where email=? and password=?";
	private final static String selectEmailAndMobile="select * from admintable where email=? and mobileno=?";
	
	protected Connection getConnection() {
		Connection con=null;
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url,username,password);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	public boolean registerAdmin(RetailDTO dto) {
		
		Connection con = getConnection();
		boolean result = false;
		try {
			PreparedStatement ps = con.prepareStatement(insertQuery);
			ps.setString(1, dto.getEmail());
			ps.setString(2, dto.getPassword());
			ps.setString(3, dto.getFname());
			ps.setString(4, dto.getMobileno());
			ps.executeUpdate();
			result=true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public int checkUsername(String username) {
	    int result = 0;
	    ResultSet rs = null;
	    Connection con = null;
	    PreparedStatement ps = null;
	    try {
	        con = getConnection();
	        ps = con.prepareStatement(findUsername);
	        ps.setString(1, username);
	        rs = ps.executeQuery();
	        if (rs.next()) {
	            result = 1;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (ps != null) {
	                ps.close();
	            }
	            if (con != null) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return result;
	}
	
	public int changePassword(String password,String email) {
		PreparedStatement ps=null;
		int result=0;
		try {
			Connection con=getConnection();
			ps=con.prepareStatement(updateQuery);
			ps.setString(1,password);
			ps.setString(2, email);
			ps.executeUpdate();
			result=1;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int forgotPassword(String email,String mobile) {
		PreparedStatement ps=null;
		ResultSet rs=null;
		try {
			Connection con=getConnection();
			ps=con.prepareStatement(selectEmailAndMobile);
			ps.setString(1,email);
			ps.setString(2,mobile);
			rs=ps.executeQuery();
			return 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
		
	}
	public RetailDTO getUsernameAndPassword(String email,String password) {
		RetailDTO dto=null;
		Connection con=getConnection();
		try {
			PreparedStatement ps=con.prepareStatement(selectQuery);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				dto=new RetailDTO();
				String email1=rs.getString("email");
				System.out.println(email1);
				dto.setEmail(rs.getString("email"));
				dto.setPassword(rs.getString("password"));
				dto.setFname(rs.getString("fname"));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
		
	}

	public static void main(String[] args) {
		RetailDAO dao=new RetailDAO();
		System.out.println(dao.getConnection());
		System.out.println("Value is= "+dao.checkUsername("Swapnil Rohidas Tawhare"));
	}
}
