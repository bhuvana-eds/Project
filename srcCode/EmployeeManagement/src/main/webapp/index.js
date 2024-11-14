/**
 * 
 */

//empportal.jsp, admportal.jsp
//-----------------------------------------------------

function myFunction() {
  document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}


/*emp_registration.jsp 
---------------------------------------*/

function validateEmpRegister() {
  var form = document.getElementById('registerForm');
  
  for(var i=0; i < form.elements.length; i++){
      if(form.elements[i].value === '' && form.elements[i].hasAttribute('required')){
        console.log('There are some required fields!');
        return false;
      }
    }
  
  onSignup();
} 

function onSignup() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    
    disableSubmitButton();
    
    if (this.readyState == 4 && this.status == 200) {
      enableSubmitButton();
    }
    else {
      console.log('AJAX call failed!');
      setTimeout(function(){
        enableSubmitButton();
      }, 1000);
    }
    
  };
  xhttp.open("GET", "ajax_info.txt", true);
  xhttp.send();
}


/* Upload profile photo
-------------------------------------------------*/


document.addEventListener("change", function (event) {
  if (event.target.classList.contains("uploadProfileInput")) {
    var triggerInput = event.target;
    var currentImg = triggerInput.closest(".pic-holder").querySelector(".pic")
      .src;
    var holder = triggerInput.closest(".pic-holder");
    var wrapper = triggerInput.closest(".profile-pic-wrapper");

    var alerts = wrapper.querySelectorAll('[role="alert"]');
    alerts.forEach(function (alert) {
      alert.remove();
    });

    triggerInput.blur();
    var files = triggerInput.files || [];
    if (!files.length || !window.FileReader) {
      return;
    }

    if (/^image/.test(files[0].type)) {
      var reader = new FileReader();
      reader.readAsDataURL(files[0]);

      reader.onloadend = function () {
        holder.classList.add("uploadInProgress");
        holder.querySelector(".pic").src = this.result;

        var loader = document.createElement("div");
        loader.classList.add("upload-loader");
        loader.innerHTML =
          '<div class="spinner-border text-primary" role="status"><span class="sr-only">Loading...</span></div>';
        holder.appendChild(loader);

        setTimeout(function () {
          holder.classList.remove("uploadInProgress");
          loader.remove();

          var random = Math.random();
          if (random < 0.9) {
            wrapper.innerHTML +=
              '<div class="snackbar show" role="alert"><i class="fa fa-check-circle text-success"></i> Profile image updated successfully</div>';
            triggerInput.value = "";
            setTimeout(function () {
              wrapper.querySelector('[role="alert"]').remove();
            }, 3000);
          } else {
            holder.querySelector(".pic").src = currentImg;
            wrapper.innerHTML +=
              '<div class="snackbar show" role="alert"><i class="fa fa-times-circle text-danger"></i> There is an error while uploading! Please try again later.</div>';
            triggerInput.value = "";
            setTimeout(function () {
              wrapper.querySelector('[role="alert"]').remove();
            }, 3000);
          }
        }, 1500);
      };
    } else {
      wrapper.innerHTML +=
        '<div class="alert alert-danger d-inline-block p-2 small" role="alert">Please choose a valid image.</div>';
      setTimeout(function () {
        var invalidAlert = wrapper.querySelector('[role="alert"]');
        if (invalidAlert) {
          invalidAlert.remove();
        }
      }, 3000);
    }
  }
});


/* Active tabs highlight
-----------------------------------------------*/


document.addEventListener('DOMContentLoaded',
	function activetab() {
		const navItems = document
			.querySelectorAll('.nav-item');

		navItems.forEach(item => {
			item.addEventListener('click',
				function activetab () {
					navItems.forEach(navItem => navItem
						.classList.remove('active'));
					this.classList.add('active');
				});
		});
	});


/* Checkbox Address
-----------------------------------------------*/


  function sameAddress(){
    if(document.getElementById("addr").checked){
        document.getElementById("paddress").value = document.getElementById("caddress").value;
        document.getElementById("pcity").value = document.getElementById("ccity").value;
        document.getElementById("pstate").value = document.getElementById("cstate").value;
        document.getElementById("pcountry").value = document.getElementById("ccountry").value;
        document.getElementById("ppincode").value = document.getElementById("cpincode").value;
    }else{
        document.getElementById("paddress").value ="";
        document.getElementById("pcity").value="";
        document.getElementById("pstate").value ="";
        document.getElementById("pcountry").value="";
        document.getElementById("ppincode").value="";
        
    }
}



/* Hierarchy
-----------------------------------------------*/


function openForm() {
  document.getElementById("myForm").style.display = "block";
}

var hclose = document.getElementsByClassName("close")[0];
 
 // When the user clicks on <span> (x), close the modal
 hclose.onclick = function() {
    myForm.style.display = "none";
 }




 /* Responsive nav bar
 ---------------------------------------------------*/

//  function responsivepage() {
//   var x = document.getElementById("mynav");
//   if (x.className === "topnav") {
//     x.className += " responsive";
//   } else {
//     x.className = "topnav";
//   }
// }



 


/**
 * 
 */