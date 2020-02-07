<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="database.*" import="model.*" import="java.util.ArrayList"%>
<%
	User loggedUser = (User) session.getAttribute("loggedUser");
	ArrayList<Skill> skills = (ArrayList<Skill>) session.getAttribute("skills");
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>CVJobs - Profile Page</title>
<!-- CSS files -->
<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" />
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
			<img class="avatarProfile" src="${pageContext.request.contextPath}/img/img_avatar.png" />

			<h2 class="center">Biografía</h2>

			<p id="biography" class="profileMarginText justified">
				<%
					out.print(loggedUser.getBiography());
				%>
			</p>

			<div id="biographyModal" class="biographyModal">
				<div class="biographyModal-content">
					<form action="${pageContext.request.contextPath}/updateBiography"
						accept-charset="utf-8" method="post">
						<div>
							 <input
								class="loginInput" type="hidden" name="email"
								value=<%out.print(loggedUser.getEmail());%> />
							<textarea class="profileBiographyInput" name="biography"><%out.print(loggedUser.getBiography());%>
							</textarea>
							<button class="cv-primaryButton profileBiographyButton"
								type="submit">Save</button>
						</div>
					</form>
				</div>
			</div>
			<button id="edit-biography"
				class="cv-primaryButton center profileBiographyButton">Edit
				bio</button>
		</div>
		<div class="profileColumn centerProfileColumn">
			<div class="profilePersonalInfo">
				<h2 class="profileMarginText center">
					<%
						out.print(loggedUser.getFirstName() + " " + loggedUser.getLastName());
					%>
				</h2>
				<h3 class="profileMarginText center">UX Designer in Audiense
					Dev</h3>
				<h5 class="profileMarginText center">
					<%
						out.print(loggedUser.getCity() + ", " + loggedUser.getCountry());
					%>
				</h5>
				<div id="profileInfoModal" class="biographyModal">
					<div class="biographyModal-content">
						<form action="${pageContext.request.contextPath}/myProfile"
							accept-charset="utf-8" method="post">
								<button class="cv-primaryButton profileSaveButton"
									type="submit">Save</button>
							<div id="edit-profile-inputs">
								<input
									class="loginInput" type="hidden" name="email"
									value=<%out.print(loggedUser.getEmail());%>
								 />
								<input
									class="loginInput" type="hidden" name="userId"
									value=<%out.print(loggedUser.getId());%>
								 />
								<label for="city">
						            <b>City</b>
						          </label>
						          <input
						            class="loginInput"
						            type="text"
						            name="city"
						            value=<%out.print(loggedUser.getCity());%>
						          />
						          <label for="country">
						            <b>Country</b>
						          </label>
						           <input
						            class="loginInput"
						            type="text"
						            name="country"
						            value=<%out.print(loggedUser.getCountry());%>
						          />
							      <label for="name">
						            <b>Skill name</b>
						          </label>
						          <input
						            class="loginInput"
						            type="text"
						            name="name"
						          />
						          <label for="period">
						            <b>Period</b>
						          </label>
						           <input
						            class="loginInput"
						            type="text"
						            name="period"
						          />
						          <label for="content">
						            <b>Content</b>
						          </label>
						           <textarea						           
					            	class="profileBiographyInput"
					            	name="content">
						           </textarea>
							</div>
							<button id="add-info-button" onclick="AddInfo()" type="button"
									class="cv-secondaryButton profileAddInfoButton">Add info</button>
						</form>
					</div>
				</div>
				<button id="edit-profileInfo"
					class="cv-primaryButton profileEditButton">Edit bio</button>
			</div>
			<div class="profileProfessionalInfo">
				<div class="profileProInfoDiv">
					<h2 class="profileMarginText">Experiencia</h2>

					<h4>Co-founder and CTO Audiense</h4>
					<h5>Desde abr. de 2011 - actualidad</h5>
					<p>Audiense delivers unique consumer insight and engagement
						capabilities to over 4,000 of the worlds largest brands and
						agencies. We help them to grow their customer and audience bases
						by finding, identifying and connecting with individuals and
						audience segments including those they don't yet know about. Our
						clients include Universal Music, Comic Relief and DigitasLBi. As a
						CTO I designed and implemented Audiense architecture to scale from
						0 to hundreds of thousands of Twitter loggedUsers to process data in
						real time and managing over 5000 transactions per second.</p>
					<hr />
					<h4>Researcher</h4>
					<h5>sep. de 2004 - jul. de 2011</h5>
					<p>Profesor en la Facultad de Educación a Distancia e
						investigador como jefe del grupo de desarrollo de la plataforma
						elearning SEPAD</p>

					<hr />
					<h4>Programador</h4>
					<h5>2000 - 2005</h5>
					<p>Participación como programador freelance en más de 40
						proyectos para clientes en Estados Unidos, Argentina y EspaÃ±a.</p>
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
				<div class="profileProInfoDiv">
					<h2 class="profileMarginText">Jobs</h2>
					<% if(skills.size() != 0) { %>
	                  <% for(int i=0; i < skills.size() ;i++) { %>
	                  		<h4><% out.println(skills.get(i).getName()); %></h4>
	                  		<h5><% out.println(skills.get(i).getPeriod()); %></h5>
	                  		<p><% out.println(skills.get(i).getContent()); %></p>
	                  		<hr/>
	                  <% } %>
					<% } %>
				</div>
			</div>
		</div>
		<div class="profileColumn rightProfileColumn">
			<div class="profileProInfoDiv">
				<h2>Otros perfiles</h2>
				<h4>Carlos Hernández Gómez</h4>
				<p>Senior Backend Developer at IBM Research</p>
				<h4>Carlos Hernández Fernández</h4>
				<p>Senior UX Designer at IBM Research</p>
				<h4>Carlos Gómez Gómez</h4>
				<p>Senior Full-Stack Developer at IBM Research</p>
				<h4>Carlos Fernández Gómez</h4>
				<p>Senior Frontend Developer at IBM Research</p>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/editableUserProfile.js"></script>
</html>
