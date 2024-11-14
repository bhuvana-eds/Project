<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
    <script src="index.js"></script>
    <title>Employee Management System</title>
</head>
<header class="index-main-section">
  <nav id="mynav">
    <ul>
        <img id="img-section" src="images\Logo.jpg" alt="EDS Technologies">
        <li class="btn-link"><a href="index.jsp">Home</a></li>
        <li class="btn-link"><a href="about.jsp">About</a></li>
        <li class="btn-link"><a href="industries.jsp">Industries</a></li>
        <li class="btn-link  active"><a href="services.jsp">Services</a></li>
        <li class="btn-link active"><a href="login.jsp">Login</a></li>
    </ul>
</nav>
</header>
<body class="forgotpwd-body">
<div class="form-gap">
</div>
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
              <div class="pwdpanel-body">
                <div class="text-center">
                  <h3><i class="fa fa-lock fa-4x"></i></h3>
                  <h2 class="text-center">Forgot Password</h2>
                  <div class="panel-body">
                    <form id="register-form" role="form" autocomplete="off" class="form" method="post">
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                          <input id="email" name="email" placeholder="Email address" class="form-control"  type="email" required>
                        </div>
                      </div>
                      <div class="form-group">
                        <button name="recover-submit" id="resetpwd-btn" onclick="window.location.href='forgotpwd_success.jsp'"  type="submit">
                          Reset Password </button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
        </div>
	</div>
</div>
</body>
<footer class="index-footer">
    &copy;2024 EDS Technologies Pvt. Ltd.
</footer>
</html>