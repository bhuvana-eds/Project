<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Employee Management System</title>
    <link rel="stylesheet" href="style.css">
    <script src="index.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<header class="index-main-section">
    <nav id="mynav">
        <ul>
            <img id="img-section" src="images\Logo.jpg" alt="EDS Technologies">
            <li class="btn-link"><a href="index.jsp">Home</a></li>
            <li class="btn-link"><a href="about.jsp">About</a></li>
            <li class="btn-link"><a href="industries.jsp">Industries</a></li>
            <li class="btn-link"><a href="services.jsp">Services</a></li>
            <li class="btn-link active"><a href="login.jsp">Login</a></li>
        </ul>
    </nav>
</header>
<body class="reg-body">
    <div class="reg-gap"> 
    </div>
    <div class="reg-container">
        <div class="title">
            Employee Registration
        </div>
        <div class="reg-content">
            <form class="reg-form" action="AdminRegistration" name="admregisterForm">
                <div class="reg-user-details">
                    <div class="input-box">
                        <span class="details">
                            Full Name *
                        </span>
                        <input type="text" placeholder="Enter your name" name="name" required>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Date of Birth *
                        </span>
                        <input type="date" placeholder="Enter your dob" name="dob" required>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Email *
                        </span>
                        <input type="text" placeholder="Enter your email" name="email" required>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Phone Number *
                        </span>
                        <input type="text" placeholder="Enter your number" name="phno" required>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Father Name 
                        </span>
                        <input type="text" placeholder="Enter your father name" name="fname" required>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Mother Name
                        </span>
                        <input type="text" placeholder="Enter your mother name" name="mname" required>
                    </div>
                </div>
                <div class="reg-gender-details" required>
                    <input type="radio" name="gender" id="dot-1">
                    <input type="radio" name="gender" id="dot-2">
                    <input type="radio" name="gender" id="dot-3">
                    <span class="gender-title">
                        Gender *
                    </span>
                    <div class="category">
                        <label for="dot-1">
                            <span class="dot one"></span>
                            <span class="gender">Male</span>
                        </label>
                        <label for="dot-2">
                            <span class="dot two"></span>
                            <span class="gender">Female</span>
                        </label>
                        <label for="dot-3">
                            <span class="dot three"></span>
                            <span class="gender">Prefer not to say</span>
                        </label>
                    </div>
                </div>
                
                <button id="register-btn" onclick="validateAdmRegister()" type="submit">Initiate Registration</button>
                <button id="register-btn" onclick="window.location.href='login.jsp'" type="submit">Back</button>
            </form>
        </div>
    </div>
</body>
<script>

    /* Name
  ------------------------------------------------------*/ 

 /*  function validatename(){
    var regName = /^[a-zA-Z]+ [a-zA-Z]+$/;
    var name = document.getElementById('name').value;
    if(!regName.test(name)){
      alert('Please enter your full name.');
      document.getElementById('name').focus();
      return false;
    }else{
      alert('Valid');
      return true;
    }
  } */


   
/* Father Name
  ------------------------------------------------------*/ 

  <!--function validatefname(){
    var regName = /^[a-zA-Z]+ [a-zA-Z]+$/;
    var name = document.getElementById('fname').value;
    if(!regName.test(name)){
      alert('Father full name.');
      document.getElementById('fname').focus();
      return false;
    }else{
      alert('Valid');
      return true;
    }
  }-->


  /*Mother Name
  ------------------------------------------------------*/ 

 <!-- function validatemname(){
    var regName = /^[a-zA-Z]+ [a-zA-Z]+$/;
    var name = document.getElementById('mname').value;
    if(!regName.test(name)){
      alert('Mother full name.');
      document.getElementById('mname').focus();
      return false;
    }else{
      alert('Valid');
      return true;
    }
  }-->


  /*Email ID
  ------------------------------------------------------*/ 
  <!--function validateemail(){
    var regemail = /^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$/ ;
    var email = document.getElementById('emailcheck').value;
    if(!regemail.test(email)){
      alert('Invalid Email ID');
      document.getElementById('emailcheck').focus();
      return false;
    }else{
      alert('Valid');
      return true;
    }
  }-->


  /*Phone Number
  ------------------------------------------------------*/ 
  <!--function validatephone(){
    var regphone = /^\d{10}$/ ;
    var phone = document.getElementById('phone').value;
    if(!regphone.test(phone)){
      alert('Invalid Phone Number');
      document.getElementById('phone').focus();
      return false;
    }else{
      alert('Valid');
      return true;
    }
  }-->


<!--function validatereg(){
    if(validatename && validatefname && validatemname && validatephone && validateemail == true){
      alert("Valid");
    }else{
      alert("Invalid");
    }
  }-->
</script>
<footer class="index-footer">
    &copy;2024 EDS Technologies Pvt. Ltd.
</footer>
</html>


