<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="container">
	<div class="row justify-content-center py-5">
		<form:form method="POST" modelAttribute="category"
			action="/admin/categories/store">
			<form:hidden path="id" />
			<div class="mb-3">
				<label>Tên Danh Mục</label>
				<form:input name="name" path="name" class="form-control" />
				<form:errors path="name" class="text-danger" />
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form:form>
	</div>
</div>
