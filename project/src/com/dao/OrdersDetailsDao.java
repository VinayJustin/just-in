package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.dto.OrderDetailsBean;


public class OrdersDetailsDao {
	
		public static boolean insertOrderDetails(int oid, int pid, int q) throws ClassNotFoundException, SQLException {
			Connection c = ConnectionUtility.getConnection();
			PreparedStatement ps = c.prepareStatement("insert into order_details(order_id,product_id,quantity) values(?,?,?)");
			ps.setInt(1, oid);
			ps.setInt(2, pid);
		    ps.setInt(3, q);
		  int i= ps.executeUpdate();
		    if(i>0){
		    	return true;
		    }
		    
			return false;
		}

		



}
