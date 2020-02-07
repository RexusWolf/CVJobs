<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="database.*" import="model.*" import="java.util.ArrayList"%>
<%
	User profileUser = (User) request.getAttribute("profileUser");
	ArrayList<Skill> skills = (ArrayList<Skill>) session.getAttribute("skills");
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>CVJobs - Profile Page</title>
<!-- CSS files -->
<link href="../css/style.css" rel="stylesheet" />
<!-- Google font file -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat|Lato&display=swap"
	rel="stylesheet" />
</head>

<body class="cv-body">
	<ul class="navbar-ul">
		<li class="navbar-li"><a class="navbar-a"
			href="${pageContext.request.contextPath}/forum">Forum</a></li>
		<li class="navbar-li"><a class="active navbar-a"
			href="${pageContext.request.contextPath}/myProfile">Profile</a></li>
		<li class="navbar-li"><a class="navbar-a"
			href="${pageContext.request.contextPath}/contacts">Contacts</a></li>
		<li class="navbar-li"><a class="navbar-a"
			href="${pageContext.request.contextPath}/browser">Search</a></li>
	</ul>

	<div class="profileRow">
		<div class="profileBiographyColumn profileColumn leftProfileColumn">
			<img class="avatarProfile" src="../img/img_avatar.png" />

			<h2 class="center">Biografía</h2>

			<p id="biography" class="profileMarginText justified">
				<%
					out.print(profileUser.getBiography());
				%>
			</p>
		</div>
		<div class="profileColumn centerProfileColumn">
			<div class="profilePersonalInfo">
				<h2 class="profileMarginText center">
					<%
						out.print(profileUser.getFirstName() + " " + profileUser.getLastName());
					%>
				</h2>
				<h5 class="profileMarginText center">
					<%
						out.print(profileUser.getCity() + ", " + profileUser.getCountry());
					%>
				</h5>
			</div>
			<div class="profileProfessionalInfo">
				<div class="profileProInfoDiv">
					<% if(skills.size() != 0) { %>
	                  <%for(int i=0; i < skills.size() ;i++) { %>
	                  		<h4><% out.println(skills.get(i).getName()); %></h4>
	                  		<h5><% out.println(skills.get(i).getPeriod()); %></h5>
	                  		<p><% out.println(skills.get(i).getContent()); %></p>
	                  		<hr/>
	                  <% } %>
					<% } %>
				</div>
				<div class="profileProInfoDiv">
					<h2 class="profileMarginText">Formación</h2>
					<h4>Universidad Central de Las Villas</h4>
					<h5>Degree Computer Science</h5>
					<p>1999-2004</p>
					<hr />

					<h4>Instituto Vocacional de Ciencias Exactas Eusebio Olivera</h4>
					<h5>Highschool, Sciences</h5>
					<p>1994-1997</p>
				</div>
			</div>
		</div>
		<div class="profileColumn rightProfileColumn">
			<div class="profileProInfoDiv">
				<h2>Otros perfiles (Future Feature)</h2>
				<h4>Carlos Hernández Gómez</h4>
				<p>Senior Backend Developer at IBM Research</p>
				<h4>Carlos Hernández Fernández</h4>
				<p>Senior UX Designer at IBM Research</p>
				<h4>Carlos Gómez Gómez</h4>
				<p>Senior Full-Stack Developer at JRCP Research</p>
				<h4>José Ramírez Copado-Pedraza</h4>
				<p>Senior Frontend Developer at IBM Research</p>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="../js/userProfile.js"></script>
</html>
