<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
	<div class="container">
		<div class="row justify-content-center py-5">
			<div class="card">
				<div class="card-header">
					<h2>Add new Product</h2>
				</div>
				<div class="card-body">
					<form:form method="POST" modelAttribute="product"
						action="/admin/products/store">
						<div class="row">
							<div class="col-7">
								<div class="mb-3">
									<label>Name Product</label>
									<form:input name="name" path="name" class="form-control" />
									<form:errors path="name" class="text-danger" />
								</div>
								<div class="mb-3 input-group form-group">
									<span class="input-group-text">Price</span>
									<form:input name="price" path="price" class="form-control" />
									<form:errors path="price" class="text-danger" />
									<span class="input-group-text">$</span>
								</div>
								
								<div class="mb-3">
									<label>Available</label>
									<form:input name="available" path="available"
										class="form-control" />
									<form:errors path="available" class="text-danger" />
								</div>
								<div class="mb-3">
									<label>CategoryId</label>
									<form:select path="category">
										<form:options items="${categories}" itemLabel="name"></form:options>
									</form:select>
								</div>
							</div>

							<div class="col-3">
								<div class="form-group">
									<label for="image">Image</label>
									<form:input name="image" path="image" class="form-control" />
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-2">
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
