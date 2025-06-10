<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoteTaker</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
	.navbar-custom {
		position: relative;
		z-index: 1;
	}

	/* Animated rainbow borders */
	.navbar-custom::before,
	.navbar-custom::after {
		content: "";
		position: absolute;
		left: 0;
		width: 100%;
		height: 3px;
		background: linear-gradient(90deg, red, orange, yellow, green, cyan, blue, violet, red);
		background-size: 200% 100%;
		animation: animateBorder 4s linear infinite;
		z-index: 2;
	}

	.navbar-custom::before {
		top: 0;
	}

	.navbar-custom::after {
		bottom: 0;
	}

	@keyframes animateBorder {
		from {
			background-position: 0% 50%;
		}
		to {
			background-position: 100% 50%;
		}
	}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-custom">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">NoteTaker</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="add_notes.jsp">Add Notes</a></li>
					<li class="nav-item"><a class="nav-link" href="all_notes.jsp">Show Notes</a></li>
					<li class="nav-item"><a class="nav-link disabled" aria-disabled="true">Disabled</a></li>
				</ul>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
