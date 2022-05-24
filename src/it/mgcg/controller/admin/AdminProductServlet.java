package it.mgcg.controller.admin;

import java.io.IOException;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.mgcg.beans.Category;
import it.mgcg.beans.Order;
import it.mgcg.beans.Product;
import it.mgcg.model.CategoryDAO;
import it.mgcg.model.OrderDAO;
import it.mgcg.model.ProductDAO;

/**
 * Servlet implementation class AdminProductServlet
 */
@WebServlet("/Admin/Products")
public class AdminProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		var action = request.getParameter("action");
		if(action == null) {
			index(request,response);
			return;
		} else {
			if(action.equals("view")) {
				doView(request, response);
				return;
			} else if (action.equals("create")) {
				create(request, response);
				return;
			} else if (action.equals("edit")) {
				doEdit(request, response);
				return;
			}
		}
	}
	private void doView(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO dao = new ProductDAO();
		int id = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
		try {
			Product prod = dao.doRetriveByKey(id);
			request.setAttribute("prod", prod);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/admin/products/view.jsp");
		dispatcher.forward(request, response);
		return;
	}

	private void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		var cdao = new CategoryDAO();
		try {
			request.setAttribute("categories", cdao.doRetrieveAll("name"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/WEB-INF/views/admin/products/create.jsp");
		dispatcher.forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		var action = request.getParameter("action");
		
		if(action == null) {
		} else if(action.equals("create")) {
			save(request,response);
			return;
		} else if (action.equals("put")) {
			doPut(request, response);
			return;
		} else if (action.equals("delete")) {
			doDelete(request, response);
			return;
		}
	}
	
	private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO products = new ProductDAO();
		//TODO Validate product form
		Product product = new Product(request.getParameter("name"), request.getParameter("description"),
				request.getParameter("shortDescription"), request.getParameter("metaDescription"),
				request.getParameter("metaKeyword"), Double.parseDouble(request.getParameter("weight")),
				Double.parseDouble(request.getParameter("price")),
				Double.parseDouble(request.getParameter("discount")),
				Integer.parseInt(request.getParameter("quantity")),
				Integer.parseInt(request.getParameter("onSale")),
				(request.getParameter("available") == null ? false : true));
		product.setTax(Integer.parseInt(request.getParameter("tax")));
		String[] categories = request.getParameterValues("categories");
		if(categories != null)
			Arrays.asList(categories).forEach((e) -> {
				product.addCategory(new Category(Integer.parseInt(e)));
			});
		System.out.println(product.getCategories().size());
		try {			
			products.doSave(product);
			response.sendRedirect(request.getServletContext().getContextPath()+"/Admin/Products");
			return;
		} catch (SQLException e) {
			System.out.println("Error insert Product");
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/admin/products/create.jsp");
		dispatcher.forward(request, response);
	}

	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		// TODO dispatch page to view all product information 10 per page
		var offset = request.getParameter("page") == null ? 10 : request.getParameter("offset");
		var page = request.getParameter("page") == null ? 1 : request.getParameter("page");
		var order = request.getParameter("order") == null ? "id" : request.getParameter("order");
		ProductDAO dao = new ProductDAO();
		try {
			//TODO Collection<Order> products  = dao.doRetrieveSome(order, ((((int)page-1)*((int)offset)+1))   , (int) offset);
			Collection<Product> products = dao.doRetrieveAll("name");
			request.removeAttribute("products");
			request.setAttribute("products", products);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/admin/products/index.jsp");
			dispatcher.forward(request, response);
			return;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//TODO RISPONDI 
		
	}
	
	private void doEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Product prod = null;
		var model = new ProductDAO();
		var cdao = new CategoryDAO();
		try {
			prod = model.doRetriveByKey(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("categories", cdao.doRetrieveAll("name"));
		} catch(SQLException e) {
			e.printStackTrace();
			response.sendError(500);
			return;
		}
		request.setAttribute("bean", prod);
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/admin/products/edit.jsp");
		dispatcher.forward(request, response);
	}
	
	@Override
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDAO product = new ProductDAO();
		try {
			product.doDelete(Integer.parseInt(request.getParameter("id")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
			System.out.println("Error with delete product id" + request.getParameter("id"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect(getServletContext().getContextPath()+"/Admin/Products");
	}


	@Override
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String error = null;
		ProductDAO products = new ProductDAO();
		Product product = new Product(Integer.parseInt(request.getParameter("id")), request.getParameter("name"),
				request.getParameter("description"), request.getParameter("shortDescription"),
				request.getParameter("metaDescription"), request.getParameter("metaKeyword"),
				Double.parseDouble(request.getParameter("price")), Double.parseDouble(request.getParameter("discount")),
				Integer.parseInt(request.getParameter("quantity")), Integer.parseInt(request.getParameter("onSale")),
				(request.getParameter("available") == null ? false : true));
		product.setTax(Integer.parseInt(request.getParameter("tax")));
		String[] categories = request.getParameterValues("categories");
		if(categories != null)
			Arrays.asList(categories).forEach((e) -> {
				product.addCategory(new Category(Integer.parseInt(e)));
			});
		try {
			if (products.doUpdate(product) > 0) {
				response.sendRedirect(request.getServletContext().getContextPath()+"/Admin/Products");
				return;
			} else {
				error = "Update Failed";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.setAttribute("error", error);
		RequestDispatcher dispatcher = request.getServletContext()
				.getRequestDispatcher("/WEB-INF/views/admin/products/edit.jsp");
		dispatcher.forward(request, response);

	}
}

