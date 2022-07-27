<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="card">
	<div class="card-body">
		<h5 class="card-title">CẬP NHẬT CHI TIẾT SẢN PHẨM</h5>
	</div>
</div>

<div class="card">
	<div class="card-body">
		<h5 class="card-title">Thông Tin Đơn Hàng</h5>
		<div class="col-sm-10">
			<div class="row m-0 py-2">
				<div class="col-4">Thời Gian Đặt</div>
				<div class="col-8">
					<fmt:formatDate value="${orderDetail.order.createDate}"
						pattern="dd/MM/yyyy" />
				</div>
			</div>
			<div class="row m-0 py-2">
				<div class="col-4">Địa Chỉ</div>
				<div class="col-8">${orderDetail.order.address }</div>
			</div>
		</div>
	</div>
</div>

<div class="card">
	<div class="card-body">
		<h5 class="card-title">Thông Tin Khách Hàng</h5>
		<div class="col-sm-10">
			<div class="row m-0 py-2">
				<div class="col-4">Tên Khách Hàng</div>
				<div class="col-8">${orderDetail.order.account.fullname }</div>
			</div>
			<div class="row m-0 py-2">
				<div class="col-4">Email</div>
				<div class="col-8">${orderDetail.order.account.email }</div>
			</div>
		</div>
	</div>
</div>

<div class="card">
	<div class="card-body">
		<h5 class="card-title">Cập Nhật</h5>
		<form:form action="/admin/orderdetails/update" method="POST"
			modelAttribute="orderDetail">
			<div class="row mb-3">
				<label for="name" class="col-sm-2 col-form-label">Cập Nhật
					Số Lượng</label>
				<div class="col-sm-10">
					<form:hidden path="id" />
					<form:input type="number" min="1" path="quantity"
						required="required" />
				</div>
			</div>

			<div class="row mb-3">
				<div class="col-sm-10">
					<span class="px-1">
						<button type="submit" class="btn btn-primary">Cập Nhật</button>
					</span> <span class="px-1">
						<button type="reset" class="btn btn-warning">Làm Mới</button>
					</span>
				</div>
			</div>
		</form:form>
	</div>
</div>