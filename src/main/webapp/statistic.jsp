<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<fmt:setLocale value="${myLocale}" />
<fmt:setBundle basename="language" />

<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="analytic" /></title>
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
			<h3><fmt:message key="year" /></h3>
			<form method="POST" action="controller">
				<input type="hidden" name="command" value="getStatistic" />
				<div class="col-xs-12">
					<div class="input-group">
						<input class="form-control" type="number" min="2015" name="year"
							value="" required="true"
							placeholder="<fmt:message key="year" />..." />
						<span class="input-group-btn">
							<button class="btn btn-success" type="submit">
								<fmt:message key="calculateStatistic" />
							</button>
						</span>
					</div>
				</div>

			</form>
		</div>
		<div class="row">
			<br>
			<h3 align="middle"><fmt:message key="paymentsByMonths" /></h3>
			<div class="col-xs-12">
				<table class="table table-striped table-hover">
					<tr>
						<th width="50%"><fmt:message key="expense" /></th>
						<th width="50%"><fmt:message key="month" /></th>
					</tr>
					<c:forEach items="${byMonthList}" var="item">
						<tr>
							<td>${item.expense}</td>
							<td>${item.paymentMonth}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row">
			<br>
			<h3 align="center"><fmt:message key="paymentsByMoneyType" /></h3>
			<div class="col-xs-12">
				<table class="table table-striped table-hover">
					<tr>
						<th width="50%"><fmt:message key="expense" /></th>
						<th width="50%"><fmt:message key="moneyType" /></th>
					</tr>
					<c:forEach items="${byTypeList}" var="item">
						<tr>
							<td>${item.expense}</td>
							<td>${item.paymentType}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div class="row">
			<br>
			<h3 align="center"><fmt:message key="paymentsByYear" /></h3>
			<div class="col-xs-12">
				<table class="table table-striped table-hover">
					<tr>
						<th width="50%"><fmt:message key="expense" /></th>
						<th width="50%"><fmt:message key="year" /></th>
					</tr>
					<c:forEach items="${byYearList}" var="item">
						<tr>
							<td>${item.expense}</td>
							<td>${item.paymentYear}</td>
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
