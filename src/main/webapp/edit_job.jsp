<%@page import="com.entity.Jobs"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.jobDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Job</title>
<%@include file="all_component/all_css.jsp"%>
</head>
<body style="background-color: #f0f1f2;">

	<c:if test="${userobj.role ne 'admin' }">
		<c:redirect url="login.jsp">
		</c:redirect>
	</c:if>

	<%@include file="all_component/navbar.jsp"%>


	<div class="container p-2">
		<div class="col-md-10 offset-md-1">
			<div class="card">
				<div class="card-body">
					<div class="text-center text-success">
						<i class="fas fa-user-friends fa-3x"></i>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						jobDAO dao = new jobDAO(DBConnect.getConn());
						Jobs j = dao.getJobById(id);
						%>

						<h5>Edit Jobs</h5>
					</div>
					<form action="update" method="post">
						<input type="hidden" value="<%=j.getId()%>" name="id">
						<div class="form-group">
							<label>Enter Title</label> <input type="text" name="title"
								required class="form-control" value="<%=j.getTitle()%>">
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label>Location</label> <select name="Location"
									class="custom-select " id="inLineFormCustomSelectPref">
									<option value="<%=j.getLocation()%>">
										<%=j.getLocation()%></option>
									<option value="Maharashtra">Maharashtra</option>
									<option value="Nagpur">Nagpur</option>
									<option value="Gujrat">Gujrat</option>
									<option value="Dellhi">Dellhi</option>
									<option value="Chenai">Chenai</option>
									<option value="Lakhnow">Lakhnow</option>
									<option value="Bihar">Bihar</option>
									<option value="Rajsthan">Rajsthan</option>
									<option value="Rajsthan">Pune</option>
								</select>

							</div>
							<div class="form-group col-md-4">
								<label>Category</label> <select class="custom-select "
									id="inLineFormCustomSelectPref" name="category">
									<option value="<%=j.getCategory()%>"><%=j.getCategory()%></option>
									<option value="Doctor">Doctor</option>
									<option value="Developer">Developer</option>
									<option value="IT">IT</option>
									<option value="Engineer">Engineer</option>
									<option value="Teacher">Teacher</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label>Status</label> <select class="form-control" name="status">
									<option value="<%=j.getStatus()%>"><%=j.getStatus()%></option>
									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label>Enter Description</label>
							<textarea required rows="6" cols="" name="desc"
								class="form-control"><%=j.getDescription()%></textarea>
						</div>
						<button class="btn btn-success">Update Job</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>