<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
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
<style>
        .header {
            background-color: #f0f0f0;
            padding: 20px;
            text-align: center;
        }

        .row {
            display: flex;
            justify-content: center;
        }

        .col {
            padding: 10px;
        }
    </style>
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
	<jsp:include page="voter-header.jsp"></jsp:include>
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="row pad-botm">
				<div class="col-md-10">
					<h4 class="header-line">Current Result</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10">
					<!--   Basic Table  -->
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table">
									<tr>
										<th>Party Name</th>
										<th>Party Total Voting</th>
									</tr>
									<tbody>
										<%
											int voteEDSON=0;
											ResultSet countEDSON=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblvoting where party_name='EDSON FOR MONITOR'");
											countEDSON.next();
											voteEDSON=countEDSON.getInt(1);
										%>
										<tr>
											<td><b>EDSON FOR MONITOR</b></td><td><%=voteEDSON%></td>
										</tr>
										<%
											int voteELSON=0;
											ResultSet countELSON=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblvoting where party_name='ELSON FOR MONITOR'");
											countELSON.next();
											voteELSON=countELSON.getInt(1);
										%>
										<tr>
											<td><b>ELSON FOR MONITOR</b></td><td><%=voteELSON%></td>
										</tr>
										<%
											int voteSTEWART=0;
											ResultSet countSTEWART=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblvoting where party_name='STEWART FOR MONITOR'");
											countSTEWART.next();
											voteSTEWART=countSTEWART.getInt(1);
										%>
										<tr>
											<td><b>STEWART FOR MONITOR</b></td><td><%=voteSTEWART%></td>
										</tr>
										<%
											int voteSHALOM=0;
											ResultSet countSHALOM=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblvoting where party_name='SHALOM FOR MONITOR'");
											countSHALOM.next();
											voteSHALOM=countSHALOM.getInt(1);
										%>
										<tr>
											<td><b>SHALOM FOR MONITOR</b></td><td><%=voteSHALOM%></td>
										</tr>
										<%
										    int voteTAKU=0;
									    	ResultSet countTAKU=DatabaseConnection.getResultFromSqlQuery("select count(*) from tblvoting where party_name='TAKU FOR MONITOR'");
											countTAKU.next();
											voteTAKU=countTAKU.getInt(1);
										%>
										<tr>
											<td><b>TAKU FOR MONITOR</b></td><td><%=voteTAKU%></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!-- End  Basic Table  -->
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
</html>