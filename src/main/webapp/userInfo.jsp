<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<fmt:setLocale value="${myLocale}" />
<fmt:setBundle basename="language" />

<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="userPage" /></title>
<link rel="stylesheet"
	href="https://bootswatch.com/simplex/bootstrap.css">
<style>
th {
	text-align: center;
	vertical-align: middle !important;
}
</style>
</head>
<body>
	<c:set var="myWidth" scope="session" value="70" />
	<div class="container">
		<jsp:include page="header.jsp" />
		<div class="row">
			<div class="col-xs-4" align="right">
				<h3 align="center"><b><fmt:message key="yourInfo" /></b></h3>
				<table class="table table-striped">
					<tr>
						<td><c:out value="#" /></td>
						<td><c:out value="${user.id}" /></td>
					</tr>
					<tr>
						<td><fmt:message key="surname" /></td>
						<td><c:out value="${user.surname}" /></td>
					</tr>
					<tr>
						<td><fmt:message key="name" /></td>
						<td><c:out value="${user.name}" /></td>
					</tr>
					<tr>
						<td><fmt:message key="patronymic" /></td>
						<td><c:out value="${user.patronymic}" /></td>
					</tr>
					<tr>
						<td><fmt:message key="email" /></td>
						<td><c:out value="${user.email}" /></td>
					</tr>
					<tr>
						<td><fmt:message key="dormitory" /></td>
						<td><c:out value="${user.dormitoryNumber}" /></td>
					</tr>
					<tr>
						<td><fmt:message key="room" /></td>
						<td><c:out value="${user.roomNumber}" /></td>
					</tr>
					<tr>
						<td><fmt:message key="registered" /></td>
						<td><c:out value="${user.registrationDate}" /></td>
					</tr>
					<tr>
						<td><fmt:message key="sex" /></td>
						<td><c:out value="${user.sex}" /></td>
					</tr>
				</table>
			</div>
			<div class="col-xs-8">
				<h3><b><fmt:message key="monthsToPay" />:</b></h3>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="userPayCommand" />
					<table>
						<tr>
							<td width="${myWidth}">
								<h5><fmt:message key="january" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><fmt:message key="february" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><fmt:message key="march" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><fmt:message key="april" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><fmt:message key="may" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><fmt:message key="june" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><fmt:message key="july" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><fmt:message key="august" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><fmt:message key="september" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><fmt:message key="october" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><fmt:message key="november" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><fmt:message key="december" /></h5>
							</td>
						</tr>
						<tr>
							<td width="${myWidth}"><input type="checkbox" name="month"
									value="January"></td>
							<td width="${myWidth}"><input type="checkbox" name="month"
									value="February"></td>
							<td width="${myWidth}"><input type="checkbox" name="month"
									value="March"></td>
							<td width="${myWidth}"><input type="checkbox" name="month"
									value="April"></td>
							<td width="${myWidth}"><input type="checkbox" name="month"
									value="May"></td>
							<td width="${myWidth}"><input type="checkbox" name="month"
									value="June"></td>
							<td width="${myWidth}"><input type="checkbox" name="month"
									value="July"></td>
							<td width="${myWidth}"><input type="checkbox" name="month"
									value="August"></td>
							<td width="${myWidth}"><input type="checkbox" name="month"
									value="September"></td>
							<td width="${myWidth}"><input type="checkbox" name="month"
									value="October"></td>
							<td width="${myWidth}"><input type="checkbox" name="month"
									value="November"></td>
							<td width="${myWidth}"><input type="checkbox" name="month"
									value="December"></td>
						</tr>
					</table>
					<br>
					<div class="input-group">
						<input class="form-control" type="text" name="cardNumber" value=""
							required="true" placeholder="<fmt:message key="cardNumber"/> #### #### #### ####"
							pattern="[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}" />
						<span class="input-group-btn">
							<button class="btn btn-success" type="submit"><fmt:message key="pay"/>!</button>
						</span>
					</div>
				</form>
				<br> <br> <br> <br>
				<h4 style="color: red; text-align: center;"><c:choose>
						<c:when test="${errorFlag == true}">
							<b><fmt:message key="atLeastOneMonth"/></b>
						</c:when>
					</c:choose></h4>
				<h4 style="color: green; text-align: center;"><c:choose>
						<c:when test="${errorFlag == false}">
							<b><fmt:message key="paymentAdded"/></b>
						</c:when>
					</c:choose></h4>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-12">
				<h3 align="center"><b><fmt:message key="userPayments" /></b></h3>
				<table
					style="text-align: center; vertical-align: middle !important;"
					class="table table-striped table-hover">
					<tr>
						<th><fmt:message key="expense" /></th>
						<th><fmt:message key="dateOfPayment" /></th>
						<th><fmt:message key="paymentCard" /></th>
						<th><fmt:message key="year" /></th>
						<th><fmt:message key="month" /></th>
						<th><fmt:message key="type" /></th>
					</tr>
					<c:forEach items="${paymentsOfUser}" var="item">
						<tr>
							<td>${item.expense}</td>
							<td>${item.createDate}</td>
							<td>${item.paymentCard}</td>
							<td>${item.paymentYear}</td>
							<td>${item.paymentMonth}</td>
							<td>${item.paymentType}</td>

						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 text-center">
				<br> <br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toChangePassword" />
					<button type="submit" class="btn btn-info btn-xs">
						<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
						<fmt:message key="changePassword" />
					</button>
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
