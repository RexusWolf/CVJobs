package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.CompanyDao;
import database.UserDao;
import model.Company;
import model.User;

@WebServlet("/newCompany")
public class NewCompanyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private CompanyDao companyDao;

    public void init() {
        companyDao = new CompanyDao();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        String activity = request.getParameter("activity");
        
        
        Company company = new Company(name, activity);
		
        try {
           companyDao.Add(company);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
