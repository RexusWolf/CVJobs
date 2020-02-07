package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.CompanyDao;
import model.Company;

@WebServlet("/Company")
public class CompanyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    private CompanyDao companyDao;

    public void init() {
        companyDao = new CompanyDao();
    }
    
    // There is no view for creating companies
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
