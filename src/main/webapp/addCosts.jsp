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
						value="" required="true" placeholder="Description" pattern=".{2,}"/>
				</div>
				<div class="col-xs-3">
					<div class="input-group">
						<input class="form-control" type="text" name="price" value=""
							required="true" placeholder="Price..." pattern="^\d+(\.|)\d{1,2}?"/>
						<span class="input-group-btn">
							<button class="btn btn-success" type="submit">Add cost!</button>
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
						<th>Added by</th>
						<th></th>
						<th></th>
						<th>Date</th>
						<th>Description</th>
						<th>Price</th>
						<th>Delete</th>
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
						To admin page
					</button>
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
