package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.UserDao;

@WebServlet("/updateBiography")
public class UpdateUserBiographyController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private UserDao userDao;
    
    public void init() {
        userDao = new UserDao();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
        String biography = request.getParameter("biography");
       
        try {
        	userDao.updateUserBiography(email, biography);
        } catch (Exception exception) {
			exception.printStackTrace();
        }
        
		response.sendRedirect("myProfile");
	}
}
