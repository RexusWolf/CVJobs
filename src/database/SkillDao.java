package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.Skill;

public class SkillDao {
	public int Add(Skill skill) throws ClassNotFoundException {
		Connection connection;
		Statement statement;
		String query = String.format(
				"INSERT INTO skills (user_id, name, period, content) VALUES ('%s', '%s', '%s', '%s')", 
				skill.getUserId(), skill.getName(), skill.getPeriod(), skill.getContent());

        int result = 0;

        Class.forName("com.mysql.jdbc.Driver");

        try{
        	connection = getConnection();
			statement = connection.createStatement();
			statement.executeUpdate(query);
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

	public ArrayList<Skill> listUserSkills(int userId) {
		Connection connection;
		Statement statement;
		ResultSet resultset;
		ArrayList<Skill> skills = new ArrayList<Skill>();
		String query = String.format("SELECT * FROM skills WHERE user_id = '%d'", userId);
		
		try {
			connection = getConnection();
			statement = connection.createStatement();
			resultset = statement.executeQuery(query);
			
			while(resultset.next()) {
				skills.add(getSkillFromResultSet(resultset));
			}
			return skills;
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

	
	private Skill getSkillFromResultSet(ResultSet resultset) {
		try {
			Skill skill = new Skill(
					resultset.getInt("user_id"),
					resultset.getString("name"),
					resultset.getString("period"),
					resultset.getString("content")
					);
			return skill;
		} catch(Exception exception) {
			exception.printStackTrace();
		}
		return null;
	}

}
