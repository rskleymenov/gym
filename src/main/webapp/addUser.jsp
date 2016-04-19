<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>New user</title>
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
					<input type="hidden" name="command" value="addUser" />
					<table class="table table-condensed">
						<caption>New user</caption>
						<tr>
							<td>
								<h4><c:out value="Surname" /></h4>
							</td>
							<td align="right">
								<input class="form-control" type="text" name="surname" value=""
									required="true" placeholder="Surname..." pattern=".{2,}" />
							</td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Name" /></h4>
							</td>
							<td align="right">
								<input class="form-control" type="text" name="name" value=""
									required="true" placeholder="Name..." pattern=".{2,}" />
							</td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Patronymic" /></h4>
							</td>
							<td align="right">
								<input class="form-control" type="text" name="patronymic"
									value="" required="true" placeholder="Patronymic..."
									pattern=".{2,}" />
							</td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Email" /></h4>
							</td>
							<td align="right">
								<input class="form-control" type="text" name="email" value=""
									required="true" placeholder="Email..."
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{1,3}$" />
							</td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Password" /></h4>
							</td>
							<td align="right">
								<input class="form-control" type="text" name="password" value=""
									required="true" placeholder="Password..." pattern=".{4,}" />
							</td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Dormitory №" /></h4>
							</td>
							<td align="right">
								<input class="form-control" type="number" name="dormitory"
									value="" required="true" placeholder="Dormitory №..." min="0" />
							</td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Room №" /></h4>
							</td>
							<td align="right">
								<input class="form-control" type="number" min="0" name="room"
									value="" required="true" placeholder="Room №..." />
							</td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Role" /></h4>
							</td>
							<td align="right">
								<input class="form-control" type="text" name="role" value=""
									required="true" placeholder="Role..." pattern="ADMIN|USER" />
							</td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Sex" /></h4>
							</td>
							<td align="right">
								<input class="form-control" type="text" name="sex" value=""
									required="true" placeholder="Sex..." pattern="MALE|FEMALE" />
							</td>
						</tr>
					</table>
					<h4 style="color: red; text-align: center;"><c:choose>
							<c:when test="${errorFlag == true}">
								<b><c:out value="ERROR: User like this exists!" /></b>
							</c:when>
						</c:choose></h4>
					<h4 style="color: green; text-align: center;"><c:choose>
							<c:when test="${errorFlag == false}">
								<b><c:out value="User has been added!" /></b>
							</c:when>
						</c:choose></h4>

					<input style="width: 100%;" class="btn btn-success" type="submit"
						value="Submit">
				</form>
			</div>
			<div class="col-xs-4"></div>
		</div>
		<div class="row">
			<div class="col-xs-12 text-center">
				<br> <br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toAdminPage" />
					<button type="submit" class="btn btn-info btn-xs">
						<span class="glyphicon glyphicon-step-backward" aria-hidden="true"></span>
						To admin page
					</button>
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
