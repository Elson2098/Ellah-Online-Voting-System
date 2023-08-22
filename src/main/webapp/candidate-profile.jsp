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
<title>Online Voter System</title>
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
		if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
	%>
	<jsp:include page="candidate-header.jsp"></jsp:include>
	<div class="container">
		<div class="row pad-botm">
			<div class="col-md-12">
				<h4 class="header-line">My Profile</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 col-sm-6 col-xs-12">
				<img src="images/my-profile.jpg"
					style="width: 500px; height: 400px;">
			</div>
			<div class="col-md-6 col-sm-6 col-xs-12">
				<div class="panel panel-info">
					<div class="panel-heading">My Profile</div>
					<div class="panel-body">
						<form role="form" action="" method="">
							<%
								ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblcandidate where uname='"+ session.getAttribute("uname") + "' and candidate_id='" + session.getAttribute("cid") + "'");
								while (resultset.next()) {
							%>
							<div class="form-group">
								<label>Candidate Id</label> <input class="form-control"
									type="text" name="pid"
									value="<%=resultset.getString("candidate_id")%>" readonly />
							</div>
							<div class="form-group">
								<label>Full Name</label> <input class="form-control" type="text"
									name="fname" value="<%=resultset.getString("candidate_name")%>" readonly/>
							</div>
							<div class="form-group">
								<label>Email Id</label> <input class="form-control" name="email"
									type="text" value="<%=resultset.getString("candidate_email")%>" readonly/>
							</div>
							<div class="form-group">
								<label>Mobile No</label> <input class="form-control"
									name="mobile" type="text"
									value="<%=resultset.getString("candidate_mobile")%>" readonly/>
							</div>
							<div class="form-group">
								<label>Study Year</label> <input class="form-control"
									name="studyYear" type="text"
									value="<%=resultset.getString("candidate_study_year")%>" readonly/>
							</div>
							<div class="form-group">
								<label>Party Name</label> <input class="form-control" type="text"
									name="gender" value="<%=resultset.getString("candidate_party_name")%>" readonly/>
							</div>
							<div class="form-group">
								<label>Party Logo Name</label> <input class="form-control" type="text"
									name="fname" value="<%=resultset.getString("candidate_party_logo_name")%>" readonly/>
							</div>
							<div class="form-group">
								<label>Party Logo</label> <input class="form-control"
									name="PartyLogo" type="text"
									value="<%=resultset.getString("candidate_party_logo")%>" readonly/>
							</div>
							<div class="form-group">
								<label>Status</label> <input class="form-control"
									name="status" type="text"
									value="<%=resultset.getString("Status")%>" readonly/>
							</div>
							<div class="form-group">
								<label>Created At</label> <input class="form-control"
									type="text" value="<%=resultset.getString("created_at")%>"
									readonly />
							</div>
							<div class="form-group">
								<label>Updated At</label> <input class="form-control"
									type="text" value="<%=resultset.getString("updated_at")%>"
									readonly />
							</div>
							<%
								}
							%>
						</form>
					</div>
				</div>
			</div>

		</div>
	</div>
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
</script>
</html>