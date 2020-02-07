package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.User;

public class UserDao {
	private int PAGE_LIMIT = 20;
	
	public int registerUser(User user) throws ClassNotFoundException {
		String INSERT_USERS_SQL = "INSERT INTO users" + "  (firstname, lastname, username, password, email) VALUES "
				+ " (?, ?, ?, ?, ?);";

		int result = 0;
		

		Class.forName("com.mysql.jdbc.Driver");

		try (Connection connection = DriverManager
				.getConnection("jdbc:mysql://oraclepr.uco.es:3306/i72rogup?useSSL=false", "i72rogup", "practicapw");

				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, user.getFirstName());
			preparedStatement.setString(2, user.getLastName());
			preparedStatement.setString(3, user.getUserName());
			preparedStatement.setString(4, user.getPassword());
			preparedStatement.setString(5, user.getEmail());

			System.out.println(preparedStatement);
			result = preparedStatement.executeUpdate();

		} catch (SQLException e) {
			printSQLException(e);
		}
		return result;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
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

	public User getUserByEmail(String email) {
		Connection connection;
		Statement statement;
		ResultSet resultset;
		String query = String.format("SELECT * FROM users WHERE email = \"%s\"", email);

		try {
			connection = getConnection();
			statement = connection.createStatement();
			resultset = statement.executeQuery(query);
			resultset.next();
			return getUserFromResultSet(resultset);
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return null;
	}
	
	public User getUserById(int user_id) {
		Connection connection;
		Statement statement;
		ResultSet resultset;
		String query = String.format("SELECT * FROM users WHERE id = %d", user_id);

		try {
			connection = getConnection();
			statement = connection.createStatement();
			resultset = statement.executeQuery(query);
			resultset.next();
			return getUserFromResultSet(resultset);
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return null;
	}
	
	public ArrayList<User> paginatedGetUserByName(String firstname, String lastname, int page) {
		Connection connection;
		Statement statement;
		ResultSet resultset;
		String conditions = "";
		ArrayList<User> users = new ArrayList<User>();
		
		// This is not ok but we have a deadline and there is not time for refactoring helmet
		if ((firstname != null) && (lastname != null)) {
			conditions = String.format("WHERE firstname = '%s' AND lastname = '%s'", firstname, lastname);
		} else if (firstname != null) {
			conditions = String.format("WHERE firstname = '%s'", firstname);
		} else if (lastname != null){
			conditions = String.format("WHERE lastname = '%s'", lastname);
		}
		
		
		String paginatedQuery = String.format(
				"SELECT  * FROM users %s LIMIT %d, %d", conditions, (PAGE_LIMIT*page), (PAGE_LIMIT*page) + PAGE_LIMIT);

		try {
			connection = getConnection();
			statement = connection.createStatement();
			resultset = statement.executeQuery(paginatedQuery);
			while(resultset.next()) {
				users.add(getUserFromResultSet(resultset));
			}
			System.out.print(users);
			return users;
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return null;
	}
	
	
	
	public ArrayList<User> paginatedUsers(int page) {
		Connection connection;
		Statement statement;
		ResultSet resultset;
		ArrayList<User> users = new ArrayList<User>(); 
		String paginatedQuery = String.format(
				"SELECT  * FROM users LIMIT %d, %d", (PAGE_LIMIT*page), (PAGE_LIMIT*page) + PAGE_LIMIT);

		try {
			connection = getConnection();
			statement = connection.createStatement();
			resultset = statement.executeQuery(paginatedQuery);
			while(resultset.next()) {
				users.add(getUserFromResultSet(resultset));
			}
			return users;
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return null;
	}

	private Connection getConnection() {
		Connection connection = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://oraclepr.uco.es:3306/i72rogup", "i72rogup",
					"practicapw");
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return connection;
	}

	private User getUserFromResultSet(ResultSet resultset) {
		User user = new User();
		try {
			user = setUserData(resultset);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		return user;
	}

	private User setUserData(ResultSet resultset) throws SQLException {
		User user = new User();
		user.setId(resultset.getInt("id"));
		user.setFirstName(resultset.getString("firstname"));
		user.setLastName(resultset.getString("lastname"));
		user.setUserName(resultset.getString("username"));
		user.setPassword(resultset.getString("password"));
		user.setEmail(resultset.getString("email"));
		user.setBiography(resultset.getString("biography"));
		user.setGender(resultset.getString("gender"));
		user.setCountry(resultset.getString("country"));
		user.setCity(resultset.getString("city"));
		return user;
	}

	public int updateUserBiography(String email, String biography) {
		Connection connection;
		Statement statement;
		String query = String.format("UPDATE users SET biography = '%s' WHERE email = '%s'", biography, email);

		try {
			connection = getConnection();
			statement = connection.createStatement();
			return statement.executeUpdate(query);
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return 0;
	}

	public int updateUserProfileInfo(String email, String city, String country) {
		Connection connection;
		Statement statement;
		String query = String.format("UPDATE users SET city = '%s', country = '%s' WHERE email = '%s'", city, country, email);

		try {
			connection = getConnection();
			statement = connection.createStatement();
			return statement.executeUpdate(query);
		} catch (Exception exception) {
			exception.printStackTrace();
		}

		return 0;
	}
}
