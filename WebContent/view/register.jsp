<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>CVJobs - Register</title>
    <!-- CSS files -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
    <!-- Google font file -->
    <link
      href="https://fonts.googleapis.com/css?family=Montserrat|Lato&display=swap"
      rel="stylesheet"
    />
  </head>

  <body class="cv-body">
    <div class="loginRow">
      <div class="loginColumn loginLeftColumn loginInfocontainer">
        <h1>Built for you</h1>
        <p>
          CVJobs LinkedIn is a social network for the business community.<br />
          <br />
          Founded in 2003, the online site is a place for professionals
        </p>
      </div>
      <form
        id="loginForm"
        class="loginForm loginColumn loginRightColumn"
        action="<%= request.getContextPath() %>/registerUser"
        method="post"
      >
        <div class="loginImgContainer">
          <img src="../img/logo.png" alt="Avatar" class="loginAvatar" />
        </div>
        <div class="loginContainer">
          <label for="firstname"> <b>First name</b> </label>
          <input
            class="loginInput"
            type="text"
            name="firstname"
            placeholder="Enter your first name"
            size="30"
          />
          <label for="lastname">
            <b>Last name</b>
          </label>
          <input
            class="loginInput"
            type="text"
            name="lastname"
            placeholder="Enter your last name"
            size="30"
          />
          <label for="username">
            <b>Username</b>
          </label>
          <input
            class="loginInput"
            type="text"
            name="username"
            placeholder="Enter your username"
            size="30"
          />
          <label for="password">
            <b>Password</b>
          </label>
          <input
            class="loginInput"
            type="password"
            name="password"
            placeholder="Enter Password"
            size="30"
          />
          <label for="email">
            <b>Email</b>
          </label>
          <input
            class="loginInput"
            type="text"
            name="email"
            placeholder="Enter your email"
            size="30"
          />
          <button
            class="cv-primaryButton registerButton"
            id="registerButton"
            type="submit"
          >
            REGISTER
          </button>
        </div>
        <div class="loginContainer">
          <button
            id="loginButton"
            type="button"
            onclick="location.href='./login.jsp';"
            class="cv-secondaryButton loginButton"
          >
            LOGIN
          </button>
        </div>
      </form>
    </div>
  </body>
</html>
