<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<fmt:setLocale value="${myLocale}" />
<fmt:setBundle basename="language" />

<!DOCTYPE html>
<html>
<head>
<title>Administrator page</title>
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
			<h3>Add card</h3>
			<form method="POST" action="controller">
				<input type="hidden" name="command" value="addBillInformation" />
				<div class="col-xs-6">
					<input width="100%" class="form-control" type="text" name="card"
						value="" required="true" placeholder="Your card № #### #### #### ####"
							pattern="[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}" />
				</div>
				<div class="col-xs-6">
					<div class="input-group">
						<input class="form-control" type="text" name="price" value=""
							required="true" placeholder="Price..." pattern="^\d+(\.|)\d{1,2}?"/>
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit">Add card!</button>
						</span>
					</div>
				</div>

			</form>
		</div>
		<div class="row">
			<br>
			<h3>Cards</h3>
			<div class="col-xs-12">
				<table class="table table-striped table-hover">
					<tr>
						<td>Card №</td>
						<td>Price</td>
						<td>Status</td>
						<td>Delete</td>
						<td>Choose</td>
					</tr>
					<c:forEach items="${bills}" var="item">
						<tr>
							<td>${item.cardNumber}</td>
							<td>${item.price}</td>
							<td>${item.selected}</td>
							<td width="5%">
								<form method="POST" action="controller">
									<input type="hidden" name="billIdToDelete" value="${item.id}" />
									<input type="hidden" name="command" value="deleteCard" />
									<input type="submit" name="changeStatus" value="Delete"
										class="btn btn-warning" />
								</form>
							</td>
							<td width="5%">
								<form method="POST" action="controller">
									<input type="hidden" name="billId" value="${item.id}" />
									<input type="hidden" name="command" value="chooseCard" />
									<input type="submit" name="changeStatus" value="Select"
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
						To admin page
					</button>
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
