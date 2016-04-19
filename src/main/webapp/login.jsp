<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<fmt:setLocale value="${myLocale}" />
<fmt:setBundle basename="language" />

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
			<h1>
				<fmt:message key="adminSystem" />
			</h1>
			<form method="POST" action="controller">
				<input type="hidden" name="command" value="login" />

				<p><input type="text" name="email" value="" required="true"
						placeholder="<fmt:message key="email"/>" /></p>

				<p><input type="password" name="password" value=""
						required="true" pattern="^[a-z0-9_-]{4,15}$"
						placeholder="<fmt:message key="password"/>" /></p>

				<p class="submit"><input type="submit"
						value="<fmt:message key="submit"/>"></p>
			</form>
		</div>
		<div style="margin-top: 25px;">
			<table style="margin: auto;">
				<tr>
					<td>
						<form method="POST" action="controller">
							<input type="hidden" name="loc" value="ua_UA" />
							<input type="hidden" name="command" value="changeLocale" />
							<input
								style="background: none; color: white; border: none; cursor: pointer; box-shadow: none;"
								type="submit" value="ua">
						</form>
					</td>
					<td>
						<form method="POST" action="controller">
							<input type="hidden" name="loc" value="en_EN" />
							<input type="hidden" name="command" value="changeLocale" />
							<input
								style="background: none; color: white; border: none; cursor: pointer; box-shadow: none;"
								type="submit" value="en">
						</form>
					</td>
				</tr>
			</table>
		</div>
	</section>
</body>
</html>
