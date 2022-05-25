package it.mgcg.controller;

import java.io.IOException;

import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.mgcg.beans.CartProduct;
import it.mgcg.beans.Order;
import it.mgcg.beans.OrderItem;
import it.mgcg.beans.Product;
import it.mgcg.beans.User;
import it.mgcg.model.Cart;
import it.mgcg.model.GenericDAO;
import it.mgcg.model.OrderDAO;
import it.mgcg.model.ProductDAO;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/Cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static GenericDAO<Product> model = new ProductDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
	}
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		request.setAttribute("active", "Cart");
		if (cart != null) {
			cart.getProducts();
		}
		if(cart==null) {		
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}
		// push product in cart
		// show cart page
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/site/cart.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Check action
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			request.getSession().setAttribute("cart", cart);
		}

		String action = request.getParameter("action");
		// If action == add
		try {
			if (action != null) {
				if (action.equals("add")) {
					Integer id = Integer.parseInt(request.getParameter("id"));
					cart.addProduct(model.doRetriveByKey(id));
					response.sendRedirect("Products");
					return;
				} else if (action.equals("remove")) {
					int id = Integer.parseInt(request.getParameter("id"));
					cart.deleteProduct(model.doRetriveByKey(id));
					response.sendRedirect("Cart");
					return;
				} else if (action.equals("removeAll")) {
					cart.deleteAll();
					response.sendRedirect("Cart");
					return;
				} else if (action.equals("update")) {
					int id = Integer.parseInt(request.getParameter("id"));
					int quantity = Integer.parseInt(request.getParameter("quantity"));
					if (quantity > 0) {
						cart.updateProduct(model.doRetriveByKey(id), quantity);
					}
					response.sendRedirect("Cart");
					return;
				} else {
					response.sendError(404);
				}
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
