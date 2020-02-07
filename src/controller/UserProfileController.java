package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.SkillDao;
import database.UserDao;
import model.Skill;
import model.User;

@WebServlet("/profile")
public class UserProfileController extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
	
	private UserDao userDao;
	private SkillDao skillDao;

    public void init() {
        userDao = new UserDao();
        skillDao = new SkillDao();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int user_id = Integer.parseInt(request.getParameter("user_id"));
    	
    	User user = userDao.getUserById(user_id);
    	ArrayList<Skill> skills = skillDao.listUserSkills(user_id);
    	
    	request.setAttribute("profileUser", user);
    	request.setAttribute("skills", skills);
    	
		request.getRequestDispatcher("/view/userProfile.jsp").forward(request, response);
	}
}
