<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="container">
	<div class="row justify-content-center py-5">
		<table class="table table-striped align-middle table-responsive">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Tên Danh Mục</th>
					<th colspan="2">Thao Tác</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ data.content }" var="category">
					<tr>
						<td>${ category.id }</td>
						<td>${ category.name }</td>
						<td><a href="/admin/categories/update/${category.id}"><button
									class="btn btn-primary">Sửa</button></a></td>
						
						
						<td>
						<div class="modal fade" id="Modal${category.id }" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										Bạn muốn xóa người dùng <b>${ category.name }</b> không ?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">No</button>
										<a href="/admin/categories/delete/${category.id}"
											class="btn btn-danger" type="button"> Delete </a>

									</div>
								</div>
							</div>
						</div>
						<a class="btn btn-danger" data-bs-toggle="modal"
							data-bs-target="#Modal${ category.id }"> Delete </a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

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
