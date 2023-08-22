<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.connection.*"%>
<!DOCTYPE html>
<html lang="en">

<!-- Basic -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Site Metas -->
<title>Online Voting System</title>
<meta name="keywords" content="">
<meta name="description" content="">
<meta name="author" content="">

<!-- Site Icons -->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
<link rel="apple-touch-icon" href="images/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Site CSS -->
<link rel="stylesheet" href="style.css">
<!-- Colors CSS -->
<link rel="stylesheet" href="css/colors.css">
<!-- ALL VERSION CSS -->
<link rel="stylesheet" href="css/versions.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="css/custom.css">

<!-- Modernizer for Portfolio -->
<script src="js/modernizer.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body class="host_version">
	<%
		if (session.getAttribute("candidate_name") != null && session.getAttribute("uname") != "candidate_name") {
	%>
	<jsp:include page="voter-header.jsp"></jsp:include>
	<div class="container">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">Change Party Name</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<img src="images/change_password.jpg"
					style="width: 500px; height: 300px;">
			</div>


			<div class="col-md-6 col-sm-6 col-xs-12">
				<%
					String message = (String) session.getAttribute("party-change-success");
					if (message != null) {
						session.removeAttribute("party-change-success");
				%>
				<div class='alert alert-success' id='success'>Party Name Changed Successfully.</div>
				<%
					}
				%>
				<%
					String fail = (String) session.getAttribute("party-change-fail");
					if (fail != null) {
						session.removeAttribute("party-change-fail");
				%>
				<div class="alert alert-danger" id='danger'>Old party doesn't match..</div>
				<%
					}
				%>
				<%
					String partyConfirm = (String) session.getAttribute("party-not-match");
					if (partyConfirm != null) {
						session.removeAttribute("party-not-match");
				%>
				<div class="alert alert-danger" id='danger'>New party and confirmed party doesn't match.</div>
				<%
					}
				%>
				<div class="panel panel-info">
					<div class="panel-heading">Change Party</div>
					<div class="panel-body">
						<form role="form" action="VoterChangePassword" method="post">
							<%
								ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcandidate where candidate_name='"+ session.getAttribute("candidate_name") + "' and candidate_id='" + session.getAttribute("candidate_id") + "'");   
								while (resultset.next()) {
							%>
							<div class="form-group">
								<label>Current Party Name</label> <input class="form-control"
									type="party" name="cparty"
									value="<%=resultset.getString("candidate_party_name")%>" readonly />
							</div>
							<div class="form-group">
								<label>New Party</label> <input class="form-control"
									type="party" name="candidate_party_name" value="" />
							</div>
							<div class="form-group">
								<label>Confirm Party</label> <input class="form-control"
									type="party" name="confcandidate_party_name" value="" />
							</div>
							<button type="submit" class="btn btn-info">Change Party</button>
							<%
								}
							%>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		} else {
	response.sendRedirect("index.jsp");
	}
	%>
</body>
<script type="text/javascript">
	$(function() {
		$('#success').delay(3000).show().fadeOut('slow');
	});

	$(function() {
		$('#danger').delay(3000).show().fadeOut('slow');
	});
</script>
</html>