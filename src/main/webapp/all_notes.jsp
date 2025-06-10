<!doctype html>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.todo.entities.NoteTaker"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.todo.factoryCreater.FactoryProvider"%>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/style.css">
<title>All notes : NoteTaker.</title>


</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes :</h1>

		<%
		Session s = FactoryProvider.getFactory().openSession();
		Query q = s.createQuery("from NoteTaker");
		List<NoteTaker> list = q.list();
		for (NoteTaker note : list) {
		%>
		<div class="card mt-3">
			<img src="img/note.png" class="card-img-top pt-4 pl-4 mx-auto"
				style="max-width: 100px;" alt="...">
			<div class="card-body px-5">
				<h5 class="card-title"><%=note.getTitle()%></h5>
				<p class="card-text"><%=note.getContent()%></p>
				<p class="card-text"><b><%=note.getAddedDate()%></b></p>
				<div class="container text-center mt-2">
					<a href="DeleteServlet?note_id=<%=note.getId()%>"
						class="btn btn-danger">Delete</a> <a
						href="edit.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">Update</a>
				</div>
			</div>
		</div>
		<%
		}
		s.close();
		%>

	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>