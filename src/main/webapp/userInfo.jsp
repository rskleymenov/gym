<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<fmt:setLocale value="${myLocale}" />
<fmt:setBundle basename="language" />

<!DOCTYPE html>
<html>
<head>
<title>User page</title>
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
	<c:set var="myWidth" scope="session" value="70" />
	<div class="container">
		<jsp:include page="header.jsp" />
		<div class="row">
			<div class="col-xs-3" align="right">
				<h3><b>User information:</b></h3>
				<h4><c:out value="#" /></h4>
				<h4><c:out value="Surname" /></h4>
				<h4><c:out value="Name" /></h4>
				<h4><c:out value="Patronymic" /></h4>
				<h4><c:out value="Email" /></h4>
				<h4><c:out value="Dormitory №" /></h4>
				<h4><c:out value="Room №" /></h4>
				<h4><c:out value="Registered" /></h4>
				<h4><c:out value="Sex" /></h4>
				<h3><b>Payment information:</b></h3>
				<h4><c:out value="Price" /></h4>
			</div>

			<div class="col-xs-2">
				<h3><br></h3>
				<h4><c:out value="${user.id}" /></h4>
				<h4><c:out value="${user.surname}" /></h4>
				<h4><c:out value="${user.name}" /></h4>
				<h4><c:out value="${user.patronymic}" /></h4>
				<h4><c:out value="${user.email}" /></h4>
				<h4><c:out value="${user.dormitoryNumber}" /></h4>
				<h4><c:out value="${user.roomNumber}" /></h4>
				<h4><c:out value="${user.registrationDate}" /></h4>
				<h4><c:out value="${user.sex}" /></h4>
				<h3><b><br></b></h3>
				<h4><c:out value="${billInformation.price}" /></h4>
			</div>
			<div class="col-xs-7">
				<h3><b>Months to pay:</b></h3>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="userPayCommand" />
					<table>
						<tr>
							<td width="${myWidth}">
								<h5><c:out value="January" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><c:out value="February" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><c:out value="March" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><c:out value="April" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><c:out value="May" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><c:out value="June" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><c:out value="July" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><c:out value="August" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><c:out value="September" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><c:out value="October" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><c:out value="November" /></h5>
							</td>
							<td width="${myWidth}">
								<h5><c:out value="December" /></h5>
							</td>
						</tr>
						<tr>
							<td width="${myWidth}">
								<input type="checkbox" name="month" value="January">
							</td>
							<td width="${myWidth}">
								<input type="checkbox" name="month" value="February">
							</td>
							<td width="${myWidth}">
								<input type="checkbox" name="month" value="March">
							</td>
							<td width="${myWidth}">
								<input type="checkbox" name="month" value="April">
							</td>
							<td width="${myWidth}">
								<input type="checkbox" name="month" value="May">
							</td>
							<td width="${myWidth}">
								<input type="checkbox" name="month" value="June">
							</td>
							<td width="${myWidth}">
								<input type="checkbox" name="month" value="July">
							</td>
							<td width="${myWidth}">
								<input type="checkbox" name="month" value="August">
							</td>
							<td width="${myWidth}">
								<input type="checkbox" name="month" value="September">
							</td>
							<td width="${myWidth}">
								<input type="checkbox" name="month" value="October">
							</td>
							<td width="${myWidth}">
								<input type="checkbox" name="month" value="November">
							</td>
							<td width="${myWidth}">
								<input type="checkbox" name="month" value="December">
							</td>
						</tr>
					</table>
					<br>
					<div class="input-group">
						<input class="form-control" type="text" name="cardNumber" value=""
							required="true" placeholder="Your card № #### #### #### ####"
							pattern="[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}" />
						<span class="input-group-btn">
							<button class="btn btn-success" type="submit">Pay!</button>
						</span>
					</div>
				</form>
				<br> <br> <br> <br>
				<h4 style="color: red; text-align: center;"><c:choose>
						<c:when test="${errorFlag == true}">
							<b><c:out
									value="ERROR: You have to choose at least one month!" /></b>
						</c:when>
					</c:choose></h4>
				<h4 style="color: green; text-align: center;"><c:choose>
						<c:when test="${errorFlag == false}">
							<b><c:out
									value="Payment has been added!" /></b>
						</c:when>
					</c:choose></h4>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-12">
				<h3 align="center"><b>User's payments</b></h3>
				<table class="table table-striped table-hover">
					<tr>
						<th>Expense</th>
						<th>Date of payment</th>
						<th>Payment card</th>
						<th>Year</th>
						<th>Month</th>
						<th>Type</th>
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
				<br>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toChangePassword" />
					<button type="submit" class="btn btn-info btn-xs">
						<span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
						Change password
					</button>
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
