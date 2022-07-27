<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="container">
	<div class="row justify-content-center py-5">
		<form:form method="POST" modelAttribute="account"
			action="/admin/accounts/store">

			<div class="mb-3">
				<label>Username</label>
				<form:input name="username" path="username" class="form-control" />
				<form:errors path="username" class="text-danger" />
			</div>
			<div class="mb-3">
				<label>Password</label>
				<form:input name="password" path="password" class="form-control" />
				<form:errors path="password" class="text-danger" />
			</div>
			<div class="mb-3">
				<label>Fullname</label>
				<form:input name="fullname" path="fullname" class="form-control" />
				<form:errors path="fullname" class="text-danger" />
			</div>
			<div class="mb-3">
				<label>Email</label>
				<form:input name="email" path="email" class="form-control" />
				<form:errors path="email" class="text-danger" />
			</div>
			<div class="mb-3">
				<label>Photo</label>
				<form:input name="photo" path="photo" class="form-control" />
				<form:errors path="photo" class="text-danger" />
			</div>
			<div>
				<label>Admin</label>
				<form:select path="admin">
					<form:option value="0">Member</form:option>
					<form:option value="1">Admin</form:option>
				</form:select>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form:form>
	</div>
</div>
