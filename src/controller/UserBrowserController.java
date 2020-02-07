package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.CompanyDao;
import database.UserDao;
import model.Company;
import model.User;


@WebServlet("/UserBrowser")
public class UserBrowserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	ArrayList<User> users = new ArrayList<User>();
    	String firstname = request.getParameter("firstname");
    	String lastname = request.getParameter("lastname");
    	String pageNullable = request.getParameter("page");
    	
    	int page = getPage(pageNullable);
    	
    	users = userDao.paginatedGetUserByName(firstname, lastname, page);
    	
    	System.out.print(users);
    	request.setAttribute("resultUsers", users);
    	request.getRequestDispatcher("/view/userBrowser.jsp").forward(request, response);
    }
    	
    	
    private int getPage(String pageParameter) {
    	int page = 0;
    	
    	if (pageParameter != null) {
    		page = Integer.parseInt(pageParameter);
    	}
    	return page;
    }
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String firstname = request.getParameter("firstname");
    	String lastname = request.getParameter("lastname");
    	
    	response.sendRedirect(String.format("/CVJobs/UserBrowser?firstname=%s&lastname=%s", firstname, lastname));
    }
}
