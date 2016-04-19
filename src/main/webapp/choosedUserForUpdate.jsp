<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<fmt:setLocale value="${myLocale}" />
<fmt:setBundle basename="language" />

<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="updateUser" /></title>
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
						<caption>
							<fmt:message key="updateUser" />
						</caption>
						<tr>
							<td>
								<h4><c:out value="#" /></h4>
							</td>
							<td align="right"><input readonly="true"
									class="form-control" type="text" name="id"
									value="${userToUpdate.id}" required="true" placeholder="Id..." />
							</td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="surname" /></h4>
							</td>
							<td align="right"><input class="form-control" type="text"
									name="surname" value="${userToUpdate.surname}" required="true"
									pattern=".{2,}" /></td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="name" /></h4>
							</td>
							<td align="right"><input class="form-control" type="text"
									name="name" value="${userToUpdate.name}" required="true"
									pattern=".{2,}" /></td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="patronymic" /></h4>
							</td>
							<td align="right"><input class="form-control" type="text"
									name="patronymic" value="${userToUpdate.patronymic}"
									required="true" pattern=".{2,}" /></td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="email" /></h4>
							</td>
							<td align="right"><input class="form-control" type="text"
									name="email" value="${userToUpdate.email}" required="true"
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{1,3}$" /></td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="password" /></h4>
							</td>
							<td align="right"><input class="form-control" type="text"
									name="password" value="${userToUpdate.password}"
									required="true" pattern=".{4,}" /></td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="dormitory" /></h4>
							</td>
							<td align="right"><input type="number" min="0"
									class="form-control" type="text" name="dormitory"
									value="${userToUpdate.dormitoryNumber}" required="true" /></td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="room" /></h4>
							</td>
							<td align="right"><input type="number" min="0"
									class="form-control" type="text" name="room"
									value="${userToUpdate.roomNumber}" required="true" />
							</td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="role" /></h4>
							</td>
							<td align="right"><input class="form-control" type="text"
									name="role" value="${userToUpdate.role}" required="true"
									pattern="ADMIN|USER" /></td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="sex" /></h4>
							</td>
							<td align="right"><input class="form-control" type="text"
									name="sex" value="${userToUpdate.sex}" required="true"
									pattern="MALE|FEMALE" /></td>
						</tr>
					</table>
					<h4 style="color: red; text-align: center;"><c:choose>
							<c:when test="${errorFlag == true}">
								<b><fmt:message key="userLikeThisExists" /></b>
							</c:when>
						</c:choose></h4>
					<h4 style="color: green; text-align: center;"><c:choose>
							<c:when test="${errorFlag == false}">
								<b><fmt:message key="userUpdated" /></b>
							</c:when>
						</c:choose></h4>
					<input style="width: 100%;" class="btn btn-success" type="submit"
						value="<fmt:message key="update"/>">
				</form>
			</div>
			<div class="col-xs-4"></div>
		</div>
		<div class="row">
			<div class="col-xs-12 text-center">
				<br> <br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toUpdateUser" />
					<button type="submit" class="btn btn-info btn-xs">
						<span class="glyphicon glyphicon-step-backward" aria-hidden="true"></span>
						<fmt:message key="toFindUserPage" />
					</button>
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
