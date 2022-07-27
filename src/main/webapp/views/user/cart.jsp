<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
	<div class="row justify-content-center py-5">
		<table class="table table-striped align-middle table-responsive">
			<thead>
				<tr>
					<th scope="col">Image</th>
					<th scope="col">Tên sản phẩm</th>
					<th scope="col">Gía</th>
					<th scope="col">Số lượng</th>
					<th scope="col">Tổng giá</th>
					<th>Thao tác</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sessionScope.cart}" var="orderDetail">
					<tr>
						<td><img alt="product"
							src="${orderDetail.value.product.image }"
							style="max-width: 150px" /></td>
						<td>${ orderDetail.value.product.name }</td>
						<td>
							<fmt:formatNumber value="${orderDetail.value.product.price }"
									groupingUsed="true" />
								&nbsp;₫
							</td>

						<td>x${ orderDetail.value.quantity }</td>
						<td>
						<div>
								<fmt:formatNumber
									value="${orderDetail.value.quantity * orderDetail.value.product.price }"
									groupingUsed="true" />
								&nbsp;₫
						</div>
						</td>
						<td><a href="/cart/remove?p=${orderDetail.value.product.id }"><button
									class="btn btn-primary">Xóa khỏi giỏ</button></a></td>
					</tr>
					<c:set var="total"
						value="${total + orderDetail.value.quantity * orderDetail.value.product.price }" />
				</c:forEach>
			</tbody>
		</table>
		<div class="m-0 py-3 px-5 text-end">
			Tổng số tiền : <span class="text-danger"><fmt:formatNumber
					value="${total }" groupingUsed="true" />&nbsp;₫</span>
		</div>
		
		<form:form class="row p-0 m-0" method="POST" modelAttribute="order"
				action="/orders/create">
				<input type="hidden" name="accountID" value="${sessionScope.User.id }" />
				<div class="mt-3 px-0">
					<div class="bg-light px-4 ">
						<div class="m-0 py-2 border-bottom fw-bold">THÔNG TIN KHÁCH
							HÀNG</div>
						<div class="row m-0 p-0">
							<div
								class="col-lg-6 d-flex flex-column justify-content-center p-0">
								<div class="row py-3 m-0">
									<div class="col-4 p-0">Họ Và Tên :
										${sessionScope.User.fullname }</div>
									<div class="col-8 p-0"></div>
								</div>
								<div class="row py-3 m-0">
									<div class="col-4 p-0">Email : ${sessionScope.User.email }</div>
									<div class="col-8 p-0"></div>
								</div>
							</div>
							<div class="col-lg-6 d-flex flex-column justify-content-center">
								<div class="row py-2">
									<form:textarea path="address" required="required" placeholder="Địa chỉ"
										rows="4" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="pt-2 px-lg-0">
					<c:if test="${sessionScope.cart.size() > 0}">
						<input type="submit"
							class="btn btn-dark shadow-none rounded-0 border-dark float-end"
							value="Xác Nhận Đặt Hàng">
					</c:if>
				</div>
			</form:form>

		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item"><a class="page-link"
					href="/admin/categories/index?page=0&size=10">1</a></li>
				<li class="page-item"><a class="page-link"
					href="/admin/categories/index?page=1&size=10">2</a></li>
				<li class="page-item"><a class="page-link"
					href="/admin/categories/index?page=2&size=10">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
</div>
