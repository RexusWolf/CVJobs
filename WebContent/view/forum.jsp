<%@page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList"
	import ="database.*"
	import= "model.*"%>
<% User loggedUser = (User)session.getAttribute("loggedUser"); %>
<% ArrayList<Post> posts = (ArrayList<Post>) request.getAttribute("posts"); %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>CVJobs - Forum</title>
    <!-- CSS files -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
    <!-- Google font file -->
    <link
      href="https://fonts.googleapis.com/css?family=Montserrat|Lato&display=swap"
      rel="stylesheet"
    />
  </head>

  <body class="cv-body">
    <ul class="navbar-ul">
      <li class="navbar-li">
        <a class="active navbar-a" href="${pageContext.request.contextPath}/forum">Forum</a>
      </li>
      <li class="navbar-li">
        <a class="navbar-a" href="${pageContext.request.contextPath}/view/userProfile.jsp">Profile</a>
      </li>
      <li class="navbar-li">
        <a class="navbar-a" href="./contact.jsp">Contacts</a>
      </li>
      <li class="navbar-li">
        <a class="navbar-a" href="./browser.jsp">Search</a>
      </li>
    </ul>

    <form action="${pageContext.request.contextPath}/forum" method="post" id="postForm">
      <div class="forum-newPublication">
        <div class="forum-newPublicationImage">
          <img
            src="${pageContext.request.contextPath}/img/img_avatar.png"
            class="user-image"
            alt="User Image"
            height="100px"
            width="100px"
          />
        </div>
        <div class="forum-newPublicationText">
          <input type="text" name="title" class="inputText" placeholder="Title" />
          <textarea
            class="textArea"
            name="content"
            form="postForm"
            placeholder="Publication Content"
          ></textarea>
        </div>
        <input type="submit" class="cv-primaryButton forum-button" value="PUBLISH"/>
      </div>
    </form>

    <div class="forum-publications">
      <% if(posts.size() > 0) { %>
      	<% for(int i = 0; i < posts.size(); i++) { %>
		  <h2><% out.println(posts.get(i).getTitle()); %></h2>
		  <h3>by <% out.println(posts.get(i).getAuthor()); %></h3>
		  <p><% out.println(posts.get(i).getContent()); %></p>
       	<% } %>
      <% } %>
    </div>
  </body>
</html>
