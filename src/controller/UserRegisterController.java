package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.UserDao;
import model.User;

@WebServlet("/registerUser")
public class UserRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.sendRedirect("./view/register.jsp");
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        User user = new User();
        user.setFirstName(firstname);
        user.setLastName(lastname);
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);

        try {
            userDao.registerUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("./view/userSuccessfullyCreated.jsp");
	}
}
