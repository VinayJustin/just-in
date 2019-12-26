package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.ProductBean;

public class ProductDao {
	public static List<String> getAllCategory() throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("select distinct category from product");
		ResultSet rs = ps.executeQuery();

		List<String> elist = new ArrayList<String>();

		while (rs.next()) {

			elist.add(rs.getString(1));
		}
		return elist;

	}

	public static List<ProductBean> getAllproductsList() throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("Select * from product");
		ResultSet rs = ps.executeQuery();

		List<ProductBean> elist = new ArrayList<ProductBean>();
		ProductBean p = null;
		while (rs.next()) {
			int id = rs.getInt(1);
			String name = rs.getString(2);
			int price = rs.getInt(3);
			String image_url = rs.getString(4);
			String category = rs.getString(5);
			p = new ProductBean();

			p.setId(id);
			p.setName(name);
			p.setPrice(price);
			p.setImage_url(image_url);
			p.setCategory(category);

			elist.add(p);
		}
		return elist;
	}

	public static List<ProductBean> getProductAllListWithCategory(String cat) throws ClassNotFoundException, SQLException {
		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("Select * from product where category= ? ");
		ps.setString(1, cat);

		ResultSet rs = ps.executeQuery();
		List<ProductBean> elist = new ArrayList<ProductBean>();
		ProductBean p = null;

		while (rs.next()) {
			int id = rs.getInt(1);
			String name = rs.getString(2);
			int price = rs.getInt(3);
			String image_url = rs.getString(4);
			String category = rs.getString(5);
			p = new ProductBean();

			p.setId(id);
			p.setName(name);
			p.setPrice(price);
			p.setImage_url(image_url);
			p.setCategory(category);

			elist.add(p);
		}

		return elist;
	}


	public static ProductBean getItemWithId(int id) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		Connection c = ConnectionUtility.getConnection();
		PreparedStatement ps = c.prepareStatement("Select * from product where id= ? ");
		ps.setInt(1,id);
		ResultSet rs = ps.executeQuery();
		 ProductBean p=null;
		 while(rs.next()){
			 p=new ProductBean(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getString(4),rs.getString(5));
			 return p;
			 
		 }
		return null;
	}
}
