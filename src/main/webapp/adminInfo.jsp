<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Administrator page</title>
<link rel="stylesheet"
	href="https://bootswatch.com/simplex/bootstrap.css">
<style>
input {
	font-weight: bold !important;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<div class="row">
			<div class="col-xs-1"></div>
			<div class="col-xs-5">
				<h3 align="center"><b>Your information</b></h3>
				<table class="table table-striped">
					<tr>
						<td>
							<c:out value="#" />
						</td>
						<td>
							<c:out value="${user.id}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Surname" />
						</td>
						<td>
							<c:out value="${user.surname}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Name" />
						</td>
						<td>
							<c:out value="${user.name}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Patronymic" />
						</td>
						<td>
							<c:out value="${user.patronymic}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Email" />
						</td>
						<td>
							<c:out value="${user.email}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Dormitory №" />
						</td>
						<td>
							<c:out value="${user.dormitoryNumber}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Room №" />
						</td>
						<td>
							<c:out value="${user.roomNumber}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Registered" />
						</td>
						<td>
							<c:out value="${user.registrationDate}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Sex" />
						</td>
						<td>
							<c:out value="${user.sex}" />
						</td>
					</tr>
				</table>
			</div>

			<div class="col-xs-5">
				<h3 align="center"><b>Administrator menu</b></h3>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toAddPaymentById" />
					<input class="btn btn-info btn-block" type="submit"
						value="Users' payments">
				</form>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toAddUser" />
					<input class="btn btn-info btn-block" type="submit"
						value="Create user">
				</form>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toUpdateUser" />
					<input class="btn btn-info btn-block" type="submit"
						value="Update user">
				</form>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toAnalytic" />
					<input class="btn btn-info btn-block btn-block" type="submit"
						value="Analytic">
				</form>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toAddCosts" />
					<input class="btn btn-info btn-block" type="submit" value="Costs">
				</form>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toPaymentInfo" />
					<input class="btn btn-info btn-block" type="submit"
						value="Bill info">
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-1"></div>
			<div class="col-xs-10">
				<h3 align="center"><b>Payment information</b></h3>
				<table
					style="text-align: center; vertical-align: middle !important;"
					class="table table-striped">
					<tr>
						<td>
							<c:out value="Card №" />
						</td>
						<td>
							<c:out value="${billInformation.cardNumber}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Price" />
						</td>
						<td>
							<c:out value="${billInformation.price}" />
						</td>
					</tr>
				</table>
			</div>
			<div class="col-xs-1"></div>
		</div>
		<br> <br> <br>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
