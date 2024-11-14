<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css">
    <title>Employee Management System</title>
</head>
<header class="index-main-section">
    <nav id="mynav" class="topnav">
      <ul>
          <img id="img-section" src="images\Logo.jpg" alt="EDS Technologies">
          <li class="btn-link"><a href="home.jsp">Home</a></li>
          <li class="btn-link"><a href="about.jsp">About</a></li>
          <li class="btn-link active"><a href="#">Industries</a></li>
          <li class="btn-link"><a href="services.jsp">Services</a></li>
          <li class="btn-link"><a href="login.jsp">Login</a></li>
          <a href="javascript:void(0);" class="icon" onclick="responsivepage()">
            <i class="fa fa-bars"></i>
          </a>
      </ul>
  </nav>
  </header>
<body class="industries-content">
        <div class="sidebar">
          <a class="active" href="#home">Aerospace</a>
          <a href="#news">Industrial Equipment</a>
          <a href="#contact">Energy</a>
          <a href="#about">Hi-Tech</a>
          <a href="#home">Life Sciences</a>
          <a href="#news">Marine & Offshore</a>
          <a href="#contact">Consumer Goods and Retail</a>
          <a href="#about">Natural Resources</a>
          <a href="#news">Financial & Business Services</a>
          <a href="#contact">Architecture, Engg & Const</a>
          <a href="#about">Consumer Packaged Goods & Retail</a>
        </div>  
        <div class="indus-content">
            <img class="indus-img" src="images/aerospace.jpg" alt="Aerospace">
          <h2> <b>Aerospace</b></h2>
          <p class="indus-p"> 
            Bold advancements remain the hallmark of the Aerospace Industry that pioneered air and space travel. This spirit is 
            now being brought to bear on new challenges ranging from securing program performance and attracting the next generation 
            of experts to pursuing new markets and taking on new competitors. Doing so in a scalable, sustainable, and profitable 
            manner is the driver for innovation.
            Equipping these individuals with the technology to define, communicate, collaborate, and predict how their designs will 
            perform so they can be optimized even before they are built is <br> the role we play. This focus on performance has enabled 
            the industry to answer past challenges. Now the challenges of the future require a new <br>focus orchestrating how these 
            experts interact.
            </p>
            <p><b> Products </b></p>
            <table id="indus-table">
                <tr>
                    <th> <i>PLM Solutions</i> </th>
                    <th> <i>PLM Value Solutions</i> </th>
                    <th> <i>Visual Simulations</i> </th>
                    <th> <i>Enterprise Solutions</i> </th>
                </tr>
                <tr>
                     <td>CATIA</td>   
                     <td> RAMSIS</td>
                     <td> Creator</td>
                     <td>  SAP HANA </td>
                </tr>
                <tr>
                    <td>ENOVIA</td>   
                    <td> Q-CHECKER</td>
                    <td> Terra Vista</td>
                    <td>  Mobility </td>
               </tr>
               <tr>
                    <td>SIMULIA</td>   
                    <td> Q-Monitor</td>
                    <td> Vega Prime</td>
                    <td> Analytics </td>
                </tr>
                <tr>
                    <td>DELMIA</td>   
                    <td> Q-PLM</td>
                    <td> Vortex</td>
                    <td>  </td>
                </tr>
                <tr>
                    <td>3DVIA</td>   
                    <td>  </td>
                    <td> implant</td>
                    <td>  </td>
                </tr>
                <tr>
                    <td>EXALEAD</td>   
                    <td>  </td>
                    <td> HeliSIM</td>
                    <td>  </td>
                </tr>
            </table>
        </div>
        <br>
        <br>
</body>
<br> <br>
<footer class="index-footer">
    &copy;2024 EDS Technologies Pvt. Ltd.
</footer>
</html>