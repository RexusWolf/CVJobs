<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>CVJobs - Forum</title>
  <!-- CSS files -->
  <link href="../css/style.css" rel="stylesheet" />
  <!-- Google font file -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat|Lato&display=swap" rel="stylesheet" />
</head>

<body class="cv-body">
  <ul class="navbar-ul">
    <li class="navbar-li"><a class="active navbar-a" href="./forum.jsp">Forum</a></li>
    <li class="navbar-li"><a class="navbar-a" href="./userProfile.jsp">Profile</a></li>
    <li class="navbar-li"><a class="navbar-a" href="./contact.jsp">Contacts</a></li>
    <li class="navbar-li"><a class="navbar-a" href="./browser.jsp">Search</a></li>
  </ul>
  <div class="forum-newPublication">
    <div class="forum-newPublicationImage">
      <img src="../img/img_avatar.png" class="user-image" alt="User Image" height="100px" width="100px" />
    </div>
    <div class="forum-newPublicationText">
      <input type="text" class="title" placeholder="Title" />
      <input type="text" class="content" placeholder="Publication Content" />
    </div>
    <button class="cv-primaryButton forum-button">PUBLISH</button>
  </div>
  <div class="forum-publications">
    <!-- jsp: for publication in publications -->
    <h3>Publication Title</h3>
    <p>
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur libero
      laborum qui tempore velit earum neque aliquid laudantium voluptatum.
      Voluptatum voluptates laudantium officia fugit obcaecati repellat voluptas
      eum, ipsum hic assumenda eveniet eligendi voluptatibus tempore quae, sint
      illo suscipit, dicta officiis quas quibusdam at qui totam sit soluta.
      Deserunt deleniti sequi rem officia unde vero laborum aut optio. Nulla
      maxime dolorem veritatis repellendus necessitatibus eum at repudiandae,
      ipsum deleniti eaque assumenda iure consequuntur odio quisquam dolores
      adipisci animi soluta explicabo.
    </p>
    <h3>Publication Title</h3>
    <p>
      Lorem ipsum dolor sit amet consectetur adipisicing elit. Pariatur libero
      laborum qui tempore velit earum neque aliquid laudantium voluptatum.
      Voluptatum voluptates laudantium officia fugit obcaecati repellat voluptas
      eum, ipsum hic assumenda eveniet eligendi voluptatibus tempore quae, sint
      illo suscipit, dicta officiis quas quibusdam at qui totam sit soluta.
      Deserunt deleniti sequi rem officia unde vero laborum aut optio. Nulla
      maxime dolorem veritatis repellendus necessitatibus eum at repudiandae,
      ipsum deleniti eaque assumenda iure consequuntur odio quisquam dolores
      adipisci animi soluta explicabo.
    </p>
    <!-- jsp: for ends -->
  </div>
</body>

</html>