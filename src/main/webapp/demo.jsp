<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/validator.min.js"></script>
<link rel="stylesheet" href="css/my-block-ui.css">
<script
	src="${pageContext.request.contextPath}/resources/js/my-block-ui.js"></script>



<style>
.form-horizontal .control-label {
	margin-bottom: 5px;
}

.form-horizontal .form-group {
	margin-bottom: 5px;
	margin-left: 0px;
	margin-right: 0px;
}

body {
	background-color: #f4f4f4;
}
</style>



</head>
<body>
<div
		style="max-width: 400px; padding: 10px 20px; margin: auto; margin-top: calc(50vh - 220px);">
		<h3 style="text-align: center">Welcome to SodhanaLibrary</h3>
		<div class="alert alert-danger" role="alert" id="errorField"
			style="display: none">
			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
			<span class="sr-only">Error:</span> <span class="message"></span>
		</div>
		<div class="alert alert-success" role="alert" id="successField"
			style="display: none">
			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
			<span class="sr-only">Success:</span> <span class="message"></span>
		</div>
		<div id="forLoginUser" style="display: none">
			Now you can access <br /> <a href="ChangePassword">Change
				Password</a> <br /> <a href="Logout">Logout</a> <br />
		</div>
		<form class="form-horizontal" id="formLogin" data-toggle="validator"
			role="form">
			<div class="form-group">
				<label for="inputEmail" class="control-label">Email</label> <input
					name="inputEmail" type="email" class="form-control" id="inputEmail"
					placeholder="Enter Email" data-error="Enter valid Email" required>
				<div class="help-block with-errors"></div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="control-label">Password</label> <input
					type="password" name="inputPassword" class="form-control"
					id="inputPassword" placeholder="Enter Password"
					data-error="Password should not be null" required>
				<div class="help-block with-errors"></div>
			</div>
			<div class="row" style="margin-bottom: 7px">
				<div class="col-sm-6" style="text-align: left">
					<a href="forgotPassword.html">Forgot password ?</a>
				</div>
				<div class="col-sm-6" style="text-align: right">
					<a href="emaiRegistration.html">Register</a>
				</div>
			</div>
			<div class="form-group">
				<button style="width: 100%" type="submit"
					class="btn btn-default btn-primary">Login</button>
			</div>
		</form>
	</div>
	<div id="blockUiDiv">
		<img src="wave.svg" />
	</div>
	<div id="blockUiBackdrop"></div>
	<script>
		$(function() {
			$('#formLogin').validator().on(
					'submit',
					function(e) {
						blockUi();
						if (e.isDefaultPrevented()) {
							// handle the invalid form...
						} else {
							// everything looks good!
							$.post(
									"Login",
									$("#formLogin").serialize(),
									function(data) {
										var jdata = JSON.parse(data);
										if (jdata.code == -1) {
											$("#errorField .message").text(
													jdata.message);
											$("#errorField").show();
											$("#successField").hide();
											$("#forLoginUser").hide();
										} else if (jdata.code == 0) {
											$("#successField .message").text(
													jdata.message);
											$("#errorField").hide();
											$("#successField").show();
											$("#formLogin").hide();
											$("#forLoginUser").show();
										}
									}).always(function() {
								unBlockUi();
							});
						}
						return false;
					});
		});
	</script>
	
	
	<div>
	
	<div style="max-width: 390px; padding: 5px; margin: auto;">
		<h2 style="text-align: center">Register Here</h2>
		<div class="alert alert-danger" role="alert" id="errorField"
			style="display: none">
			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
			<span class="sr-only">Error:</span> <span class="message"></span>
		</div>
		<div class="alert alert-success" role="alert" id="successField"
			style="display: none">
			<span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
			<span class="sr-only">Success:</span> <span class="message"></span>
		</div>
		<form class="form-horizontal" id="formRegister"
			data-toggle="validator" role="form">
			<div class="form-group">
				<label for="inputEmail" class="control-label">Email</label> <input
					name="inputEmail"
					pattern="^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$"
					class="form-control" id="inputEmail" placeholder="Enter Email"
					data-error="Enter valid Email" required>
				<div class="help-block with-errors"></div>
			</div>
<!-- 			<div class="form-group"> -->
<!-- 				<label for="inputFirstName" class="control-label">First Name</label> -->
<!-- 				<input pattern="[A-Za-z0-9]{1,20}" name="inputFirstName" -->
<!-- 					class="form-control" id="inputFirstName" -->
<!-- 					placeholder="Enter First Name" -->
<!-- 					data-error="First name should not be null. It should be less than 20 characters. Use only A-Z, a-z, 0-9 charecters" -->
<!-- 					required> -->
<!-- 				<div class="help-block with-errors"></div> -->
<!-- 			</div> -->
			<div class="form-group">
				<label for="inputLastName" class="control-label">Last Name</label> <input
					pattern="[A-Za-z0-9]{1,20}" name="inputLastName"
					class="form-control" id="inputLastName"
					placeholder="Enter Last Name"
					data-error="last name should not be null. It should be less than 20 characters. Use only A-Z, a-z, 0-9 charecters"
					data-toggle="tooltip" data-placement="right" required>
				<div class="help-block with-errors"></div>
			</div>
			<div class="form-group">
				<label for="inputPassword" class="control-label">Password</label> <input
					type="password" pattern="[A-Za-z0-9@#$%!^&*]{6,30}"
					name="inputPassword" class="form-control" id="inputPassword"
					placeholder="Enter Password"
					data-error="Password should not be null. It should be greater than 6 and less than 30 characters . Use only A-Z, a-z, 0-9, @ # $ % ! ^ & * charecters"
					required>
				<div class="help-block with-errors"></div>
			</div>
			<div class="form-group">
				<label for="inputPassword1" class="control-label">Confirm
					Password</label> <input type="password" name="inputPassword1"
					class="form-control" id="inputPassword1"
					data-match="#inputPassword" placeholder="Enter Password Again"
					data-error="It should not be null and should match with above password"
					required>
				<div class="help-block with-errors"></div>
			</div>
			<div class="form-group">
				<button style="width: 100%" type="submit"
					class="btn btn-default btn-primary">Register</button>
			</div>
		</form>
		<div id="blockUiDiv">
			<img src="wave.svg" />
		</div>
		<div id="blockUiBackdrop"></div>
	</div>
	<script>
		$(function() {
			$('#formRegister').validator().on(
					'submit',
					function(e) {
						if (e.isDefaultPrevented()) {
							// handle the invalid form...
						} else {
							blockUi();
							// everything looks good!
							$.post(
									"RegisterEmail",
									$("#formRegister").serialize(),
									function(data) {
										var jdata = JSON.parse(data);
										if (jdata.code == -1) {
											$("#errorField .message").text(
													jdata.message);
											$("#errorField").show();
											$("#successField").hide();
										} else {
											$("#successField .message").text(
													jdata.message);
											$("#errorField").hide();
											$("#successField").show();
											$("#formRegister").hide();
										}
									}).always(function() {
								unBlockUi();
							});
						}
						return false;
					});

		});
	</script>
	
	
	
	</div>
</body>
</html>