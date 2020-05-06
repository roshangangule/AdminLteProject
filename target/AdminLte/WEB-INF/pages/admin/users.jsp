<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="formjstl"%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.javabykiran.model.Users"%>
<%@include file="prevent.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Java By Kiran | User</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet"
	href='<spring:url value="/resources/bootstrap/css/bootstrap.min.css" />'>
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href='<spring:url value="/resources/dist/css/AdminLTE.min.css" />'>
<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="<spring:url value="/resources/dist/css/skins/_all-skins.min.css" />">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="dashboard.html" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>A</b>LT</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>Java By Kiran</b></span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<div class="navbar-custom-menu">

					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->



						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="logout" class="">LOGOUT</a></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img
							src="<spring:url value="resources/dist/img/user2-160x160.jpg"/>"
							class="img-circle" alt="User Image" height="150px">
					</div>
					<div class="pull-left info">
						<p>
							<%
								session.getAttribute("id");
								out.println(session.getAttribute("id"));
							%>
						</p>
						<a href="#"><i class="fa fa-circle text-success"></i> Online</a>
					</div>
				</div>
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="header">MAIN NAVIGATION</li>
					<li class="active treeview"><a
						href="<spring:url value="/dashboard" />"><i
							class="fa fa-dashboard"></i> <span>Dashboard</span></a></li>
					<li><a href="<spring:url value="/userspage"/>"> <i
							class="fa fa-user"></i> <span>Users</span></a></li>
					<li><a href="<spring:url value="/operators" />"><i
							class="fa fa-retweet"></i> <span>Operators</span></a></li>
					<li class="treeview"><a href="<spring:url value="links" />"><i
							class="fa fa-external-link"></i> <span>Useful Links</span></a></li>
					<li class="treeview"><a
						href="<spring:url value="downloads" />"><i
							class="fa fa-download"></i> <span>Downloads</span></a></li>
					<li><a href="<spring:url value="logout" />"><i
							class="fa fa-power-off"></i> <span>Logout</span></a></li>

				</ul>
			</section>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Users</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Users</li>
				</ol>
			</section>
			<%
				ArrayList<Users> nameList = (ArrayList<Users>) request.getAttribute("userList");
			%>
			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="box">
							<div class="box-header">
								<h3 class="box-title">User List</h3>
								<a href="<spring:url value="/add_user_page" />">
									<button class="btn btn-block btn-primary btn-sm pull-right"
										style="width: 100px;">Add User</button>
								</a>
								<div class="box-tools"></div>
							</div>
							<!-- /.box-header -->
							<form class="horizontal-form" method="post"
								action="multipleDelete">

								<div class="box-body table-responsive no-padding">

									<table class="table table-hover">
										<thead>
											<tr>
												<th class="text-center">Select</th>
												<th class="text-center">Id</th>
												<th class="text-center">isDefault</th>

												<th class="text-center">Username</th>
												<th class="text-center">Password</th>
												<th class="text-center">Gender</th>

												<th class="text-center">State</th>
												<th class="text-center">Mobile</th>
												<th class=text-center>Email</th>
												<th class="text-center">Edit</th>
												<th class="text-center">Delete</th>

											</tr>

										</thead>
										<%
											int i = 0;
											for (Users name : nameList) {
												i++;
										%>
										<tbody>
											<tr>
												<td class="text-center"><input type="checkbox"
													name="id[]" value="<%out.println(name.getId());%>"></td>
												<td class="text-center"><input class="isDefault"
													type="hidden" name="isDefault"
													value="<%=name.getIsDefault()%>" />
													<%
														out.println(i);
													%></td>
												<td class="text-center">
													<%
														out.println(name.getIsDefault());
													%>
												
												<td class="text-center">
													<%
														out.println(name.getUsername());
													%>
												</td>
												<td class="text-center">
													<%
														out.println(name.getPassword());
													%>
												</td>
												<td class="text-center">
													<%
														out.println(name.getGender());
													%>
												</td>
												<td class="text-center">
													<%
														out.println(name.getStateMaster().getName());
													%>
												</td>
												<td class="text-center">
													<%
														out.println(name.getMobile());
													%>
												</td>
												<td class="text-center">
													<%
														out.println(name.getEmail());
													%>
												</td>
												<td class="text-center"><a
													href="<%=request.getContextPath()%>/update?id=<%out.println(name.getId());%>"><span
														class="label label-info" data-toggle="tooltip"
														data-placement="top" title="Click to Edit">Edit</span></a></td>
												<td class="text-center"><a class="delete"
													href="<%=request.getContextPath()%>/delete/<%out.println(name.getId());%>"
													onclick="return singleDelete();"><span
														class="label label-danger" data-toggle="tooltip"
														data-placement="top" title="Click to Edit">Delete</span></a></td>

											</tr>

										</tbody>
										<%
											}
										%>
									</table>
									<button type="submit" class="btn btn-danger">Delete
										Multiple</button>
								</div>
								<!-- /.box-body -->
							</form>
						</div>
						<!-- /.box -->

					</div>
				</div>

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Design for Selenium Automation Test</b> V 2.3.0
			</div>
			<strong>Copyright &copy; <script>
				var CurrentYear = new Date().getFullYear()
				var pastYear = new Date().getFullYear() - 1
				document.write(pastYear + "-" + CurrentYear)
			</script> <a href="https://www.javabykiran.com/" target="_blank">JavaByKiran</a>.
			</strong> All rights reserved.
		</footer>
		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<div class="example-modal">
		<div class="modal">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Modal Default</h4>
					</div>
					<div class="modal-body">
						<p>One fine body&hellip;</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default pull-left"
							data-dismiss="modal">Close</button>
						<button type="button" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
	</div>
	<!-- /.example-modal -->


	<!-- jQuery 2.1.4 -->
	<script
		src="<spring:url value="/resources/plugins/jQuery/jQuery-2.1.4.min.js"/>"></script>

	<!-- jQuery UI 1.11.4 -->

	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<!-- Bootstrap 3.3.5 -->
	<script src="<spring:url value="/resources/js/bootstrap.min.js"/>"></script>
	<!-- Morris.js charts -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script
		src="<spring:url value="/resources/plugins/pluginsmorris/morris.min.js"/>"></script>
	<!-- Sparkline -->
	<script
		src="<spring:url value="/resources/plugins/sparkline/jquery.sparkline.min.js"/>"></script>
	<!-- jvectormap -->
	<script
		src="<spring:url value="/resources/pluginsjvectormap/jquery-jvectormap-1.2.2.min.js"/>"></script>
	<script
		src="<spring:url value="/resourcespluginsjvectormap/jquery-jvectormap-world-mill-en.js"/>"></script>
	<!-- jQuery Knob Chart -->
	<script
		src="<spring:url value="/resources/plugins/knob/jquery.knob.js"/>"></script>
	<!-- daterangepicker -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.2/moment.min.js"></script>
	<script
		src="<spring:url value="/resources/plugins/daterangepicker/daterangepicker.js"/>"></script>
	<!-- datepicker -->
	<script
		src="<spring:url value="/resources/plugins/datepicker/bootstrap-datepicker.js"/>"></script>
	<!-- Bootstrap WYSIHTML5 -->
	<script
		src="<spring:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"/>"></script>
	<!-- Slimscroll -->
	<script
		src="<spring:url value="/resources/plugins/slimScroll/jquery.slimscroll.min.js"/>"></script>
	<!-- FastClick -->
	<script
		src="<spring:url value="/resources/plugins/fastclick/fastclick.min.js"/>"></script>
	<!-- AdminLTE App -->
	<script src="<spring:url value="/resources/dist/js/app.min.js"/>"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script
		src="<spring:url value="/resources/dist/js/pages/dashboard.js"/>"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<spring:url value="/resources/dist/js/demo.js"/>"></script>


	<script>
		setTimeout(function() {
			$('#msg').fadeOut('slow');
		}, 1000); // <-- time in milliseconds

		function delete_user() {

			var atLeastOneIsChecked = $('input[name="id[]"]:checked').length > 0;

			if (atLeastOneIsChecked == true) {

				if (!confirm("Are you sure you want to delete selected users..?"))
					return false;
				else
					//$("#"+id).hide();
					//alert("User deleted successfully.");
					return true;
			} else {
				alert('Select user to delete.')
				return false;
			}
		};

		$('.delete').on('click', function() {
			//function singleDelete(){
			var isDefault = $(this).closest("tr").find(".isDefault").val();
			if (isDefault.localeCompare("N") == 0) {
				if (!confirm("Are you sure you want to delete user..?"))
					return false;

				return true;
			} else {
				alert("You can't delete default user.");
				return false;
			}

		});
	</script>

</body>
</html>
