<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Login Form</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<section class="container">
		<div class="login">
			<h1>Administration system</h1>
			<form method="POST" action="controller">
				<input type="hidden" name="command" value="login" />

				<p>
					<input type="text" name="email" value="" required="true"
						pattern="^[a-z0-9_-]{3,15}$" placeholder="Email" />
				</p>

				<p>
					<input type="password" name="password" value="" required="true"
						pattern="^[a-z0-9_-]{4,15}$" placeholder="Password" />
				</p>

				<p class="submit">
					<input type="submit" value="Submit">
				</p>
			</form>
		</div>
	</section>
</body>
</html>
