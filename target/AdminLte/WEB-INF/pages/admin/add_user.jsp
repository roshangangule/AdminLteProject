<%@page
	import="org.hibernate.hql.internal.ast.util.ASTUtil.IncludePredicate"%>
<%@page
	import="org.apache.taglibs.standard.tag.common.core.ForEachSupport"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.javabykiran.model.Users"%>
<%@page import="com.javabykiran.model.StateMaster"%>
<%@include file="prevent.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>JavaByKiran | Add User</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet"
	href="<spring:url value="/resources/bootstrap/css/bootstrap.min.css"/>">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="<spring:url value="/resources/dist/css/AdminLTE.min.css"/>">
<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="<spring:url value="/resources/dist/css/skins/_all-skins.min.css"/>">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">

	<script type="text/javascript">
		function preventBack() {
			window.history.forward();
		}
		setTimeout("preventBack()", 0);
		window.onunload = function() {
			null
		};
	</script>
	<div class="wrapper">

		<header class="main-header">
			<!-- Logo -->
			<a href="dashboard.html" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>JBK</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>Java By Kiran</b></span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->

				<div class="navbar-custom-menu">

					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->



						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="logout.html"
							class="">LOGOUT</a></li>
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
							src="<spring:url value="/resources/dist/img/user2-160x160.jpg"/>"
							class="img-circle" alt="User Image" />
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
				<h1>Add User</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">Add User</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<!-- Horizontal Form -->
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">Fill Below Details</h3>
							</div>
							<!-- /.box-header -->
							<!-- form start -->
							<form:form class="form-horizontal" method="post"
								modelAttribute="Users" action="addUser">
								<form:hidden path="id" />
								<div class="box-body">
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">Username</label>
										<div class="col-sm-4">
											<form:input path="username" placeholder="Username"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label">Mobile</label>
										<div class="col-sm-4">
											<form:input path="mobile" placeholder="Mobile"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label">Email</label>
										<div class="col-sm-4">
											<form:input path="email" placeholder="Email" type="email"
												class="form-control" />
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label">Gender</label>
										<div class="col-sm-4" style="margin-top: 6px;">
											<form:radiobutton path="gender" value="Male"
												style="margin-right:2px" />
											Male
											<form:radiobutton path="gender" value="Female"
												style="margin-right:2px" />
											Female
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail3" class="col-sm-3 control-label">is
											Default</label>
										<div class="col-sm-4" style="margin-top: 6px;">
											<form:radiobutton path="isDefault" value="N"
												style="margin-right:2px" />
											No
											<form:radiobutton path="isDefault" value="Y"
												style="margin-right:2px" />
											yse
										</div>
									</div>

									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">State</label>
										<div class="col-sm-4">

											<form:select class="form-control" path="stateMaster">
												<form:option value="Non">--Select State--</form:option>
												<%
													Integer selectedStateId = (Integer) request.getAttribute("selectedStateId");
															ArrayList<StateMaster> statesList = (ArrayList) request.getAttribute("statesList");
															for (StateMaster name : statesList) {
																Integer o = name.getSid();
																String option = name.getName();
																String optionvalue = Integer.toString(name.getSid());
												%>
												<c:choose>
													<c:when test="<%=selectedStateId == o%>">
														<form:option selected="true" value="<%=optionvalue%>"><%=option%>
														</form:option>
														<br />
													</c:when>
													<c:otherwise>
														<form:option value="<%=optionvalue %>"><%=option%>
														</form:option>

														<br />
													</c:otherwise>
												</c:choose>
												<form:option value="<%=optionvalue%>"><%=option%></form:option>
												<%
													}
												%>
											</form:select>
										</div>

									</div>
									<div class="form-group">
										<label for="inputPassword3" class="col-sm-3 control-label">Password</label>
										<div class="col-sm-4">
											<form:input path="password" placeholder="password"
												type="password" class="form-control" />
										</div>
									</div>

								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<button type="submit" id="submit"
										class="btn btn-info pull-right"
										style="margin-left: 5px; width: 150px;">Submit</button>
									<a href="<spring:url value="/userspage" />"><span
										class="btn btn-default pull-right" style="width: 150px;">Cancel</span></a>
								</div>
								<!-- /.box-footer -->
							</form:form>
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
				<b>Version</b> 2.3.0
			</div>
			<strong>Copyright &copy; 2014-2015 <a href="http://jbk.com">JBK</a>.
			</strong> All rights reserved.
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Create the tabs -->
			<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
				<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i
						class="fa fa-home"></i></a></li>
				<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
						class="fa fa-gears"></i></a></li>
			</ul>
			<!-- Tab panes -->
			<div class="tab-content">
				<!-- Home tab content -->
				<div class="tab-pane" id="control-sidebar-home-tab">
					<h3 class="control-sidebar-heading">Recent Activity</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript::;"> <i
								class="menu-icon fa fa-birthday-cake bg-red"></i>
								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>
									<p>Will be 23 on April 24th</p>
								</div>
						</a></li>
						<li><a href="javascript::;"> <i
								class="menu-icon fa fa-user bg-yellow"></i>
								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Frodo Updated His
										Profile</h4>
									<p>New phone +1(800)555-1234</p>
								</div>
						</a></li>
						<li><a href="javascript::;"> <i
								class="menu-icon fa fa-envelope-o bg-light-blue"></i>
								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Nora Joined Mailing
										List</h4>
									<p>nora@example.com</p>
								</div>
						</a></li>
						<li><a href="javascript::;"> <i
								class="menu-icon fa fa-file-code-o bg-green"></i>
								<div class="menu-info">
									<h4 class="control-sidebar-subheading">Cron Job 254
										Executed</h4>
									<p>Execution time 5 seconds</p>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

					<h3 class="control-sidebar-heading">Tasks Progress</h3>
					<ul class="control-sidebar-menu">
						<li><a href="javascript::;">
								<h4 class="control-sidebar-subheading">
									Custom Template Design <span
										class="label label-danger pull-right">70%</span>
								</h4>
								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-danger"
										style="width: 70%"></div>
								</div>
						</a></li>
						<li><a href="javascript::;">
								<h4 class="control-sidebar-subheading">
									Update Resume <span class="label label-success pull-right">95%</span>
								</h4>
								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-success"
										style="width: 95%"></div>
								</div>
						</a></li>
						<li><a href="javascript::;">
								<h4 class="control-sidebar-subheading">
									Laravel Integration <span
										class="label label-warning pull-right">50%</span>
								</h4>
								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-warning"
										style="width: 50%"></div>
								</div>
						</a></li>
						<li><a href="javascript::;">
								<h4 class="control-sidebar-subheading">
									Back End Framework <span class="label label-primary pull-right">68%</span>
								</h4>
								<div class="progress progress-xxs">
									<div class="progress-bar progress-bar-primary"
										style="width: 68%"></div>
								</div>
						</a></li>
					</ul>
					<!-- /.control-sidebar-menu -->

				</div>
				<!-- /.tab-pane -->
				<!-- Stats tab content -->
				<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
					Content</div>
				<!-- /.tab-pane -->
				<!-- Settings tab content -->
				<div class="tab-pane" id="control-sidebar-settings-tab">
					<form method="post">
						<h3 class="control-sidebar-heading">General Settings</h3>
						<div class="form-group">
							<label class="control-sidebar-subheading"> Report panel
								usage <input type="checkbox" class="pull-right" checked>
							</label>
							<p>Some information about this general settings option</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Allow mail
								redirect <input type="checkbox" class="pull-right" checked>
							</label>
							<p>Other sets of options are available</p>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Expose author
								name in posts <input type="checkbox" class="pull-right" checked>
							</label>
							<p>Allow the user to show his name in blog posts</p>
						</div>
						<!-- /.form-group -->

						<h3 class="control-sidebar-heading">Chat Settings</h3>

						<div class="form-group">
							<label class="control-sidebar-subheading"> Show me as
								online <input type="checkbox" class="pull-right" checked>
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Turn off
								notifications <input type="checkbox" class="pull-right">
							</label>
						</div>
						<!-- /.form-group -->

						<div class="form-group">
							<label class="control-sidebar-subheading"> Delete chat
								history <a href="javascript::;" class="text-red pull-right"><i
									class="fa fa-trash-o"></i></a>
							</label>
						</div>
						<!-- /.form-group -->
					</form>
				</div>
				<!-- /.tab-pane -->
			</div>
		</aside>
		<!-- /.control-sidebar -->
		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

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
	<script
		src="<spring:url value="/resources/bootstrap/js/bootstrap.min.js"/>"></script>
	<!-- Morris.js charts -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
	<script
		src="<spring:url value="/resources/plugins/morris/morris.min.js"/>"></script>
	<!-- Sparkline -->
	<script
		src="<spring:url value="/resources/plugins/sparkline/jquery.sparkline.min.js"/>"></script>
	<!-- jvectormap -->
	<script
		src="<spring:url value="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"/>"></script>
	<script
		src="<spring:url value="/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"/>"></script>
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
		src="<spring:url value="/resources/plugins/fastclick/fastclick.min.js" />"></script>
	<!-- AdminLTE App -->
	<script src="<spring:url value="/resources/dist/js/app.min.js"/>"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script
		src="<spring:url value="/resources/dist/js/pages/dashboard.js"/>"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="<spring:url value="/resources/dist/js/demo.js"/>"></script>
</body>
</html>
