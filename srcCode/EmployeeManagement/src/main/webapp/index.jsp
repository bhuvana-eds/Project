<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="style.css">
   <script src="index.js"></script>
   <title>Employee Management System</title>
</head>
<header class="index-main-section">
  <nav id="mynav">
    <ul>
        <img id="img-section" src="images\Logo.jpg" alt="EDS Technologies">
        <li class="btn-link active"><a href="home.jsp">Home</a></li>
        <li class="btn-link"><a href="about.jsp">About</a></li>
        <li class="btn-link"><a href="industries.jsp">Industries</a></li>
        <li class="btn-link"><a href="services.jsp">Services</a></li>
        <li class="btn-link"><a href="login.jsp">Login</a></li>
    </ul>
</nav>
</header>
<body class="home-body">
    <div id="scroll-bar">
        <div class="slideshow-container">
            <div class="mySlides fade">
                <img class="index-img" src="images/home-first-img.jpg" style="width:100%">
                <div class="home-text"><b> Real solutions for the real world</b></div>
            </div>
            <div class="mySlides fade">
                <img class="index-img" src="images/home-sec-img.jpg" style="width:100%">
                <div class="home-text"><b>World’s most powerful mapping and spatial analytics solution</b></div>
            </div>
                <div class="mySlides fade">
                <img class="index-img" src="images/home-third-img.jpg" style="width:100%">
                <div class="home-text"><b>Powering the Era of Smart Everything</b></div>
            </div>
            <div class="mySlides fade">
                <img class="index-img" src="images/home-fourth-img.jpg" style="width:100%">
                <div class="home-text"><b>Upskill with EDST e-Learning</b></div>
            </div>
            <div class="mySlides fade">
                <img class="index-img" src="images/home-fifth-img.jpg" style="width:100%">
                <div class="home-text"><b>Shaping the Future of Manufacturing</b></div>
            </div>
            <a class="prev" onclick="plusSlides(-1)">❮</a>
            <a class="next" onclick="plusSlides(1)">❯</a>
        </div>
        <br>
        <br> <br><br> <br> <br><br> <br> <br><br> <br> <br><br> <br> <br><br> <br> <br><br> <br> <br><br>
        <div class="index-row">
            <div class="index-column">
              <div class="index-card">
                <img id="index-image" src="images/index_img_1.png" alt="Jane">
              </div>
            </div>
          
            <div class="index-column">
              <div class="index-card">
                <img id="index-image" src="images/index_img_2.png" alt="Mike">
              </div>
            </div>
            
            <div class="index-column">
              <div class="index-card">
                <img id="index-image" src="images/index_img_3.png" alt="John">
              </div>
            </div>
          </div>
        <h1 style="text-align: center;"> Milestones</h1>
        <div class="milestone">
            <img id="index-milestone" src="images/milestone.png" alt="Milestone" style="max-width:100%">
        </div>
        <br><br>
    </div>
    <script>
    let slideIndex = 1;
    showSlides(slideIndex);
    
    function plusSlides(n) {
      showSlides(slideIndex += n);
    }
    
    function currentSlide(n) {
      showSlides(slideIndex = n);
    }
    
    function showSlides(n) {
      let i;
      let slides = document.getElementsByClassName("mySlides");
      let dots = document.getElementsByClassName("dot");
      if (n > slides.length) {slideIndex = 1}    
      if (n < 1) {slideIndex = slides.length}
      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";  
      }
      for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
      }
      slides[slideIndex-1].style.display = "block";  
      dots[slideIndex-1].className += " active";
    }
    </script>
</body>
<footer class="index-footer">
    &copy;2024 EDS Technologies Pvt. Ltd.
</footer>
</html>