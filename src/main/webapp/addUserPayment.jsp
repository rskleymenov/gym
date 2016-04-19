<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Users' payments</title>
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
			<div class="col-xs-5">
				<h3 align="center"><b>Your information</b></h3>
				<table class="table table-striped">
					<tr>
						<td>
							<c:out value="#" />
						</td>
						<td>
							<c:out value="${selectedUser.id}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Surname" />
						</td>
						<td>
							<c:out value="${selectedUser.surname}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Name" />
						</td>
						<td>
							<c:out value="${selectedUser.name}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Patronymic" />
						</td>
						<td>
							<c:out value="${selectedUser.patronymic}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Email" />
						</td>
						<td>
							<c:out value="${selectedUser.email}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Dormitory №" />
						</td>
						<td>
							<c:out value="${selectedUser.dormitoryNumber}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Room №" />
						</td>
						<td>
							<c:out value="${selectedUser.roomNumber}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Registered" />
						</td>
						<td>
							<c:out value="${selectedUser.registrationDate}" />
						</td>
					</tr>
					<tr>
						<td>
							<c:out value="Sex" />
						</td>
						<td>
							<c:out value="${selectedUser.sex}" />
						</td>
					</tr>
				</table>
			</div>
			<div class="col-xs-7">
				<h3 align="center"><b>Months to pay</b></h3>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="confirmPayment" />
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
					<input style="width: 100%;" class="btn btn-success" type="submit"
						value="Pay">
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
							<b><c:out value="Payment has been added!" /></b>
						</c:when>
					</c:choose></h4>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<h3 align="center"><b>Users' payments</b></h3>
				<table
					style="text-align: center; vertical-align: middle !important;"
					class="table table-striped table-hover">
					<tr>
						<th>Expense</th>
						<th>Date of payment</th>
						<th>Payment card</th>
						<th>Year</th>
						<th>Month</th>
						<th>Type</th>
						<th>Delete</th>
					</tr>
					<c:forEach items="${paymentsOfUser}" var="item">
						<tr>
							<td>${item.expense}</td>
							<td>${item.createDate}</td>
							<td>${item.paymentCard}</td>
							<td>${item.paymentYear}</td>
							<td>${item.paymentMonth}</td>
							<td>${item.paymentType}</td>
							<td>
								<form method="POST" action="controller">
									<input type="hidden" name="selectedPayment" value="${item.id}" />
									<input type="hidden" name="command" value="deletePayment" />
									<input type="submit" name="changeStatus" value="Delete"
										class="btn btn-danger" />
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
					<input type="hidden" name="command" value="toAddPaymentById" />
					<button type="submit" class="btn btn-info btn-xs">
						<span class="glyphicon glyphicon-step-backward" aria-hidden="true"></span>
						To find user page
					</button>
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
