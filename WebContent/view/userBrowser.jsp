<%@page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import ="database.*"
	import= "model.*"%>
<%@ page import ="java.util.ArrayList"%>
<%User user = (User)session.getAttribute("user"); %>
<% ArrayList<User> users = (ArrayList<User>) request.getAttribute("resultUsers"); %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>CVJobs - Browser</title>
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
        <a class="navbar-a" href="${pageContext.request.contextPath}/forum">Forum</a>
      </li>
      <li class="navbar-li">
        <a class="navbar-a" href="${pageContext.request.contextPath}/profile">Profile</a>
      </li>
      <li class="navbar-li">
        <a class="navbar-a" href="${pageContext.request.contextPath}/contacts">Contacts</a>
      </li>
      <li class="navbar-li">
        <a class="active navbar-a" href="${pageContext.request.contextPath}/userBrowser">Search</a>
      </li>
    </ul>
    <header class="browser-search-header">
      <a href="#">
        <img class="browser-avatar" src="${pageContext.request.contextPath}/img/logo.png" alt="Logo" />
      </a>
    </header>
    <div class="browser-search">
      <div id="search-form" class="browser-search-column">
        <form action="${pageContext.request.contextPath}/userBrowser" method="post">
          <input type="text" name="firstname" placeholder="First Name" required/>
          <input type="text" name="lastname" placeholder="Last Name" required/>
          <button class="cv-primaryButton browser-search-button" type="submit">
            Buscar
          </button>
        </form>
      </div>
    </div>
    <div id="filter-section" class="browser-filter-section">
      <form action="#" method="post">
        <label for="field">Campo</label>
        <select name="field">
          <option value="1">Nombre</option>
        </select>
        <label for="field">Valor</label>
        <input type="text" name="value" />
      </form>
    </div>
    <div class="browser-people-result">
      <h3>Profesionales</h3>
      
      <%if (users != null) {%>
	      <%if (users.size() != 0) {%>
			<%for(int i=0; i < users.size() ;i++) { %> 
		      <div class="browser-card">
			        <img class="browser-card-avatar" src="${pageContext.request.contextPath}/img/logo.png" alt="Avatar" />
			        <div class="browser-container">
			          <h4><b><%=users.get(i).getFirstName()%> <%=users.get(i).getLastName()%></b></h4>
			        </div>
			      </div>
				<%}%>
			<%}%>
		<%}%>

    </div>
    <script type="text/javascript" src="../js/browser.js"></script>
  </body>
</html>
