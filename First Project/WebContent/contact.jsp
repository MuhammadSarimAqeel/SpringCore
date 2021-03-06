<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact page</title>
</head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body{
background-color:#ab47bc;

}

</style>


<body>
<%@include file="normal_navbar.jsp"  %>
<main id="registerpage">
<div class="container">
<div class="col-md-6 offset-md-3">
<div class="card" id="CARD">
<div class="cardheader text-center">
<span class="fa fa-user-plus"></span>
<h3>Contact Us</h3>
</div>
<div class="cardbody">
<form id="contact-form" method="post" class="myform" name="contact-form">
<div class="form-group">
    <label for="user_name">Name</label>
    <input type="text" name="name" required class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">
    
  </div>

  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>

   <div class="form-group">
    <label for="mobile">Mobile No.</label>
    <input type="text" name="mobile" required class="form-control" id="mobile" placeholder="Enter Mobile Number">
  </div>

 
     <div class="form-group">
    <label for="bio">Enter your Messege</label>
    <textarea name="messege" col="30" row="12"  class="form-control" id="bio" placeholder="Enter Your messege"></textarea>
  </div>
   <div class="container text-center" id="loader" style="display:none;">
  <span  class="fa fa-spinner fa-spin fa-4x" ></span>
  <h4>Please Wait....</h4>
  </div>
  
<div class="container text-center my-5">
<button id="submitbtn" type="submit" class="btn btn-primary">Submit</button>
</div>
</form>
</div>


</div>



</div>




</div>
</main>







<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script src="javascript/myjs.js" type= "text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/10.3.5/sweetalert2.all.js"></script>

<script>
  $(document).ready(function(){
	console.log("loaded.....");
	
	$('#contact-form').on('submit', function(event){
		
		event.preventDefault();
		let form = new FormData (this);
		console.log(form);
		$("#submitbtn").hide();
		$("#loader").show();
		
		$.ajax({
		url: "NewServlet",
		type:"post",
		data: form,
		success: function(data, textStatus, jqXHR){
			console.log(data);
			
			$("#submitbtn").show();
			$("#loader").hide();
			if(data.trim()=== 'done'){
			Swal.fire('Submitted Successfully');
			
			}else{
				Swal.fire(data);
				}
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log(jqXHR);
			
			$("#submitbtn").show();
			$("#loader").hide();
			Swal.fire('An error occured...');
		},
		processData: false,
		contentType: false
			
		});
		
		
	});
	
   });
  </script>
  

</body>
</html>