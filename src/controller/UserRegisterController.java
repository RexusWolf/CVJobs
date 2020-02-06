package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.UserDao;
import model.User;

@WebServlet("/signUp")
public class UserRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private UserDao userDao;

    public void init() {
        userDao = new UserDao();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/view/register.jsp").forward(request, response);
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
        user.setUserName(username);
        user.setPassword(password);
        user.setEmail(email);

        try {
            userDao.registerUser(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
