<%@page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import ="database.*"
	import= "model.*"%>
<%@ page import ="java.util.ArrayList"%>
<%User user = (User)session.getAttribute("user"); %>
<% ArrayList<Company> companies = (ArrayList<Company>) request.getAttribute("companies"); %>

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
        <a class="navbar-a" href="${pageContext.request.contextPath}/myProfile">Profile</a>
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
        <form action="#" method="post">
          <input type="search" name="search_input" />
          <button class="cv-primaryButton browser-search-button" type="submit">
            Buscar
          </button>
        </form>
      </div>
      <div class="browser-search-column">
        <button
          onclick="showFilter()"
          class="cv-primaryButton browser-filter-button"
        >
          Filtrar
        </button>
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
      <h3>Comañias</h3>
      
      <%if (companies.size() != 0) {%>
		<%for(int i=0; i < companies.size() ;i++) { %> 
	      <div class="browser-card">
		        <img class="browser-card-avatar" src="${pageContext.request.contextPath}/img/logo.png" alt="Avatar" />
		        <div class="browser-container">
		          <h4><b><%=companies.get(i).name%></b></h4>
		          <p><%=companies.get(i).activity%></p>
		        </div>
		      </div>
			<%}%>
		<%}%>

    </div>
    <script type="text/javascript" src="../js/browser.js"></script>
  </body>
</html>
