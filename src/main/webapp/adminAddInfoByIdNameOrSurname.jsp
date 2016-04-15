<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Add payment by id</title>
<link rel="stylesheet"
	href="https://bootswatch.com/simplex/bootstrap.css">
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp" />
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">
				<br>.
				<form method="POST" action="controller">
					<input type="hidden" name="command" value="findUserByIdOrElse" />
					<div class="input-group">
						<input type="text" name="userInformation" value="" required="true"
							class="form-control" placeholder="Search for user...">
						<span class="input-group-btn">
							<button class="btn btn-default" type="submit">Go!</button>
						</span>
					</div>
				</form>
			</div>
			<div class="col-lg-3"></div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
