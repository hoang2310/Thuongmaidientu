<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container">
	<div class="row justify-content-center py-5">
		<table class="table table-striped align-middle table-responsive">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Product Name</th>
					<th scope="col">Price</th>
					<th scope="col">Created Date</th>
					<th scope="col">Available</th>
					<th scope="col">Categori Id</th>
					<th scope="col">Image</th>
					<th colspan="2">Thao Tác</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ data.content }" var="product">
					<tr>
						<td>${ product.id }</td>
						<td>${ product.name }</td>
						<td><fmt:formatNumber value="${product.price }"
								groupingUsed="true" />&nbsp;₫</td>
						<td><fmt:formatDate value="${product.createdDate }"
								pattern="dd/MM/yyyy" /></td>
						<td>${ product.available }</td>
						<td>${ product.category.name }</td>
						<td><img alt="product" src="${product.image }"
							style="max-width: 150px" /></td>
						<td><a href="/admin/products/update/${product.id}"><button
									class="btn btn-primary">Sửa</button></a></td>
						<td>
						<div class="modal fade" id="Modal${product.id }" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										Bạn muốn xóa người dùng <b>${ product.name }</b> không ?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">No</button>
										<a href="/admin/products/delete/${product.id}"
											class="btn btn-danger" type="button"> Delete </a>
									</div>
								</div>
							</div>
						</div>
						<a class="btn btn-danger" data-bs-toggle="modal"
							data-bs-target="#Modal${ product.id }"> Delete </a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<script>
			function deleteByID(id) {
				$("#delete-link").attr(
						"href",
						"/admin/products/delete"
								+ id)
				$('#exampleModal').modal('show');
			}
		</script>

		<div class="modal fade" id="exampleModal" tabindex=""
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Delete</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">Đồng ý xóa?</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<a class="btn btn-danger" id="delete-link" href="">Xóa</a>
					</div>
				</div>
			</div>
		</div>

		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item"><a class="page-link"
					href="/admin/products/index?page=0&size=10">1</a></li>
				<li class="page-item"><a class="page-link"
					href="/admin/products/index?page=1&size=10">2</a></li>
				<li class="page-item"><a class="page-link"
					href="/admin/products/index?page=2&size=10">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
</div>