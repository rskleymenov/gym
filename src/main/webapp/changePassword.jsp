<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>User page</title>
<link rel="stylesheet"
	href="https://bootswatch.com/simplex/bootstrap.css">
<style>
th, td {
	vertical-align: middle !important;
}
</style>
</head>
<body>
	<c:set var="myWidth" scope="session" value="70" />
	<div class="container">
		<jsp:include page="header.jsp" />
		<div class="row">
			<div class="col-xs-4"></div>
			<div class="col-xs-4">
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="changePassword" />
					<br> <br> <br>
					<table class="table table-striped">
						<caption>Change password</caption>
						<tr>
							<td>
								<h4><c:out value="Current password*" /></h4>
							<td width=50%; align="right">
								<input class="form-control" type="password"
									name="currentPassword" value="" required="true" pattern=".{4,}" />
							</td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="New password*" /></h4>
							</td>
							<td align="right">
								<input class="form-control" type="password" name="newPassword"
									value="" required="true" pattern=".{4,}" />
							</td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Confirm password*" /></h4>
							</td>
							<td align="right">
								<input class="form-control" type="password"
									name="confirmPassword" value="" required="true" pattern=".{4,}" />
							</td>
						</tr>
					</table>
					<input style="width: 100%;" class="btn btn-success" type="submit"
						value="Change">
				</form>
				<h4 style="color: red; text-align: center;"><c:choose>
						<c:when test="${errorFlag == true}">
							<br>
							<b><c:out
									value="ERROR: Bad current password or bad confirmed password" /></b>
						</c:when>
					</c:choose></h4>
				<h4 style="color: green; text-align: center;"><c:choose>
						<c:when test="${errorFlag == false}">
							<br>
							<b><c:out value="Password successfully changed" /></b>
						</c:when>
					</c:choose></h4>
			</div>
			<div class="col-xs-4"></div>
		</div>
		<br> <br> <br>
		<div class="row">
			<div class="col-xs-12 text-center">
				<br> <br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toUserPage" />
					<button type="submit" class="btn btn-info btn-xs">
						<span class="glyphicon glyphicon-step-backward" aria-hidden="true"></span>
						To user page
					</button>
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
