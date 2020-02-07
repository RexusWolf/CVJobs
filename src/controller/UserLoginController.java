package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.SkillDao;
import database.UserDao;
import model.Skill;
import model.User;

@WebServlet("/signIn")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private UserDao userDao;
    private SkillDao skillDao;

    public void init() {
        userDao = new UserDao();
        skillDao = new SkillDao();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/view/login.jsp").forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User loggedUser = new User();
		ArrayList<Skill> skills = new ArrayList<Skill>();
		String email = request.getParameter("email");
        String password = request.getParameter("password");
        
		try {
			loggedUser = userDao.getUserByEmail(email);
			skills = skillDao.listUserSkills(loggedUser.getId());
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		
		if(!loggedUser.checkPassword(password)) {
			request.setAttribute("Error", "Incorrect email or password");
	    	request.getRequestDispatcher("/view/login.jsp").forward(request, response);
		} else {
			HttpSession session = request.getSession();
	    	session.setAttribute("skills", skills);
			session.setAttribute("loggedUser", loggedUser);
			response.sendRedirect("myProfile");
		}
	}
}
