<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<c:forEach items="${orders }" var="order">
	<c:set var="total" value="0" />
	<div class="row justify-content-center pt-3 m-0 mb-3">
		<div class="col-lg-10 m-0 p-0">
			<div>
				<div class="px-2 px-xl-4 bg-light">
					<div class="d-flex border-bottom justify-content-between">
						<div class="d-flex align-items-center">
							<a class="text-decoration-none" data-bs-toggle="collapse"
								href="#collapseExample${order.id}" role="button"
								aria-expanded="false" aria-controls="collapseExample"> Chi
								tiết </a>
						</div>
					</div>
					<div class="collapse" id="collapseExample${order.id}">
						<div class="py-2 border-bottom">
							<p class="mb-1">
								Thời gian đặt :
								<fmt:formatDate value="${order.createDate}" pattern="dd/MM/yyy" />
							</p>
							<p class="mb-1">Địa chỉ : ${order.address }</p>
						</div>
					</div>

					<c:forEach items="${order.orderDetails }" var="orderDetail">
						<c:set var="total"
							value="${total +  orderDetail.quantity * orderDetail.price}" />
						<div class="row m-0 py-3 border-bottom">
							<div class="col-lg-8 m-0 p-0 row">
								<div class="col-4 col-lg-3 p-0">
									<a href="/products?id=${orderDetail.product.id}"><img
										src="${orderDetail.product.image }" class="img-fluid"></a>
								</div>
								<div class="col-8 d-flex flex-column justify-content-around">
									<p class="m-0">${orderDetail.product.name }</p>
									<p class="m-0">
										Gía trị :
										<fmt:formatNumber value="${orderDetail.price }"
											groupingUsed="true" />
										&nbsp;₫
									</p>
									<p class="m-0">Số lượngx${orderDetail.quantity }</p>
								</div>
							</div>
							<div class="col-lg-4 m-0 py-2 py-lg-0 row justify-content-around">
								<div class="col-4 text-center d-flex align-items-center">
									<p class="m-0 text-danger">
										<fmt:formatNumber
											value="${orderDetail.quantity * orderDetail.price }"
											groupingUsed="true" />
										&nbsp;₫
									</p>
								</div>
							</div>
						</div>
					</c:forEach>

					<div class="d-flex justify-content-between">
						<div class="py-3 px-5 text-end">
							Tổng số tiền : <span class="text-danger"><fmt:formatNumber
									value="${total }" groupingUsed="true" />&nbsp;₫</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
