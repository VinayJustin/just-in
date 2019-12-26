package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.OrdersDao;
import com.dao.OrdersDetailsDao;
import com.dao.ProductDao;
import com.dao.UserDao;
import com.dto.ProductBean;
import com.dto.Userbean;

@WebServlet("/master")
public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		try {
			List<String> list = ProductDao.getAllCategory();
			session.setAttribute("ilist", list);
			List<ProductBean> elist = ProductDao.getAllproductsList();
			session.setAttribute("list", elist);
			request.getRequestDispatcher("Login.jsp").forward(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		String button = request.getParameter("action");
		if (button.equals("Go")) {
			String category = request.getParameter("select");

			try {
				List<ProductBean> elist = ProductDao.getProductAllListWithCategory(category);
				request.setAttribute("list", elist);
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (button.equals("Filter")) {
			String category = request.getParameter("select");

			try {
				List<ProductBean> elist = ProductDao.getProductAllListWithCategory(category);
				session.setAttribute("list", elist);
				request.getRequestDispatcher("Home.jsp").forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (button.equals("Register")) {
			String name = request.getParameter("n1");
			String email = request.getParameter("n2");
			String password = request.getParameter("n3");

			try {
				boolean dbex = UserDao.checkCustomerData(email);

				if (dbex) {
					pw.print("<center><h5>Account already exists<h5></center>");
					request.getRequestDispatcher("Login.jsp").include(request, response);
				} else {
					Userbean user = new Userbean(name, email, password);

					boolean res = UserDao.addCustomer(user);

					if (res) {
						pw.print("<center><h5>Registration successful</h5></center>");
						request.getRequestDispatcher("Login.jsp").include(request, response);
					} else {
						pw.print("<center><h5>Registration failed</h5></center>");
						request.getRequestDispatcher("Login.jsp").include(request, response);
					}

				}

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else if (button.equals("Login")) {
			String email = request.getParameter("n4");
			String password = request.getParameter("n5");
			try {
				boolean dbex = UserDao.checkCustomerData(email);
				String pwd = UserDao.checkCustomerDataForPassword(email);
				String name = UserDao.getNameWithemail(email, pwd);
				int user_id = Integer.parseInt(UserDao.getIdWithNameAndeEmail(email, name));
				if (dbex) {
					if (password.equals(pwd)) {

						session.setAttribute("user_id", user_id);
						session.setAttribute("name", name);
						request.getRequestDispatcher("Home.jsp").forward(request, response);
					} else {
						pw.print("<center><h5>Invalid password</h5></center>");
						request.getRequestDispatcher("Login.jsp").include(request, response);
					}

				} else {
					pw.print("<center><h5>Invalid Credentials</h5></center>");
					request.getRequestDispatcher("Login.jsp").include(request, response);
				}
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		else if (button.equals("AddToCart")) {

			List<ProductBean> selectedItemsList = new ArrayList<ProductBean>();
			List<String> qList = new ArrayList<String>();
			int tp;
			String idList[] = new String[80];
			String quantities[] = new String[80];

			if (session.getAttribute("slist") == null) {
				idList = request.getParameterValues("id");
				quantities = request.getParameterValues("quantity");

				ProductBean pb = null;
				for (int i = 0; i < quantities.length; i++) {
					if (Integer.parseInt(quantities[i]) > 0) {
						try {
							pb = ProductDao.getItemWithId(Integer.parseInt(idList[i]));
							selectedItemsList.add(pb);
							qList.add(quantities[i]);

						} catch (NumberFormatException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (ClassNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

					}

				}
				tp = 0;

				for (int i = 0; i < qList.size(); i++) {

					tp += selectedItemsList.get(i).getPrice() * (Integer.parseInt(qList.get(i)));

				}

			} else {
				selectedItemsList = (List<ProductBean>) session.getAttribute("slist");
				qList = (List<String>) session.getAttribute("qList");
				tp = (Integer) (session.getAttribute("tp"));
				int qplist = qList.size();
				idList = request.getParameterValues("id");
				quantities = request.getParameterValues("quantity");

				ProductBean pb = null;
				for (int i = 0; i < quantities.length; i++) {
					if (Integer.parseInt(quantities[i]) > 0) {
						try {
							pb = ProductDao.getItemWithId(Integer.parseInt(idList[i]));
							selectedItemsList.add(pb);
							qList.add(quantities[i]);

						} catch (NumberFormatException | ClassNotFoundException | SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

					}
				}

				for (int i = qplist; i < qList.size(); i++) {

					tp += selectedItemsList.get(i).getPrice() * (Integer.parseInt(qList.get(i)));

				}

			}
			session.setAttribute("slist", selectedItemsList);
			session.setAttribute("tp", tp);
			session.setAttribute("qList", qList);
			request.getRequestDispatcher("Cart.jsp").forward(request, response);
		}

		if (button.equals("ContinueShopping")) {
			request.getRequestDispatcher("Home.jsp").forward(request, response);
		}
		if (button.equals("CheckOut")) {
			request.getRequestDispatcher("CheckOut.jsp").forward(request, response);
		}
		if (button.equals("Order")) {
			int tp = ((int) session.getAttribute("tp"));
			int uid = ((int) session.getAttribute("user_id"));

			Date d = new Date();
			Timestamp t = new Timestamp(d.getTime());

			try {
				boolean res = OrdersDao.insertOrder(uid, tp, t);

				if (res) {
					boolean s;int c =0;
					int order_id = OrdersDao.getOrderId(t);
					List<ProductBean> selectedItemsList = (List<ProductBean>) session.getAttribute("slist");
					List<String> qList = (List<String>) session.getAttribute("qList");
					for (int i = 0; i < selectedItemsList.size(); i++) {
						int selectedpid = selectedItemsList.get(i).getId();
						int selectedquantity = Integer.parseInt(qList.get(i));
						 s = OrdersDetailsDao.insertOrderDetails(order_id, selectedpid, selectedquantity);
						 if(s){
							 c++;
						 }
					}
					if(c==selectedItemsList.size()){
						request.getRequestDispatcher("final.jsp").forward(request, response);
					}
					else{
						pw.print("Ordered failed . Please order again");
						request.getRequestDispatcher("Home.jsp").forward(request, response);

					}
				}
			}

			catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if (button.equals("SignOut")) {
			request.getRequestDispatcher("logout.jsp").forward(request, response);
			
		}
	}
}