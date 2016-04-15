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
<style>
th, td {
	text-align: center;
	vertical-align: middle !important;
}
</style>
</head>
<body>
	<c:set var="myWidth" scope="session" value="70"/> 
	<div class="container">
		<jsp:include page="header.jsp" />
		<div class="row">
			<div class="col-xs-2" align="right">
				<h3><b>User information:</b></h3>
				<h4><c:out value="#" /></h4>
				<h4><c:out value="Surname" /></h4>
				<h4><c:out value="Name" /></h4>
				<h4><c:out value="Patronymic" /></h4>
				<h4><c:out value="Email" /></h4>
				<h4><c:out value="Dormitory №" /></h4>
				<h4><c:out value="Room №" /></h4>
				<h4><c:out value="Registered" /></h4>
				<h4><c:out value="Sex" /></h4>
			</div>

			<div class="col-xs-2">
				<h3><br></h3>
				<h4><c:out value="${selectedUser.id}" /></h4>
				<h4><c:out value="${selectedUser.surname}" /></h4>
				<h4><c:out value="${selectedUser.name}" /></h4>
				<h4><c:out value="${selectedUser.patronymic}" /></h4>
				<h4><c:out value="${selectedUser.email}" /></h4>
				<h4><c:out value="${selectedUser.dormitoryNumber}" /></h4>
				<h4><c:out value="${selectedUser.roomNumber}" /></h4>
				<h4><c:out value="${selectedUser.registrationDate}" /></h4>
				<h4><c:out value="${selectedUser.sex}" /></h4>
			</div>
			<div class="col-xs-8">
				<h3><b>Months to pay:</b></h3>
				<form method="POST" action="controller">
				<input type="hidden" name="command" value="confirmPayment" />
					<table>
						<tr>
							<td width="${myWidth}"><h5><c:out value="January" /></h5></td>
							<td width="${myWidth}"><h5><c:out value="February" /></h5></td>
							<td width="${myWidth}"><h5><c:out value="March" /></h5></td>
							<td width="${myWidth}"><h5><c:out value="April" /></h5></td>
							<td width="${myWidth}"><h5><c:out value="May" /></h5></td>
							<td width="${myWidth}"><h5><c:out value="June" /></h5></td>
							<td width="${myWidth}"><h5><c:out value="July" /></h5></td>
							<td width="${myWidth}"><h5><c:out value="August" /></h5></td>
							<td width="${myWidth}"><h5><c:out value="September" /></h5></td>
							<td width="${myWidth}"><h5><c:out value="October" /></h5></td>
							<td width="${myWidth}"><h5><c:out value="November" /></h5></td>
							<td width="${myWidth}"><h5><c:out value="December" /></h5></td>
						</tr>
						<tr>
							<td width="${myWidth}"><input type="checkbox" name="month" value="1"></td>
							<td width="${myWidth}"><input type="checkbox" name="month" value="2"></td>
							<td width="${myWidth}"><input type="checkbox" name="month" value="3"></td>
							<td width="${myWidth}"><input type="checkbox" name="month" value="4"></td>
							<td width="${myWidth}"><input type="checkbox" name="month" value="5"></td>
							<td width="${myWidth}"><input type="checkbox" name="month" value="6"></td>
							<td width="${myWidth}"><input type="checkbox" name="month" value="7"></td>
							<td width="${myWidth}"><input type="checkbox" name="month" value="8"></td>
							<td width="${myWidth}"><input type="checkbox" name="month" value="9"></td>
							<td width="${myWidth}"><input type="checkbox" name="month" value="10"></td>
							<td width="${myWidth}"><input type="checkbox" name="month" value="11"></td>
							<td width="${myWidth}"><input type="checkbox" name="month" value="12"></td>
						</tr>
					</table>
					<input type="submit" value="Pay">
				</form>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
