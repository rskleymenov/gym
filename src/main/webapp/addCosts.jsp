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
			<h3>Add cost</h3>
			<form method="POST" action="controller">
				<input type="hidden" name="command" value="addCost" />
				<div class="col-xs-9">
					<input width="100%" class="form-control" type="text" name="name"
						value="" required="true" placeholder="Description" />
				</div>
				<div class="col-xs-3">
					<div class="input-group">
						<input class="form-control" type="text" name="price" value=""
							required="true" placeholder="Price..." />
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit">Add cost!</button>
						</span>
					</div>
				</div>

			</form>
		</div>
		<div class="row">
			<br>
			<h3>Costs</h3>
			<div class="col-xs-12">
				<table class="table table-striped table-hover">
					<tr>
						<td>Added by</td>
						<td></td>
						<td></td>
						<td>Date</td>
						<td>Description</td>
						<td>Price</td>
						<td>Delete</td>
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
									<input type="submit" name="changeStatus" value="Delete"
										class="btn btn-success" />
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
