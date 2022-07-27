<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<c:if test="${ empty data.content }">
	<p class="alert alert-warning">Không có dữ liệu</p>
</c:if>

<c:if test="${ !empty data.content }">
	<table
		class="table table-striped table-hover text-center align-middle table-responsive">
		<thead>
			<tr>
				<th>Tên Khách Hàng</th>
				<th>Ngày Đặt</th>
				<th>Địa Chỉ</th>
				<th>Số Lượng Sản Phẩm</th>
				<th>Tổng Giá Trị</th>
				<th colspan="2">Thao Tác</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ data.content }" var="orderReport">
				<tr>
					<td class="text-wrap">${orderReport.order.account.fullname }</td>
					<td><fmt:formatDate value="${orderReport.order.createDate }"
							pattern="dd/MM/yyyy" /></td>
					<td>${orderReport.order.address }</td>
					<td>${orderReport.quantity }</td>
					<td><fmt:formatNumber value="${orderReport.total }"
							groupingUsed="true" />&nbsp;₫</td>
							
					<td><a href="/admin/orders/${orderReport.order.id }"><button
								class="btn btn-success">Chi Tiết</button></a></td>
					<td><a href="/admin/orders/delete/${orderReport.order.id}"><button
								class="btn btn-danger">Xóa</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="d-flex justify-content-center">
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item"><a class="page-link"
					href="/admin/orders/index?page=0&size=10">1</a></li>
				<li class="page-item"><a class="page-link"
					href="/admin/orders/index?page=1&size=10">2</a></li>
				<li class="page-item"><a class="page-link"
					href="/admin/orders/index?page=2&size=10">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
</c:if>

<script type="text/javascript">
	const confirmBtnOnClick = id => {
		$("#delete-link").attr("href", "http://localhost:8080/admin/orders/delete/"+id);
		$('#myConfirmModal').modal('show');
	}
</script>