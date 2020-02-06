package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.UserDao;
import model.User;

@WebServlet("/editBiography")
public class EditBiographyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private UserDao userDao;
    
    public void init() {
        userDao = new UserDao();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/view/login.jsp").forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = new User();
		String email = request.getParameter("email");
        String biography = request.getParameter("biography");
       
        try {
        	System.out.println(email);
        	System.out.println(biography);
        	userDao.updateUserBiography(email, biography);
        	user = userDao.getUserByEmail(email);
        } catch (Exception exception) {
			exception.printStackTrace();
        }
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		response.sendRedirect("view/userProfile.jsp");
	}
}
