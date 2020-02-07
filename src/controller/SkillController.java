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
import model.Skill;
import model.User;

/**
 * Servlet implementation class SkillController
 */
@WebServlet("/Skills")
public class SkillController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private SkillDao skillDao;

    public void init() {
        skillDao = new SkillDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("profileUser");
		int userId = user.getId();
    	ArrayList<Skill> skills = skillDao.listUserSkills(userId);
    	System.out.println(userId);
    	request.setAttribute("skills", skills);
    	request.getRequestDispatcher("/view/userProfile.jsp").forward(request, response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userId = Integer.parseInt(request.getParameter("userId"));
        String name = request.getParameter("name");
        String period = request.getParameter("period");
        String content = request.getParameter("content");
        
        Skill skill = new Skill(userId, name, period, content);
		
        try {
           skillDao.Add(skill);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
