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
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<div class="row">
			<div class="col-xs-3" align="right">
				<h3><b>Your information:</b></h3>
				<h4><c:out value="Surname" /></h4>
				<h4><c:out value="Name" /></h4>
				<h4><c:out value="Patronymic" /></h4>
				<h4><c:out value="Email" /></h4>
				<h4><c:out value="Dormitory №" /></h4>
				<h4><c:out value="Room №" /></h4>
				<h4><c:out value="Registered" /></h4>
				<h4><c:out value="Sex" /></h4>
				<h3><b>Payment information:</b></h3>
				<h4><c:out value="Card №" /></h4>
				<h4><c:out value="Price" /></h4>
			</div>

			<div class="col-xs-3">
				<h3><br></h3>
				<h4><c:out value="${user.surname}" /></h4>
				<h4><c:out value="${user.name}" /></h4>
				<h4><c:out value="${user.patronymic}" /></h4>
				<h4><c:out value="${user.email}" /></h4>
				<h4><c:out value="${user.dormitoryNumber}" /></h4>
				<h4><c:out value="${user.roomNumber}" /></h4>
				<h4><c:out value="${user.registrationDate}" /></h4>
				<h4><c:out value="${user.sex}" /></h4>
				<h3><b><br></b></h3>
				<h4><c:out value="${billInformation.cardNumber}" /></h4>
				<h4><c:out value="${billInformation.price}" /></h4>

			</div>

			<div class="col-xs-6">
				<h3><b>Administrator menu:</b></h3>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toAddPaymentById" />
					<input class="btn btn-default btn-lg btn-block" type="submit"
						value="Add payment by id">
				</form>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toAddUser" />
					<input class="btn btn-default btn-lg btn-block" type="submit"
						value="Add user">
				</form>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toUpdateUser" />
					<input class="btn btn-default btn-lg btn-block" type="submit"
						value="Update user">
				</form>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toAnalytic" />
					<input class="btn btn-default btn-lg btn-block" type="submit"
						value="Analytic">
				</form>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toAddCosts" />
					<input class="btn btn-default btn-lg btn-block" type="submit"
						value="Add costs">
				</form>
				<br>
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="toPaymentInfo" />
					<input class="btn btn-default btn-lg btn-block" type="submit"
						value="Change payment info">
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
