<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<div class="container">
	<div class="row justify-content-center py-5">
		<table class="table table-striped align-middle table-responsive">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">UserName</th>
					<th scope="col">Fullname</th>
					<th scope="col">Email</th>
					<th scope="col">Photo</th>
					<th scope="col">Role</th>
					<th scope="col">Activated</th>
					<th colspan="2">Thao Tác</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ data.content }" var="account">
					<tr>
						<td>${ account.id }</td>
						<td>${ account.username }</td>
						<td>${ account.fullname }</td>
						<td>${ account.email }</td>
						
						<td><img alt="account" src="${account.photo }" style="max-width: 150px"/></td>
						<td>${ account.admin == 1 ? "Admin" : "Member" }</td>
						<td>${ account.activated == 0 ? "In-Active" : "Active" }</td>
						<td><a href="/admin/accounts/update/${account.id}"><button
									class="btn btn-primary">Sửa</button></a></td>
									
						<td>
						<div class="modal fade" id="Modal${account.id }" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									<div class="modal-body">
										Bạn muốn xóa người dùng <b>${ account.username }</b> không ?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">No</button>
										<a href="/admin/accounts/delete/${account.id}"
											class="btn btn-danger" type="button"> Delete </a>

									</div>
								</div>
							</div>
						</div>
						<a class="btn btn-danger" data-bs-toggle="modal"
							data-bs-target="#Modal${ account.id }"> Delete </a></td>			
						
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
					href="/admin/accounts/index?page=0&size=10">1</a></li>
				<li class="page-item"><a class="page-link"
					href="/admin/accounts/index?page=1&size=10">2</a></li>
				<li class="page-item"><a class="page-link"
					href="/admin/accounts/index?page=2&size=10">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
</div>
