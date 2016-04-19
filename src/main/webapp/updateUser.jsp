<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<fmt:setLocale value="${myLocale}" />
<fmt:setBundle basename="language" />

<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="updateUser"/></title>
<link rel="stylesheet"
	href="https://bootswatch.com/simplex/bootstrap.css">
<style>
th, td {
    text-align: center;
    vertical-align: middle !important;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="findUserForUpdate" />
					<div class="input-group">
						<input type="text" name="userInformation" value="" required="true"
							class="form-control" placeholder="<fmt:message key="searchUser"/>">
						<span class="input-group-btn">
							<button class="btn btn-success" type="submit"><fmt:message key="go"/></button>
						</span>
					</div>
				</form>
			</div>
			<div class="col-lg-3"></div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<table class="table table-striped table-hover">
					<caption><fmt:message key="users"/></caption>
					<tr>
						<td>#</td>
						<td><fmt:message key="name"/></td>
						<td><fmt:message key="surname"/></td>
						<td><fmt:message key="patronymic"/></td>
						<td><fmt:message key="email"/></td>
						<td><fmt:message key="dormitory"/></td>
						<td><fmt:message key="room"/></td>
						<td><fmt:message key="registered"/></td>
						<td><fmt:message key="role"/></td>
						<td><fmt:message key="sex"/></td>
						<td><fmt:message key="pay"/></td>
					</tr>
					<c:forEach items="${usersForUpdate}" var="item">
						<tr>
							<td>${item.id}</td>
							<td>${item.name}</td>
							<td>${item.surname}</td>
							<td>${item.patronymic}</td>
							<td>${item.email}</td>
							<td>${item.dormitoryNumber}</td>
							<td>${item.roomNumber}</td>
							<td>${item.registrationDate}</td>
							<td>${item.role}</td>
							<td>${item.sex}</td>
							<td>
								<form method="POST" action="controller">
									<input type="hidden" name="selectedUser" value="${item.id}" />
									<input type="hidden" name="command" value="chooseUserToUpdate" />
									<input type="submit" name="changeStatus" value=<fmt:message key="choose"/>
										class="btn btn-success" />
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 text-center">
				<br> <br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toAdminPage" />
					<button type="submit" class="btn btn-info btn-xs">
						<span class="glyphicon glyphicon-step-backward" aria-hidden="true"></span>
						<fmt:message key="toAdminPage"/>
					</button>
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
