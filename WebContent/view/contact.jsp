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
    <title>CVJobs</title>
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
        <a class="navbar-a" href="${pageContext.request.contextPath}/forum">Forum</a>
      </li>
      <li class="navbar-li">
        <a class="navbar-a" href="${pageContext.request.contextPath}/profile">Profile</a>
      </li>
      <li class="navbar-li">
        <a class="active navbar-a" href="${pageContext.request.contextPath}/contacts">Contacts</a>
      </li>
      <li class="navbar-li">
        <a class="navbar-a" href="${pageContext.request.contextPath}/browser">Search</a>
      </li>
    </ul>
    <div class="contact-column contact-contactcontainer">
      <div id="registerInput">
        <div class="contact-container_contact">
          <input
            class="contact-input"
            type="text"
            placeholder="Search a contact"
            name="contact"
            required
          />
          <button
            class="cv-primaryButton contact-button"
            id="registerButton"
            type="submit"
          >
            SEARCH
          </button>
        </div>
      </div>

      <div class="contact-contact_box scrolling">
        <!-- JAVASCRIPT -->
      </div>
    </div>

    <div class="contact-column contact-chatcontainer">
      <div class="contact-container_chat">
        <div class="contact-chat_box scrolling">
          <!-- JAVASCRIPT -->
        </div>
        <div id="registerInput">
          <input
            class="contact-input"
            type="text"
            placeholder="Type a message"
            name="message"
            required
          />
          <button
            class="cv-primaryButton contact-button"
            id="registerButton"
            type="submit"
          >
            ENTER
          </button>
        </div>
      </div>
    </div>
    <script type="text/javascript" src="../js/contact.js"></script>
  </body>
</html>
