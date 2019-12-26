package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import com.dto.Userbean;

public class UserDao {
	public static boolean checkCustomerData(String email) throws ClassNotFoundException, SQLException {

		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("Select * from user where email=?");

		ps.setString(1, email);

		ResultSet rs = ps.executeQuery();

		while (rs.next()) {

			return true;
		}

		return false;

	}
	
	public static boolean addCustomer(Userbean u) throws ClassNotFoundException, SQLException{
		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("insert into user(name,email,password) values(?,?,?)");
		ps.setString(1, u.getName());
		ps.setString(2, u.getEmail());
		ps.setString(3, u.getPassword());

		int b = ps.executeUpdate();

		if (b!=0) {
			return true;
		}
		return false;

}
	public static String checkCustomerDataForPassword(String email) throws ClassNotFoundException, SQLException {

		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("Select password from user where email=?");

		ps.setString(1, email);

		ResultSet rs = ps.executeQuery();
        while (rs.next()) {

			return rs.getString(1);
		}

		return null;

	}
	public static String getNameWithemail(String email,String pwd) throws ClassNotFoundException, SQLException {

		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("select name from user where email=? and password=?");

		ps.setString(1, email);
		ps.setString(2, pwd);

		ResultSet rs = ps.executeQuery();
        while (rs.next()) {

			return rs.getString(1);
		}

		return null;

	}
	public static String getIdWithNameAndeEmail(String email,String name) throws ClassNotFoundException, SQLException {

		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("select id from user where email=? and name=?");

		ps.setString(1, email);
		ps.setString(2,name);

		ResultSet rs = ps.executeQuery();
        while (rs.next()) {

			return rs.getString(1);
		}

		return null;

	}
}
