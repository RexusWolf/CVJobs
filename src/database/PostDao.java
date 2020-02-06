package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

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

	public ArrayList<Post> getAllPosts() {
		Connection connection;
		Statement statement;
		String query = String.format("SELECT * FROM posts");
		ResultSet resultSet;
		ArrayList<Post> posts = new ArrayList<Post>();
		
		try {
			connection = getConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(query);
			while(resultSet.next()) {
				posts.add(getPostFromResultSet(resultSet));
			}
			return posts;
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		
		return posts;
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
	
	private Post getPostFromResultSet(ResultSet resultSet) {
		Post post = new Post();
		
		try {
			post.setTitle(resultSet.getString("title"));
			post.setContent(resultSet.getString("content"));
			post.setUserId(resultSet.getInt("user_id"));
		} catch (Exception exception) {
			exception.printStackTrace();
		}
		
		return post;
	}
}
