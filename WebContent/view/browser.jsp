<%@page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import ="database.*"
	import= "model.*"%>
<%User loggedUser = (User)session.getAttribute("loggedUser"); %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>CVJobs - Browser</title>
    <!-- CSS files -->
    <link href="../css/style.css" rel="stylesheet" />
    <!-- Google font file -->
    <link
      href="https://fonts.googleapis.com/css?family=Montserrat|Lato&display=swap"
      rel="stylesheet"
    />
  </head>

  <body class="cv-body">
    <ul class="navbar-ul">
      <li class="navbar-li">
        <a class="navbar-a" href="./forum.jsp">Forum</a>
      </li>
      <li class="navbar-li">
        <a class="navbar-a" href="./userProfile.jsp">Profile</a>
      </li>
      <li class="navbar-li">
        <a class="navbar-a" href="./contact.jsp">Contacts</a>
      </li>
      <li class="navbar-li">
        <a class="active navbar-a" href="./browser.jsp">Search</a>
      </li>
    </ul>
    <header class="browser-search-header">
      <a href="#">
        <img class="browser-avatar" src="../img/logo.png" alt="Logo" />
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
      <h3>Profesionales</h3>
      <!-- For Each with people-->
      <div class="browser-card">
        <img class="browser-card-avatar" src="../img/logo.png" alt="Avatar" />
        <div class="browser-container">
          <h4><b>Pepe Marquez</b></h4>
          <p>Panadero</p>
        </div>
      </div>
      <div class="browser-card">
        <img class="browser-card-avatar" src="../img/logo.png" alt="Avatar" />
        <div class="browser-container">
          <h4><b>Pablo Rodriguez</b></h4>
          <p>Arquitecto</p>
        </div>
      </div>
      <div class="browser-card">
        <img class="browser-card-avatar" src="../img/logo.png" alt="Avatar" />
        <div class="browser-container">
          <h4><b>Francisco Molina</b></h4>
          <p>Carpintero</p>
        </div>
      </div>
    </div>
    <div class="browser-people-result">
      <h3>Compañias</h3>
      <!-- For Each with companies-->
      <div class="browser-card">
        <img class="browser-card-avatar" src="../img/logo.png" alt="Avatar" />
        <div class="browser-container">
          <h4><b>UCO</b></h4>
          <p>Universidad</p>
        </div>
      </div>
    </div>
    <script type="text/javascript" src="../js/browser.js"></script>
  </body>
</html>
