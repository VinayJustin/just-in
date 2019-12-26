package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

public class OrdersDao {

	public static boolean insertOrder(int uid, int tp, Timestamp t) throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("insert into orders(user_id,total_amount,order_date) values(?,?,?)");
		ps.setInt(1, uid);
		ps.setInt(2, tp);
	    ps.setTimestamp(3, t);
	  int b= ps.executeUpdate();
	  if (b!=0) {
			return true;
		}
		return false;

	}

	public static int getOrderId(Timestamp ordertime) throws ClassNotFoundException, SQLException {
			Connection c = ConnectionUtility.getConnection();
			PreparedStatement ps = c.prepareStatement("select id from orders where order_date=?");

			ps.setTimestamp(1, ordertime);
		

			ResultSet rs = ps.executeQuery();
	        while (rs.next()) {

				return rs.getInt(1);
			}

		return 0;
	}

}
