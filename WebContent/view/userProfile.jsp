<%@page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import ="database.*"
	import= "model.*"%>
<%User user = (User)session.getAttribute("user"); %>

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
      rel="stylesheet"
    />
  </head>

  <body class="cv-body">
    <ul class="navbar-ul">
      <li class="navbar-li">
        <a class="navbar-a" href="./forum.jsp">Forum</a>
      </li>
      <li class="navbar-li">
        <a class="active navbar-a" href="./userProfile.jsp">Profile</a>
      </li>
      <li class="navbar-li">
        <a class="navbar-a" href="./contact.jsp">Contacts</a>
      </li>
      <li class="navbar-li">
        <a class="navbar-a" href="./browser.jsp">Search</a>
      </li>
    </ul>

    <div class="profileRow">
      <div class="profileBiographyColumn profileColumn leftProfileColumn">
        <img class="avatarProfile" src="../img/img_avatar.png" />

          <h2 class="center">Biografía</h2>

        <p class="profileMarginText justified">
          My name is Francis Molina, and I am a survivor. For weeks I daydreamed
          of my family's vacation to Thailand. That vacation was a much needed
          time away from my hectic hours as a lawyer in a medium-sized firm in
          Chicago. But as it turned out my time there was not relaxing at all,
          life had a different plan. While on that vacation, our hotel received
          word of a devastating tsunami set to hit land, we were to evacuate
          quickly. Lucky for my family we were further uphill hiking that day
          when we heard the news. We left to find an even safer location just
          before the water came on shore. We survived the tsunami. It was an act
          of God. When we returned many days later we found our resort was no
          more.
        </p>
      </div>
      <div class="profileColumn centerProfileColumn">
        <div class="profilePersonalInfo">
            <h2 class="profileMarginText center"><% out.print(user.getFirstName() + " " + user.getLastName());%></h2>
            <h3 class="profileMarginText center">UX Designer in Audiense Dev</h3>
            <h5 class="profileMarginText center">Córdoba y alrededores, España</h5>
        </div>
        <div class="profileProfessionalInfo">
          <div class="profileProInfoDiv">
            <h2 class="profileMarginText">Experiencia</h2>

            <h4>Co-founder and CTO Audiense</h4>
            <h5>Desde abr. de 2011 - actualidad</h5>
            <p>
              Audiense delivers unique consumer insight and engagement
              capabilities to over 4,000 of the worlds largest brands and
              agencies. We help them to grow their customer and audience bases
              by finding, identifying and connecting with individuals and
              audience segments including those they don't yet know about. Our
              clients include Universal Music, Comic Relief and DigitasLBi. As a
              CTO I designed and implemented Audiense architecture to scale from
              0 to hundreds of thousands of Twitter users to process data in
              real time and managing over 5000 transactions per second.
            </p>
            <hr />
            <h4>Researcher</h4>
            <h5>sep. de 2004 - jul. de 2011</h5>
            <p>
              Profesor en la Facultad de Educación a Distancia e investigador
              como jefe del grupo de desarrollo de la plataforma elearning SEPAD
            </p>

            <hr />
            <h4>Programador</h4>
            <h5>2000 - 2005</h5>
            <p>
              Participación como programador freelance en más de 40 proyectos
              para clientes en Estados Unidos, Argentina y EspaÃ±a.
            </p>
          </div>
          <div class="profileProInfoDiv">
            <h2 class="profileMarginText">Formación</h2>
            <h4>Universidad Central de Las Villas</h4>
            <h5>Degree Computer Science</h5>
            <p>
              1999-2004
            </p>
            <hr />

            <h4>Instituto Vocacional de Ciencias Exactas Eusebio Olivera</h4>
            <h5>Highschool, Sciences</h5>
            <p>
              1994-1997
            </p>
          </div>
          <div class="profileProInfoDiv">
            <h2 class="profileMarginText">Skills</h2>
            <h4>- Social Media Development</h4>
            <h4>- Product Management</h4>
            <h4>- Online Marketing</h4>
            <h4>- Leadership</h4>
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
</html>
