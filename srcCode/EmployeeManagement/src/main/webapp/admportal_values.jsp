<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js'></script>
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
                        Full Name *
                    </span>
                    <input type="text" placeholder="Enter your name" value="Madhurya B">
                </div>
                <div class="input-box">
                    <span class="details">
                        Date of Birth *
                    </span>
                    <input type="date" placeholder="Enter your dob" value="1995-02-24">
                </div>
                <div class="input-box">
                    <span class="details">
                        Father Name 
                    </span>
                    <input type="text" placeholder="Enter your father name" value="Bhargavan S">
                </div>
                <div class="input-box">
                    <span class="details">
                        Mother Name 
                    </span>
                    <input type="text" placeholder="Enter your mother name" value="Shashikala R">
                </div>
                <div class="input-box">
                    <span class="details">
                        Phone Number *
                    </span>
                    <input type="text" placeholder="Enter your number" value="9036432140">
                </div>
                <div class="gender-details">
                    <input type="radio" name="gender" id="dot-1">
                    <input type="radio" name="gender" id="dot-2" checked>
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
                            <span class="gender">Other</span>
                        </label>
                    </div>
                </div> 
                <div class="input-box" style="margin-left: 41.5%;">
                    <span class="details">
                        Email 
                    </span>
                    <input type="text" placeholder="Enter your email" value="madhuryabhargavan@gmail.com" disabled>
                </div>
                
                <div class="input-box" style="margin-left: 47.5%; margin-top: 5%; position: absolute; width: 13.5%;">
                    <span class="details">
                        Employee ID 
                    </span>
                    <input type="text" placeholder="Employee ID" value="911488" disabled>
                </div>
                
                
                <div class="profile-pic-wrapper">
                    <div class="pic-holder">
                      <img id="profilePic" class="pic" src="https://source.unsplash.com/random/150x150?person">
                      <Input class="uploadProfileInput" type="file" name="profile_pic" id="newProfilePhoto" accept="image/*" style="opacity: 0;" />
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
                          <script>
                                function openForm() {
                                    document.getElementById("myForm").style.display = "block";
                                }
                                var hclose = document.getElementsByClassName("close")[0];
                                hclose.onclick = function() {
                                    myForm.style.display = "none";
                                }
                          </script>
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
                                  Madhurya B
                                  <p id="hp"> Administrative Assistant </p>
                                  <p id="hp"> Admin </p>
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
    <form class="e-addr-form" action="#" name="admregisterForm">
        <fieldset style="margin: 0 35px 0 33px;"><legend class="e-addr-title"><b>Address Details</b></legend>
        <p id="e-addr-p"><b>Current address</b><p>
        <div class="reg-addr-details">
            <div class="input-box">
                <span class="details">
                    Address *
                </span>
                <input type="text" placeholder="House No., Street name" value="#1921, 3rd main, Kengri Satellite Town" id="caddress">
            </div>
            <div class="input-box">
                <span class="details">
                    City *
                </span>
                <input type="text" placeholder="city" value="Bengaluru" id="ccity">
            </div>
            <div class="input-box">
                <span class="details">
                    State *
                </span>
                <input type="text" placeholder="state" value="Karnataka" id="cstate">
            </div>
            <div class="input-box">
                <span class="details">
                    Country *
                </span>
                <input type="text" placeholder="country" value="India" id="ccountry">
            </div>
            <div class="input-box">
                <span class="details">
                    Pincode *
                </span>
                <input type="text" placeholder="pincode" value="560060" id="cpincode">
            </div>
            <div class="input-box">
                <span class="details">
                    Nationality *
                </span>
                <input type="text" placeholder="Nationality" value="Indian">
            </div>
        </div>
    </form>
    <form class="e-addr-form" action="#" name="admregisterForm">
        <p id="e-addr-p"><b> Permanent address</b></p>
        <input type="checkbox" id="addr" name="address" value="address" onchange="sameAddress()" checked>
        <label id="same-addr" for="address"> Same as current address</label><br>
        <br>
        <div class="reg-addr-details">
            <div class="input-box">
                <span class="details">
                    Address *
                </span>
                <input type="text" placeholder="House No., Street name" value="#1921, 3rd main, Kengri Satellite Town" id="paddress">
            </div>
            <div class="input-box">
                <span class="details">
                    City *
                </span>
                <input type="text" placeholder="city" value="Bengaluru" id="pcity">
            </div>
            <div class="input-box">
                <span class="details">
                    State *
                </span>
                <input type="text" placeholder="state" value="Karnataka" id="pstate">
            </div>
            <div class="input-box">
                <span class="details">
                    Country *
                </span>
                <input type="text" placeholder="country" value="India" id="pcountry">
            </div>
            <div class="input-box">
                <span class="details">
                    Pincode *
                </span>
                <input type="text" placeholder="pincode" value="560060" id="ppincode">
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
        <form class="e-qual-form" action="#qualification" name="admregisterForm" id="qual-enable">
            <fieldset style="margin: 0 35px 0 33px;"> <legend class="e-qual-title"><b>Qualification Details</b></legend>
            <div id="show_item">
                <div class="reg-qual-details">
                    <div class="input-box">
                        <span class="details">
                            Qualification *
                        </span>
                        <input type="text" placeholder=" " value="B.E">
                    </div>
                    <div class="input-box">
                        <span class="details">
                            University/Board *
                        </span>
                        <input type="text" placeholder=" " value="Visvesvaraya Technological University">
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Subject/Stream *
                        </span>
                        <input type="text" placeholder=" " value="Information Science Engineering">
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Passing year *
                        </span>
                        <input type="text" placeholder=" " value="2017">
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Percentage/CGPA *
                        </span>
                        <input type="text" placeholder=" " value="8.5">
                    </div>
                </div>
                <div class="add-btn">
                    <button class="add_item_btn disabled-btn" id="add-btn">ADD</button>
                </div>
            </div>
            </fieldset>
        </form>
        <input type="checkbox" id="qual-switch" class="qual-checkbox" />             
            <label for="qual-switch" class="qual-toggle">
            <p id="qual-toggle-p">
                SAVE    EDIT
            </p>
            </label>       
	<script>
            $(document).ready(function() {
                    $("#qual-enable :input").prop("disabled", true);
                    $(".qual-checkbox").click(function() {
                        if (this.value=="EDIT") {
                            this.value = "SAVE";
                            $("#qual-enable :input").prop("disabled", true);
                        }
                        else {
                            this.value = "EDIT";
                            $("#qual-enable :input").prop("disabled", false);
                        }
                    });
                });

		$(document).ready(function(){
			$(".add_item_btn").click(function(e){
				e.preventDefault();
				$("#show_item").prepend(`<div><div class="reg-qual-details">
                                    <div class="input-box">
                                        <span class="details">
                                            Qualification * 
                                        </span>
                                        <input type="text" placeholder=" ">
                                    </div>
                                    <div class="input-box" style="margin-left:25px;">
                                        <span class="details">
                                            University/Board * 
                                        </span>
                                        <input type="text" placeholder=" ">
                                    </div>
                                    <div class="input-box" style="margin-left:40px;">
                                        <span class="details">
                                            Subject/Stream * 
                                        </span>
                                        <input type="text" placeholder=" ">
                                    </div>
                                    <div class="input-box" style="margin-left:40px;">
                                        <span class="details">
                                            Passing year * 
                                        </span>
                                        <input type="text" placeholder=" ">
                                    </div>
                                    <div class="input-box" style="margin-left:35px;">
                                        <span class="details">
                                            Percentage/CGPA * 
                                        </span>
                                        <input type="text" placeholder=" ">
                                    </div>
                                    <br>
									</div>
                                    <div class="add-btn">
										<button class="remove_item_btn" id="add-btn">REMOVE</button>
									</div>
								</div>`);
			});
			$(document).on('click','.remove_item_btn',function(e){
				e.preventDefault();
				let row_item=$(this).parent().parent();
				$(row_item).remove();
			});
		});
	</script>
    </div>

    <div class="section three" id="work">
        <br><br><br><br><br>
        <form class="e-work-form" action="#work" name="admregisterForm" id="work-enable">
            <fieldset style="margin: 0 35px 0 33px;"> <legend class="e-work-title"><b>Work Experience</b></legend>
            <div id="show_work_item">
                <div class="reg-work-details">
                    <div class="input-box">
                        <span class="details">
                            Organization *
                        </span>
                        <input type="text" placeholder=" " value="Cognizant Technologies">
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Designation *
                        </span>
                        <input type="text" placeholder=" " value="B.E">
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Experience in months *
                        </span>
                        <input type="text" placeholder=" " value="24">
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Date of Leaving *
                        </span>
                        <input type="date" placeholder=" " value="2019-05-30">
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Place of Work *
                        </span>
                        <input type="text" placeholder=" " value="Chennai">
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Skills *
                        </span>
                        <input type="text" placeholder=" " value="Cloud, JAVA, SQL">
                    </div>
                </div>
                <div class="add-btn">
                    <button class="add_work_btn" id="add-btn">ADD</button>
                </div>
            </div>    
            </fieldset>
        </form>
        <input type="checkbox" id="work-switch" class="work-checkbox" />             
            <label for="work-switch" class="work-toggle">
            <p id="work-toggle-p">
                SAVE    EDIT
            </p>
            </label>
        <script>

            $(document).ready(function() {
                    $("#work-enable :input").prop("disabled", true);
                    $(".work-checkbox").click(function() {
                        if (this.value=="EDIT") {
                            this.value = "SAVE";
                            $("#work-enable :input").prop("disabled", true);
                        }
                        else {
                            this.value = "EDIT";
                            $("#work-enable :input").prop("disabled", false);
                        }
                    });
                });

    $(document).ready(function(){
        $(".add_work_btn").click(function(e){
            e.preventDefault();
            $("#show_work_item").prepend(`<div><div class="reg-work-details">
                                <div class="input-box">
                                    <span class="details">
                                        Organization * 
                                    </span>
                                    <input type="text" placeholder=" ">
                                </div>
                                <div class="input-box">
                                    <span class="details">
                                        Designation * 
                                    </span>
                                    <input type="text" placeholder=" ">
                                </div>
                                <div class="input-box">
                                    <span class="details">
                                        Experience in months * 
                                    </span>
                                    <input type="text" placeholder=" ">
                                </div>
                                <div class="input-box">
                                    <span class="details">
                                        Date of Leaving *
                                    </span>
                                    <input type="date" placeholder=" ">
                                </div>
                                <div class="input-box">
                                    <span class="details">
                                        Place of Work * 
                                    </span>
                                    <input type="text" placeholder=" ">
                                </div>
                                <div class="input-box">
                                    <span class="details">
                                        Skills * 
                                    </span>
                                    <input type="text" placeholder="">
                                </div>
                                </div>
                                 <div class="add-btn">
                                    <button class="remove_work_btn" id="add-btn">REMOVE</button>
                                </div>
                            </div>`);
        });
        $(document).on('click','.remove_work_btn',function(e){
            e.preventDefault();
            let row_work_item=$(this).parent().parent();
            $(row_work_item).remove();
        });
    });
</script>
    </div>
    
    <div class="section four" id="documents">
        <br><br><br><br>
        <form class="e-doc-form" action="#" name="admregisterForm" id="doc-enable">
            <fieldset style="margin: 0 35px 0 33px;"> <legend class="e-doc-title"><b>Document Upload</b></legend>
            <div class="reg-doc-details">
                <div class="part1">
                <label class="doc-label" for="myfile">SSLC Marksheet * (.pdf) </label>
                    <input type="file" id="myfile" name="myfile">
                <label class="doc-label" for="myfile">12th/Diploma Marksheet * (.pdf) </label>
                    <input type="file" id="myfile" name="myfile">
                <label class="doc-label" for="myfile">Degree Marksheet * (.zip) </label>
                    <input type="file" id="myfile" name="myfile">
                <label class="doc-label" for="myfile">Aadhar Card * (.pdf) </label>
                    <input type="file" id="myfile" name="myfile">
                </div>
                <div class="part2">
                <label class="doc-label" for="myfile">PAN Card * (.pdf) </label>
                    <input type="file" id="myfile" name="myfile">
                <label class="doc-label" for="myfile">Passport  (.pdf) </label>
                    <input type="file" id="myfile" name="myfile">
                <label class="doc-label" for="myfile">Photo * (.jpg,.jpeg) </label>
                    <input type="file" id="myfile" name="myfile">
                <label class="doc-label" for="myfile">Resume * (.pdf) </label>
                    <input type="file" id="myfile" name="myfile">
                </div>
            </div>
            </fieldset>
        </form>   
        <br>
        <input type="checkbox" id="doc-switch" class="doc-checkbox" />             
            <label for="doc-switch" class="doc-toggle">
            <p id="doc-toggle-p">
                SAVE    EDIT
            </p>
            </label>
        <script type="text/javascript">
            $(document).ready(function() {
                $("#doc-enable :input").prop("disabled", true);
                $(".doc-checkbox").click(function() {
                    if (this.value=="EDIT") {
                        this.value = "SAVE";
                        $("#doc-enable :input").prop("disabled", true);
                    }
                    else {
                        this.value = "EDIT";
                        $("#doc-enable :input").prop("disabled", false);
                    }
                });
            });
        </script>
    </div><br><br><br><br><br>

</body>
<footer class="index-footer">
    &copy;2024 EDS Technologies Pvt. Ltd.
</footer>
</html>