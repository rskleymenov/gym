<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Add payment by id</title>
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
					<input type="hidden" name="command" value="updateUser" />
					<table class="table table-condensed">
						<caption>User to update</caption>
						<tr>
							<td><h4><c:out value="id" /></h4></td>
							<td align="right"><input disabled="true" type="text" name="id"
									value="${userToUpdate.id}" required="true"
									placeholder="Id..." /></td>
						</tr>
						<tr>
							<td><h4><c:out value="Surname" /></h4></td>
							<td align="right"><input type="text" name="surname"
									value="${userToUpdate.surname}" required="true"
									placeholder="Surname..." /></td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Name" /></h4>
							</td>
							<td align="right"><input type="text" name="name"
									value="${userToUpdate.name}" required="true"
									placeholder="Name..." /></td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Patronymic" /></h4>
							</td>
							<td align="right"><input type="text" name="patronymic"
									value="${userToUpdate.patronymic}" required="true"
									placeholder="Patronymic..." /></td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Email" /></h4>
							</td>
							<td align="right"><input type="text" name="email"
									value="${userToUpdate.email}" required="true"
									placeholder="Email..." /></td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Password" /></h4>
							</td>
							<td align="right"><input type="text" name="password"
									value="${userToUpdate.password}" required="true"
									placeholder="Password..." /></td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Dormitory №" /></h4>
							</td>
							<td align="right"><input type="text" name="dormitory"
									value="${userToUpdate.dormitoryNumber}" required="true"
									placeholder="Dormitory №..." /></td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Room №" /></h4>
							</td>
							<td align="right"><input type="text" name="room"
									value="${userToUpdate.roomNumber}" required="true"
									placeholder="Room №..." /></td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Role" /></h4>
							</td>
							<td align="right"><input type="text" name="role"
									value="${userToUpdate.role}" required="true"
									placeholder="Role..." /></td>
						</tr>
						<tr>
							<td>
								<h4><c:out value="Sex" /></h4>
							</td>
							<td align="right"><input type="text" name="sex"
									value="${userToUpdate.sex}" required="true"
									placeholder="Sex..." /></td>
						</tr>
					</table>
					<input type="submit" value="Update">
				</form>
			</div>
			<div class="col-xs-4"></div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
