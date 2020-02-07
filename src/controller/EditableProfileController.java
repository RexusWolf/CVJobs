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

@WebServlet("/myProfile")
public class EditableProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private User loggedUser;
	private UserDao userDao;
	private ArrayList<Skill> loggedUserSkills;
	private SkillDao skillDao;

    public void init() {
        userDao = new UserDao();
        skillDao = new SkillDao();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	updateLoggedUserInSession(request);
    	updateLoggedUserSkills(request);
    	request.getRequestDispatcher("/view/editableUserProfile.jsp").forward(request, response);
    }

	private void updateLoggedUserSkills(HttpServletRequest request) {
		loggedUserSkills = skillDao.listUserSkills(loggedUser.getId());
		System.out.println(loggedUserSkills.get(0));
    	request.getSession().setAttribute("skills", loggedUserSkills);

	}

	private void updateLoggedUserInSession(HttpServletRequest request) {
		loggedUser = (User) request.getSession().getAttribute("loggedUser");
    	userDao.getUserByEmail(loggedUser.getEmail());
    	request.getSession().setAttribute("loggedUser", loggedUser);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String email = request.getParameter("email");
        String city = request.getParameter("city");
        String country = request.getParameter("country");
        
        int userId = Integer.parseInt(request.getParameter("userId"));
        String name = request.getParameter("name");
        String period = request.getParameter("period");
        String content = request.getParameter("content");
        
        Skill skill = new Skill(userId, name, period, content);
       
        try {
        	userDao.updateUserProfileInfo(email, city, country);
        	skillDao.Add(skill);
        } catch (Exception exception) {
			exception.printStackTrace();
        }
		
        response.sendRedirect("myProfile");
	}
}
