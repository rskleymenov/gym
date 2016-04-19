<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<fmt:setLocale value="${myLocale}" />
<fmt:setBundle basename="language" />

<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="changePrice" /></title>
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
			<h3><fmt:message key="addCard" /></h3>
			<form method="POST" action="controller">
				<input type="hidden" name="command" value="addBillInformation" />
				<div class="col-xs-6">
					<input width="100%" class="form-control" type="text" name="card"
						value="" required="true" placeholder="<fmt:message key="cardNumber" /> #### #### #### ####"
							pattern="[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}" />
				</div>
				<div class="col-xs-6">
					<div class="input-group">
						<input class="form-control" type="text" name="price" value=""
							required="true" placeholder="<fmt:message key="price" />..." pattern="^\d+(\.|)\d{1,2}?"/>
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit"><fmt:message key="addCard" />!</button>
						</span>
					</div>
				</div>

			</form>
		</div>
		<div class="row">
			<br>
			<h3><fmt:message key="cards" /></h3>
			<div class="col-xs-12">
				<table class="table table-striped table-hover">
					<tr>
						<td><fmt:message key="cardNumber" /></td>
						<td><fmt:message key="price" /></td>
						<td><fmt:message key="status" /></td>
						<td><fmt:message key="delete" /></td>
						<td><fmt:message key="choose" /></td>
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
									<input type="submit" name="changeStatus" value="<fmt:message key="delete" />"
										class="btn btn-warning" />
								</form>
							</td>
							<td width="5%">
								<form method="POST" action="controller">
									<input type="hidden" name="billId" value="${item.id}" />
									<input type="hidden" name="command" value="chooseCard" />
									<input type="submit" name="changeStatus" value="<fmt:message key="choose" />"
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
						<fmt:message key="toAdminPage" />
					</button>
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
