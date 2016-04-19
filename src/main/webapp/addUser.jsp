<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<fmt:setLocale value="${myLocale}" />
<fmt:setBundle basename="language" />

<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="createUser" /></title>
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
						<caption>
							<fmt:message key="createUser" />
						</caption>
						<tr>
							<td>
								<h4><fmt:message key="surname" /></h4>
							</td>
							<td align="right"><input class="form-control" type="text"
									name="surname" value="" required="true" pattern=".{2,}" /></td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="name" /></h4>
							</td>
							<td align="right"><input class="form-control" type="text"
									name="name" value="" required="true" pattern=".{2,}" /></td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="patronymic" /></h4>
							</td>
							<td align="right"><input class="form-control" type="text"
									name="patronymic" value="" required="true" pattern=".{2,}" />
							</td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="email" /></h4>
							</td>
							<td align="right"><input class="form-control" type="text"
									name="email" value="" required="true"
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{1,3}$" /></td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="password" /></h4>
							</td>
							<td align="right"><input class="form-control" type="text"
									name="password" value="" required="true" pattern=".{4,}" /></td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="dormitory" /></h4>
							</td>
							<td align="right"><input class="form-control" type="number"
									name="dormitory" value="" required="true" min="0" /></td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="room" /></h4>
							</td>
							<td align="right"><input class="form-control" type="number"
									min="0" name="room" value="" required="true" /></td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="role" /></h4>
							</td>
							<td align="right"><input class="form-control" type="text"
									name="role" value="" required="true" pattern="ADMIN|USER" /></td>
						</tr>
						<tr>
							<td>
								<h4><fmt:message key="sex" /></h4>
							</td>
							<td align="right"><input class="form-control" type="text"
									name="sex" value="" required="true" pattern="MALE|FEMALE" /></td>
						</tr>
					</table>
					<h4 style="color: red; text-align: center;"><c:choose>
							<c:when test="${errorFlag == true}">
								<b><fmt:message key="userLikeThisExists" /></b>
							</c:when>
						</c:choose></h4>
					<h4 style="color: green; text-align: center;"><c:choose>
							<c:when test="${errorFlag == false}">
								<b><fmt:message key="userAdded" /></b>
							</c:when>
						</c:choose></h4>

					<input style="width: 100%;" class="btn btn-success" type="submit"
						value="<fmt:message key="submit"/>">
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
						<fmt:message key="toAdminPage" />
					</button>
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
