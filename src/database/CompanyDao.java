package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import model.Company;

public class CompanyDao {
	public int Add(Company company) throws ClassNotFoundException {
		Connection connection;
		Statement statement;
		ResultSet resultset;
		String query = String.format(
				"INSERT INTO companies (name, activity) VALUES ('%s', '%s')", 
				company.name, company.activity);

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try{
        	connection = getConnection();
			statement = connection.createStatement();
			resultset = statement.executeQuery(query);
        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

	public ArrayList<Company> listCompanies() {
		Connection connection;
		Statement statement;
		ResultSet resultset;
		ArrayList<Company> companies = new ArrayList<Company>();
		String query = "SELECT * FROM companies";
		
		try {
			connection = getConnection();
			statement = connection.createStatement();
			resultset = statement.executeQuery(query);
			
			while(resultset.next()) {
				companies.add(getCompanyFromResultSet(resultset));
			}
			return companies;
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}
	

	private Connection getConnection() {
		Connection connection = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://oraclepr.uco.es:3306/i72rogup", "i72rogup", "practicapw");
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		
		return connection;
	}

	
	private Company getCompanyFromResultSet(ResultSet resultset) {
		try {
			Company company = new Company(
					resultset.getString("name"),
					resultset.getString("activity")
					);
			return company;
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

}