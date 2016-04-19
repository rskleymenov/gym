<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<fmt:setLocale value="${myLocale}" />
<fmt:setBundle basename="language" />

<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="adminPage" /></title>
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
				<h3 align="center"><b><fmt:message key="yourInfo"/></b></h3>
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
							<fmt:message key="surname"/>
						</td>
						<td>
							<c:out value="${user.surname}" />
						</td>
					</tr>
					<tr>
						<td>
							<fmt:message key="name"/>
						</td>
						<td>
							<c:out value="${user.name}" />
						</td>
					</tr>
					<tr>
						<td>
							<fmt:message key="patronymic"/>
						</td>
						<td>
							<c:out value="${user.patronymic}" />
						</td>
					</tr>
					<tr>
						<td>
							<fmt:message key="email"/>
						</td>
						<td>
							<c:out value="${user.email}" />
						</td>
					</tr>
					<tr>
						<td>
							<fmt:message key="dormitory"/>
						</td>
						<td>
							<c:out value="${user.dormitoryNumber}" />
						</td>
					</tr>
					<tr>
						<td>
							<fmt:message key="room"/>
						</td>
						<td>
							<c:out value="${user.roomNumber}" />
						</td>
					</tr>
					<tr>
						<td>
							<fmt:message key="registered"/>
						</td>
						<td>
							<c:out value="${user.registrationDate}" />
						</td>
					</tr>
					<tr>
						<td>
							<fmt:message key="sex"/>
						</td>
						<td>
							<c:out value="${user.sex}" />
						</td>
					</tr>
				</table>
			</div>

			<div class="col-xs-5">
				<h3 align="center"><b><fmt:message key="adminMenu"/></b></h3>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toAddPaymentById" />
					<input class="btn btn-info btn-block" type="submit"
						value="<fmt:message key="userPayments"/>">
				</form>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toAddUser" />
					<input class="btn btn-info btn-block" type="submit"
						value="<fmt:message key="createUser"/>">
				</form>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toUpdateUser" />
					<input class="btn btn-info btn-block" type="submit"
						value="<fmt:message key="updateUser"/>">
				</form>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toAnalytic" />
					<input class="btn btn-info btn-block btn-block" type="submit"
						value="<fmt:message key="analytic"/>">
				</form>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toAddCosts" />
					<input class="btn btn-info btn-block" type="submit" value="<fmt:message key="costs"/>">
				</form>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toPaymentInfo" />
					<input class="btn btn-info btn-block" type="submit"
						value="<fmt:message key="billInfo"/>">
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-1"></div>
			<div class="col-xs-10">
				<h3 align="center"><b><fmt:message key="paymentInfo"/></b></h3>
				<table
					style="text-align: center; vertical-align: middle !important;"
					class="table table-striped">
					<tr>
						<td>
							<fmt:message key="cardNumber"/>
						</td>
						<td>
							<c:out value="${billInformation.cardNumber}" />
						</td>
					</tr>
					<tr>
						<td>
							<fmt:message key="price"/>
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
