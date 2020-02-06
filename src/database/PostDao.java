package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import model.Post;

public class PostDao {
	
	public void Add(Post post) {
		Connection connection;
		Statement statement;
		String query = String.format(
						"INSERT INTO posts (id, user_id, title, content) VALUES ('%s', '%s', '%s', '%s')",
						post.getId(), post.getUserId(), post.getTitle(), post.getContent());
		try {
			connection = getConnection();
			statement = connection.createStatement();
			statement.executeUpdate(query);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
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
}
