<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<div class="container">
	<div class="row justify-content-center py-5">
		<div class="col-2">
			<ul class="list-group">
			<li class="list-group-item">
				<a href="/collections">All products</a>
			</li>
			<c:forEach items="${ cate }" var="category">
				<li class="list-group-item">
					<a href="/collections?c=${ category.id }">${ category.name }</a>
				</li>
			</c:forEach>
		</ul>
		</div>
		<div class="row col-10  p-2">
			<c:if test="${!empty data.content }">
				<c:forEach items="${ data.content }" var="product">
					<div class="card col-6 col-md-4 col-lg-3">
						<img src="${product.image }" class="card-img-top"
							alt="${product.name }">
						<div class="card-body py-2 px-0 text-center">
							<h5 class="card-title text-danger">
								<fmt:formatNumber value="${product.price }" groupingUsed="true" />
								&nbsp;₫
							</h5>
							<p class="card-text">${product.name }</p>
							<a href="/cart?p=${product.id }" class="btn btn-primary" >Thêm vào giỏ hàng</a>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>

	</div>
</div>