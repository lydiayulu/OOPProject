<%@ page import="model.*"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/content.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Frugal Innovation Lab</title>
<!-- can not working through the css -->
<style>
.sidebar-nav .navbar li a:hover {
	background-color: #428bca;
	color: white;
}
</style>

</head>
<body>
	<!-- ${user.getLastName()}, ${user.getFirstName()}! You are logged in! -->
	<div class="row affix-row">
		<div class="col-sm-3 col-md-2 affix-sidebar">
			<div class="sidebar-nav">
				<div class="navbar navbar-default" role="navigation">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle" data-toggle="collapse"
							data-target=".sidebar-navbar-collapse">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<span class="visible-xs navbar-brand">Sidebar menu</span>
					</div>
					<div class="navbar-collapse collapse sidebar-navbar-collapse">
						<ul class="nav navbar-nav" id="sidenav01">
							<li class="active"><a href="#" data-toggle="collapse"
								data-target="#toggleDemo0" data-parent="#sidenav01"
								class="collapsed">
									<h4>
										Homepage <br> <small>${user.getLastName()},
											${user.getFirstName()} <span class="caret"></span>
										</small>
									</h4>
							</a>
								<div class="collapse" id="toggleDemo0" style="height: 0px;">
									<ul class="nav nav-list">
										<li><s:url id="urlValue" action="URLRedirection">
												<s:param name="url">index</s:param>
											</s:url>
											<s:a href="%{urlValue}">My tasks</s:a></li>
										<li><a href="#">Finished Task</a></li>
										<li><a href="#">Upcoming Task</a></li>
									</ul>
								</div></li>
							<li><a href="#" data-toggle="collapse" data-target="#team"
								data-parent="#sidenav01" class="collapsed"> <span
									class="glyphicon glyphicon-cloud"></span> Query <span
									class="caret pull-right"></span>
							</a>
								<div class="collapse" id="team" style="height: 0px;">
									<ul class="nav nav-list">
										<li><a href="#">Query by name</a></li>
										<li><a href="#">Query by project</a></li>
									</ul>
								</div></li>
							<li class="active"><a href="#" data-toggle="collapse"
								data-target="#project" data-parent="#sidenav01"
								class="collapsed"> <span class="glyphicon glyphicon-lock"></span>
									Project <span class="caret pull-right"></span>
							</a>
								<div class="collapse" id="project" style="height: 0px;">
									<ul class="nav nav-list">
										<li><s:url id="urlValue" action="URLRedirection"
												encode="true">
												<s:param name="url">viewmyprojects</s:param>
											</s:url> <s:a href="%{urlValue}">MyProjects</s:a></li>
									<li><s:url id="urlValue" action="URLRedirection"
												encode="true">
												<s:param name="url">createprojects</s:param>
											</s:url> <s:a href="%{urlValue}">Create Project</s:a></li>
										<li><a href="#">Edit Project</a></li>
									</ul>
								</div></li>
							<li><a href="#" data-toggle="collapse"
								data-target="#communication" data-parent="#sidenav01"
								class="collapsed"><span class="glyphicon glyphicon-inbox"></span>
									Communications <span class="caret pull-right"></span></a>
								<div class="collapse" id="communication" style="height: 0px;">
									<ul class="nav nav-list">
										<li><a href="#">Communicaitons</a></li>
										<li><a href="#">Record a communicaiton</a></li>

									</ul>
								</div></li>
							<li><a href="#"><span
									class="glyphicon glyphicon-calendar"></span> Timeline </a></li>
							<li><a href="#"><span class="glyphicon glyphicon-cog"></span>
									My Profile</a></li>
						</ul>
					</div>
					<!--/.nav-collapse -->
				</div>
			</div>
		</div>
		<div class="col-sm-9 col-md-10 affix-content">
			<div class="container">
				<div>
					<img alt="Logo.jpg" src="img/FIL Logo.jpg" hspace="0" vspace="20"
						style="float: left"> <a
						href="https://drive.google.com/a/scu.edu/file/d/0BzYeTJK5yum0dXhpNWZSY09RaG8/view?usp=sharing"
						style="float: right; padding: 30px">Google Folder</a>

				</div>

				<div class="page-header" style="clear: both">
					<h3>
						<span class="glyphicon glyphicon-th-list"></span> Project Detail:
					</h3>
				</div>



				<div class="project-table">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th width="200px">Name</th>
								<th>Description</th>

							</tr>
						</thead>
						<%
							Project p = (Project) (session.getAttribute("project"));
						%>

						<tr>
							<td><%=p.getName()%></td>
							<td><%=p.getDescription()%></td>

						</tr>
					</table>
				</div>

				<div class="project-table">
					<table class="table table-bordered" style="table-layout: fixed">
						<thead>
							<tr>
								<th>Start Date</th>
								<th>End Date</th>
								<th>Last Modified Date</th>
								<th>Project Outcome</th>
								<th>Project Status</th>
							</tr>
						</thead>
						<tr>
							<td><%=Project.dateToStr(p.getStartDate())%></td>
							<td><%=Project.dateToStr(p.getEndDate())%></td>
							<td><%=Project.dateToStr(p.getLastModifiedDate())%></td>
							<td><%=p.getProjectOutcome()%></td>
							<td><%=p.getProjectStatus()%></td>
						</tr>
					</table>
					<hr>
					<p>Team members:</p>
					<div style="margin: 20px">
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>First name</th>
									<th>Last name</th>
									<th>Email</th>
								</tr>
							</thead>
							<%
							for (User u : p.getUsers()) {
							%>
							<tr>
								<td><%=u.getFirstName()%></td>
								<td><%=u.getLastName()%></td>
								<td><a href="mailto:<%=u.getEmail()%>"><%=u.getEmail()%></a></td>
							</tr>
							<%
								}
							%>

						</table>
					</div>
				</div>

			</div>
		</div>
	</div>


</body>
</html>