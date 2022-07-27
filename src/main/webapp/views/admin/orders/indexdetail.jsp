<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="card">
	<div class="card-body">
		<h5 class="card-title">Thông Tin Đơn Hàng</h5>
		<div class="col-sm-10">
			<div class="row m-0 py-2">
				<div class="col-4">Thời Gian Đặt</div>
				<div class="col-8">
					<fmt:formatDate value="${order.createDate}" pattern="dd/MM/yyyy" />
				</div>
			</div>
			<div class="row m-0 py-2">
				<div class="col-4">Địa Chỉ</div>
				<div class="col-8">${order.address }</div>
			</div>
		</div>
	</div>
</div>

<div class="card">
	<div class="card-body">
		<h5 class="card-title">Thông Tin Khách Hàng</h5>
		<div class="col-sm-10">
			<div class="row m-0 py-2">
				<div class="col-4">Tên Tài Khoản</div>
				<div class="col-8">${order.account.username}</div>
			</div>
			<div class="row m-0 py-2">
				<div class="col-4">Tên Khách Hàng</div>
				<div class="col-8">${order.account.fullname }</div>
			</div>
			<div class="row m-0 py-2">
				<div class="col-4">Email</div>
				<div class="col-8">${order.account.email }</div>
			</div>
		</div>
	</div>
</div>

<div class="card">
	<div class="card-body">
		<div class="row m-0">
			<h5 class="card-title text-center col-sm-9">DANH SÁCH ĐẶT HÀNG</h5>
			<div class="col-sm-3 "></div>
		</div>
		<table
			class="table table-striped table-hover text-center align-middle table-responsive">
			<thead>
				<tr>
					<th>Ảnh</th>
					<th>Tên Sản Phẩm</th>
					<th>Giá</th>
					<th>Số Lượng</th>
					<th>Tổng</th>
					<th colspan="2">Thao Tác</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="total" value="0" />
				<c:forEach items="${ order.orderDetails }" var="orderDetail">
					<tr>
						<td><img alt="product" src="${orderDetail.product.image }"
							style="max-width: 150px" /></td>
						<td class="text-wrap">${orderDetail.product.name }</td>
						<td><fmt:formatNumber value="${orderDetail.product.price }"
								groupingUsed="true" />&nbsp;₫</td>
						<td>${orderDetail.quantity }</td>
						<td><fmt:formatNumber
								value="${orderDetail.quantity*orderDetail.product.price }"
								groupingUsed="true" />&nbsp;₫</td>
						<td><a
							href="/admin/orderdetails/update/${orderDetail.id }"><button
									class="btn btn-primary">Sửa</button></a></td>
						<td><button class="btn btn-danger"
								onclick="confirmBtnOnClick(${orderDetail.id }, ${orderDetail.order.id })">Xóa</button></td>
					</tr>
					<c:set var="total"
						value="${total + orderDetail.quantity*orderDetail.product.price }" />
				</c:forEach>
			</tbody>
		</table>
		<div class="text-end text-danger">
			Tổng Số Tiền :
			<fmt:formatNumber value="${total }" groupingUsed="true" />
			&nbsp;₫
		</div>
	</div>
</div>



<script type="text/javascript">
	const confirmBtnOnClick = (id, o) => {
		$("#delete-link").attr("href", '/admin/orderdetails/delete/'+ id +'?o='+ o);
		$('#myConfirmModal').modal('show');
	}
</script>

<script language="JavaScript" type="text/javascript" src="/js/jquery-1.2.6.min.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/jquery-ui-personalized-1.5.2.packed.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/sprinkle.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>