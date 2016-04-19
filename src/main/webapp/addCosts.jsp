<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<fmt:setLocale value="${myLocale}" />
<fmt:setBundle basename="language" />

<!DOCTYPE html>
<html>
<head>
<title><fmt:message key="costs" /></title>
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
			<h3><fmt:message key="addCost" /></h3>
			<form method="POST" action="controller">
				<input type="hidden" name="command" value="addCost" />
				<div class="col-xs-9">
					<input width="100%" class="form-control" type="text" name="name"
						value="" required="true" placeholder="<fmt:message key="description" />..." pattern=".{2,}" />
				</div>
				<div class="col-xs-3">
					<div class="input-group">
						<input class="form-control" type="text" name="price" value=""
							required="true" placeholder="<fmt:message key="price" />..."
							pattern="^\d+(\.|)\d{1,2}?" />
						<span class="input-group-btn">
							<button class="btn btn-success" type="submit"><fmt:message key="addCost" />!</button>
						</span>
					</div>
				</div>

			</form>
		</div>
		<div class="row">
			<br>
			<h3><fmt:message key="costs" /></h3>
			<div class="col-xs-12">
				<table class="table table-striped table-hover">
					<tr>
						<th><fmt:message key="addedBy" /></th>
						<th></th>
						<th></th>
						<th><fmt:message key="date" /></th>
						<th><fmt:message key="description" /></th>
						<th><fmt:message key="price" /></th>
						<th><fmt:message key="delete" /></th>
					</tr>
					<c:forEach items="${costs}" var="item">
						<tr>
							<td>${item.user.surname}</td>
							<td>${item.user.name}</td>
							<td>${item.user.patronymic}</td>
							<td>${item.costDate}</td>
							<td>${item.name}</td>
							<td>${item.price}</td>
							<td>
								<form method="POST" action="controller">
									<input type="hidden" name="costId" value="${item.id}" />
									<input type="hidden" name="command" value="chooseCostToDelete" />
									<input type="submit" name="changeStatus" value="<fmt:message key="delete" />"
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
