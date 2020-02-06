package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.PostDao;
import model.Post;
import model.User;

@WebServlet("/forum")
public class ForumController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private User user;
	private Post post;
	private PostDao postDao;
	
	public void init() {
		user = new User();
		post = new Post();
		postDao = new PostDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Post> posts = postDao.getAllPosts();
		request.setAttribute("posts", posts);
		request.getRequestDispatcher("/view/forum.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		user = (User) request.getSession(false).getAttribute("user");
		post.setTitle(request.getParameter("title"));
		post.setContent(request.getParameter("content"));
		post.setUserId(user.getId());
		postDao.Add(post);
		doGet(request, response);
	}

}
