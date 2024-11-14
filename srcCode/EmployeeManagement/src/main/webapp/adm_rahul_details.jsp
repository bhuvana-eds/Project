<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css">
    <script src="index.js"></script>
    <meta charset="utf-8">
    <title>Employee Management System - Admin Portal</title>
</head>
<header class="index-main-section">
    <nav>
		<ul class="e_ul" onclick="activetab()">
            <img id="img-section" src="images\Logo.jpg" alt="EDS Technologies">
			<li class="nav-item" id="home">
			<a href="#personal">Personal Details</a>
			</li>
			<li class="nav-item" id="about">
			<a href="#qualification">Qualification</a>
			</li>
			<li class="nav-item" id="services">
			<a href="#work">Work Experience</a>
			</li>
			<li class="nav-item" id="contact">
			<a href="#documents">Documents Upload</a>
			</li>
            <li>
                <button id="btn-link" onclick="myFunction()" class="portal-dropbtn"> Madhurya </button>
                <!-- <img src="images/user-icon.png" id="user_icon" alt="user"><br>--> 
                <div id="myDropdown" class="portal-dropdown-content" style="width: 150px; right: 35px; text-orientation: inherit;">
                    <a href="adm_registration.jsp">Registration</a>
                    <a href="emp_list.jsp">Employee Details</a>
                    <a href="adm_pwdchange.jsp">Change Password</a>
                    <a href="home.jsp">Logout</a>
                </div>
            </li>
		</ul>
	</nav>
</header>

<body class="empportal-body">

    <div class="section one" id="personal">
        <form class="e-personal-form" action="#" name="admregisterForm">
            <fieldset> <legend class="e-personal-title"><b>Personal Details</b></legend>
            <div class="reg-user-details">
                <div class="input-box">
                    <span class="details">
                        Full Name 
                    </span>
                    <input type="text" placeholder="Enter your name" value="Rahul J P" disabled>
                </div>
                <div class="input-box">
                    <span class="details">
                        Date of Birth 
                    </span>
                    <input type="date" placeholder="Enter your dob" value="1999-11-16" disabled>
                </div>
                <div class="input-box">
                    <span class="details">
                        Father Name 
                    </span>
                    <input type="text" placeholder="Enter your father name" value="Praveen Kumar" disabled>
                </div>
                <div class="input-box">
                    <span class="details">
                        Mother Name 
                    </span>
                    <input type="text" placeholder="Enter your father name" value="Lakshmi P" disabled>
                </div>
                <div class="input-box">
                    <span class="details">
                        Phone Number 
                    </span>
                    <input type="text" placeholder="Enter your number" value="8745236985" disabled>
                </div>
                <div class="gender-details">
                    <input type="radio" name="gender" id="dot-1" checked disabled>
                    <input type="radio" name="gender" id="dot-2" disabled>
                    <input type="radio" name="gender" id="dot-3" disabled>
                    <span class="gender-title">
                        Gender 
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
                            <span class="gender">Other</span>
                        </label>
                    </div>
                </div> 
                <div class="input-box" style="margin-left: 41.5%;">
                    <span class="details">
                        Email *
                    </span>
                    <input type="text" placeholder="Enter your email" value="rahuljp@gmail.com">
                </div>
                
                <div class="input-box" style="margin-left: 47.5%; margin-top: 5%; position: absolute; width: 13.5%;">
                    <span class="details">
                        Employee ID *
                    </span>
                    <input type="text" placeholder="Employee ID" value="123456">
                </div>
                
                
                <div class="profile-pic-wrapper">
                    <div class="pic-holder">
                      <img id="profilePic" class="pic" src="https://source.unsplash.com/random/150x150?person">
                      <Input class="uploadProfileInput" type="file" name="profile_pic" id="newProfilePhoto" accept="image/*" style="opacity: 0;" disabled/>
                      <label for="newProfilePhoto" class="upload-file-block">
                        <div class="text-center">
                          <div class="mb-2">
                            <i class="fa fa-camera fa-2x"></i>
                          </div>
                          <div class="text-uppercase">
                            Update Profile Photo
                          </div>
                        </div>
                      </label>
                    </div>
                 
                    <button id="h-btn" onclick="openForm()">View Hierarchy</button>
                </div>
                    <div class="formpopup" id="myForm">
                        <form action="/action_page.php" class="form-container">
                          <span class="close">&times;</span>     
                          <h6 class="level-1 rectangle" style="font-size: 18px;">
                              Ramesh Chandra P
                              <p id="hp"> Managing Director </p>
                              <p id="hp"> CORP </p>
                          </h6>
                          <ol class="level-2-wrapper" id="h-ol">
                              <li>
                                <h6 class="level-2 rectangle" style="font-size: 18px;">
                                  Senthil Shanmugasundaram
                                  <p id="hp"> President </p>
                                  <p id="hp"> CORP </p>
                                </h6>
                              </li>
                          </ol>
                          <ol class="level-3-wrapper" id="h-ol">
                              <li>
                                <h6 class="level-3 rectangle" style="font-size: 18px;">
                                  Vijay Babu
                                  <p id="hp"> Global Head - Consulting Services </p>
                                  <p id="hp"> Consulting Services </p>
                                </h6>
                              </li>
                          </ol>
                          <ol class="level-4-wrapper" id="h-ol">
                              <li>
                                <h6 class="level-4 rectangle" style="font-size: 18px;">
                                  Prasanna Holla
                                  <p id="hp"> Senior Project Manager </p>
                                  <p id="hp"> Consulting </p>
                                </h6>
                              </li>
                          </ol>
                          <ol class="level-5-wrapper" id="h-ol">
                              <li>
                                <h6 class="level-5 rectangle" style="font-size: 18px;">
                                  Rahul J P
                                  <p id="hp">Application Engineer</p>
                                  <p id="hp">Engineering Solutions</p>
                                </h6>
                              </li>
                          </ol>
                        </form>
                    </div>
                </div>
            </div>
        </fieldset>
    </form>
    

    <br>
    <!-- <div class="e-addr-title"><b> Address Details</b></div> -->
    <form class="e-addr-form" action="#" name="admregisterForm">
        <fieldset style="margin: 0 35px 0 33px;"><legend class="e-addr-title"><b>Address Details</b></legend>
        <p id="e-addr-p"><b>Current address</b><p>
        <div class="reg-addr-details">
            <div class="input-box">
                <span class="details">
                    Address 
                </span>
                <input type="text" placeholder=" " value="#53, 5th B Cross, Jayanagar" id="caddress" disabled>
            </div>
            <div class="input-box">
                <span class="details">
                    City 
                </span>
                <input type="text" placeholder="city" value="Bengaluru" id="ccity" disabled>
            </div>
            <div class="input-box">
                <span class="details">
                    State 
                </span>
                <input type="text" placeholder="state" value="Karnataka" id="cstate" disabled>
            </div>
            <div class="input-box">
                <span class="details">
                    Country 
                </span>
                <input type="text" placeholder="country" value="India" id="ccountry" disabled>
            </div>
            <div class="input-box">
                <span class="details">
                    Pincode 
                </span>
                <input type="text" placeholder="pincode" value="560041" id="cpincode" disabled>
            </div>
            <div class="input-box">
                <span class="details">
                    Nationality 
                </span>
                <input type="text" placeholder="Nationality" value="Indian" disabled>
            </div>
        </div>
    </form>
    <form class="e-addr-form" action="#" name="admregisterForm">
        <p id="e-addr-p"><b> Permanent address</b></p>
        <input type="checkbox" id="addr" name="address" value="address" onchange="sameAddress()" checked disabled>
        <label id="same-addr" for="address"> Same as current address</label><br>
        <br>
        <div class="reg-addr-details">
            <div class="input-box">
                <span class="details">
                    Address 
                </span>
                <input type="text" placeholder="House No., Street name" value="#53, 5th B Cross, Jayanagar" id="paddress" disabled>
            </div>
            <div class="input-box">
                <span class="details">
                    City 
                </span>
                <input type="text" placeholder="city" value="Bengaluru" id="pcity"  disabled>
            </div>
            <div class="input-box">
                <span class="details">
                    State 
                </span>
                <input type="text" placeholder="state" value="Karnataka" id="pstate" disabled>
            </div>
            <div class="input-box">
                <span class="details">
                    Country 
                </span>
                <input type="text" placeholder="country" value="India" id="pcountry" disabled>
            </div>
            <div class="input-box">
                <span class="details">
                    Pincode 
                </span>
                <input type="text" placeholder="pincode" value="560041" id="ppincode" disabled>
            </div>
        </div>
    </fieldset>
    </form><br>
    <input type="checkbox" id="switch" class="checkbox" />             
            <label for="switch" class="toggle">
            <p id="toggle-p">
                 SAVE  EDIT
            </p>
            </label>
    </div>

    <div class="section two" id="qualification">
        <br><br><br><br><br>
       <!-- <div class="e-qual-title"><b> Qualification Details</b></div> -->
        <form class="e-qual-form" action="#" name="admregisterForm" id="add_form">
            <fieldset style="margin: 0 35px 0 33px;"> <legend class="e-qual-title"><b>Qualification Details</b></legend>
            <div id="show_item">
                <div class="reg-qual-details">
                    <div class="input-box">
                        <span class="details">
                            Qualification 
                        </span>
                        <input type="text" placeholder=" " value="B.E" disabled>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            University/Board 
                        </span>
                        <input type="text" placeholder=" " value="Visvesvaraya Technological University" disabled>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Subject/Stream 
                        </span>
                        <input type="text" placeholder=" " value="Computer Science Engineering" disabled>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Passing year 
                        </span>
                        <input type="text" placeholder=" " value="2020" disabled>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Percentage/CGPA 
                        </span>
                        <input type="text" placeholder=" " value="8.0" disabled>
                    </div>
                </div>
            </fieldset>    
        </form>
    </div>

    <div class="section three" id="work">
        <br><br><br><br><br>
        <form class="e-work-form" action="#" name="admregisterForm" id="add_form">
            <fieldset style="margin: 0 35px 0 33px;"> <legend class="e-work-title"><b>Work Experience</b></legend>
            <div id="show_work_item">
                <div class="reg-work-details">
                    <div class="input-box">
                        <span class="details">
                            Organization 
                        </span>
                        <input type="text" placeholder=" " value="LTIMindtree" disabled>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Designation 
                        </span>
                        <input type="text" placeholder=" " value="Graduate Engineer Trainee" disabled>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Experience in months 
                        </span>
                        <input type="text" placeholder=" " value="12" disabled>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Date of Leaving 
                        </span>
                        <input type="date" placeholder=" " value="2022-03-30" disabled>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Place of Work 
                        </span>
                        <input type="text" placeholder=" " value="Bengaluru" disabled>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Skills 
                        </span>
                        <input type="text" placeholder=" " value="Database, JAVA, Python" disabled>
                    </div>
                </div>
            </div>
            </fieldset>
        </form>
    </div>
    
    <div class="section four" id="documents">
        <br><br><br><br>
        <form class="e-doc-form" action="#" name="admregisterForm">
            <fieldset style="margin: 0 35px 0 33px;"> <legend class="e-doc-title"><b>Document Upload</b></legend>
            <div class="reg-doc-details">
                <div class="part1">
                <label class="doc-label" for="myfile">SSLC Marksheet (.pdf) </label>
                    <input type="file" id="myfile" name="myfile" disabled>
                <label class="doc-label" for="myfile">12th/Diploma Marksheet (.pdf) </label>
                    <input type="file" id="myfile" name="myfile" disabled>
                <label class="doc-label" for="myfile">Degree Marksheet (.zip) </label>
                    <input type="file" id="myfile" name="myfile" disabled>
                <label class="doc-label" for="myfile">Aadhar Card (.pdf) </label>
                    <input type="file" id="myfile" name="myfile" disabled>
                </div>
                <div class="part2">
                <label class="doc-label" for="myfile">PAN Card (.pdf) </label>
                    <input type="file" id="myfile" name="myfile" disabled>
                <label class="doc-label" for="myfile">Passport  (.pdf) </label>
                    <input type="file" id="myfile" name="myfile" disabled>
                <label class="doc-label" for="myfile">Photo (.jpg,.jpeg) </label>
                    <input type="file" id="myfile" name="myfile" disabled>
                <label class="doc-label" for="myfile">Resume (.pdf) </label>
                    <input type="file" id="myfile" name="myfile" disabled>
                </div>
            </div>
            </fieldset>
        </form>   
    </div><br><br><br><br><br>

</body>
<footer class="index-footer">
    &copy;2024 EDS Technologies Pvt. Ltd.
</footer>
</html>