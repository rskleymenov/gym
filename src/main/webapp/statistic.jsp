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
			<h3>Year</h3>
			<form method="POST" action="controller">
				<input type="hidden" name="command" value="getStatistic" />
				<div class="col-xs-12">
					<div class="input-group">
						<input class="form-control" type="text" name="year" value=""
							required="true" placeholder="Year..." />
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit">Calculate statistic!</button>
						</span>
					</div>
				</div>

			</form>
		</div>
		<div class="row">
			<br>
			<h3>Payments by months</h3>
			<div class="col-xs-12">
				<table class="table table-striped table-hover">
					<tr>
						<td width="50%">Expense</td>
						<td width="50%">Month</td>
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
			<h3>Payments by money type</h3>
			<div class="col-xs-12">
				<table class="table table-striped table-hover">
					<tr>
						<td width="50%">Expense</td>
						<td width="50%">Money type</td>
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
			<h3>Payments by year</h3>
			<div class="col-xs-12">
				<table class="table table-striped table-hover">
					<tr>
						<td width="50%">Expense</td>
						<td width="50%">Year</td>
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
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
