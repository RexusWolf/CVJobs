<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>CVJobs - Register</title>
  <!-- CSS files -->
  <link href="../css/style.css" rel="stylesheet" />
  <!-- Google font file -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat|Lato&display=swap" rel="stylesheet" />
</head>

<body class="cv-body">
  <div class="loginRow">
    <div class="loginColumn loginLeftColumn loginInfocontainer">
      <h1>Built for you</h1>
      <p>
        CVJobs LinkedIn is a social network for the business community.<br /><br />
        Founded in 2003, the online site is a place for professionals
      </p>
    </div>
    <form id="loginForm" class="loginForm loginColumn loginRightColumn" action="login" method="post">
      <div class="loginImgContainer">
        <img src="../img/logo.png" alt="Avatar" class="loginAvatar" />
      </div>
      <div class="loginContainer">
        <div id="registerMailInput">
          <label for="email">
            <b>Email</b>
          </label>
          <input class="loginInput" type="text" name="email" placeholder="Enter your email" size="30"/>
        </div>
        <label for="password">
          <b>Password</b>
        </label>
        <input class="loginInput" type="password" name="password" placeholder="Enter Password" size="30"/>
        <button class="cv-primaryButton registerButton" id="registerButton" type="submit">
          REGISTER
        </button>
        <label> <input type="checkbox" name="remember" /> Remember me </label>
      </div>
      <div class="loginContainer">
        <button id="loginButton" type="button" onclick="location.href='./login.jsp';" class="cv-secondaryButton loginButton">
          LOGIN
        </button>
      </div>
    </form>
  </div>
</body>
</html>