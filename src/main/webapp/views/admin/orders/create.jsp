<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div ng-app="myApp" ng-controller="myCtrl">
	<div class="card">
		<div class="card-body">
			<h5 class="card-title">TẠO ĐƠN HÀNG</h5>
			<div class="row mb-3">
				<label for="name" class="col-sm-2 col-form-label">Tìm Khách
					Hàng</label>
				<div class="col-sm-10">
					<form ng-submit="searchAccount($event)">
						<div class="input-group">
							<input type="text" class="form-control" name="query"
								ng-model='query' placeholder="Nhập username "
								aria-label="Recipient's username"
								aria-describedby="button-addon2" required="required">
							<button class="btn btn-primary" type="submit" id="button-addon2">Tìm
								Kiếm</button>
						</div>
					</form>
				</div>
			</div>

			<form method="POST" ng-submit="orderSubmit($event)">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">Thông Tin Khách Hàng</h5>
						<p ng-if="!account" class="alert alert-warning">Không có dữ
							liệu</p>
						<div ng-if="account" class="col-sm-10">
							<div class="row m-0 py-2">
								<div class="col-4">Tên Tài Khoản</div>
								<div class="col-8">{{account.username }}</div>
							</div>
							<div class="row m-0 py-2">
								<div class="col-4">Tên Khách Hàng</div>
								<div class="col-8">{{account.fullname }}</div>
							</div>
							<div class="row m-0 py-2">
								<div class="col-4">Email</div>
								<div class="col-8">{{account.email }}</div>
							</div>
							<div class="row m-0 py-2">
								<div class="col-4">Trạng Thái</div>
								<div class="col-8" ng-switch="account.activated">
									<span ng-switch-when="0">Hoạt Động</span> <span
										ng-switch-when="1">Không Hoạt Động</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div>
					<div class="card">
						<div class="card-body">
							<div class="row m-0">
								<h5 class="card-title col-sm-9">DANH SÁCH SẢN PHẨM ĐẶT HÀNG</h5>
								<div
									class="col-sm-3 d-flex justify-content-center align-items-center">
									<button ng-if="account" class="btn btn-primary"
										data-bs-toggle="modal" data-bs-target="#create-order-modal"
										type="button">Thêm Sản Phẩm</button>
								</div>
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
										<th>Thao tác</th>
									</tr>
								</thead>
								<tbody>
									<tr ng-repeat="(id, orderDetail) in cart">
										<td><img alt="product"
											ng-src="{{orderDetail.product.image }}"
											style="max-width: 150px" /></td>
										<td class="text-wrap">{{orderDetail.product.name }}</td>
										<td>{{fmtNumber(orderDetail.product.price) }}</td>
										<td>{{orderDetail.quantity }}</td>
										<td>{{fmtNumber(orderDetail.quantity*orderDetail.product.price)
											}}</td>
										<td><button class="btn btn-danger">Xóa Khỏi Giỏ</button></td>
									</tr>
								</tbody>
							</table>
							<div class="text-end text-danger">Tổng số tiền :
								{{fmtNumber(total())}}</div>
						</div>
					</div>
				</div>

				<div class="row mb-3">
					<label for="address"
						class="col-sm-2 col-form-label d-flex align-items-center justify-content-center">Địa
						Chỉ</label>
					<div class="col-sm-10">
						<textarea path="address" id="address" class="form-control"
							required="required" rows="3" ng-model='address'></textarea>
					</div>
				</div>

				<div class="row mb-3">
					<div class="col-sm-10">
						<span class="px-1">
							<button type="submit" class="btn btn-primary"
								ng-disabled="!account">Tạo Đơn Hàng</button>
							<button type="reset" class="btn btn-primary"
								ng-click="resetBtn()">Làm Mới</button>
						</span>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="modal fade" id="create-order-modal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">THÊM SẢN PHẨM VÀO GIỎ</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="row mb-3">
						<label for="name" class="col-sm-2 col-form-label">Tìm Sản
							Phẩm</label>
						<div class="col-sm-10">
							<div class="input-group">
								<input type="text" class="form-control" ng-model="productQuery"
									placeholder="Nhập ID hoặc tên sản phẩm"
									aria-label="Recipient's username"
									aria-describedby="button-addon2">
								<button class="btn btn-primary" type="button" id="button-addon2"
									ng-click="searchBtn()">Tìm Kiếm</button>
							</div>
						</div>
					</div>
					<div class="mb-3">
						<table
							class="table table-striped table-hover text-center align-middle table-responsive">
							<thead>
								<tr>
									<th>Ảnh</th>
									<th>Tên Sản Phẩm</th>
									<th>Giá</th>
									<th>Thao Tác</th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="product in data">
									<td><img alt="product" ng-src="{{product.image }}"
										style="max-width: 150px" /></td>
									<td class="text-wrap">{{product.name }}</td>
									<td>{{fmtNumber(product.price) }}</td>
									<td><button class="btn btn-primary"
											ng-click="addToCart(product.id)" data-bs-toggle="modal"
											data-bs-target="#create-order-modal-message">Thêm
											Vào Giỏ</button></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="create-order-modal-message" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">Thành Công</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="create-order-modal-warning-message"
		tabindex="-1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">Chưa có mặt hàng nào trong giỏ</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	const app = angular.module("myApp", [])
	
	app.controller("myCtrl", function($scope, $http) {
		$scope.cart = {};
		$scope.productQuery = ""
		
		$scope.searchAccount = function(e){
			e.preventDefault();
			$http.get("http://localhost:8080/admin/accounts?query="+$scope.query).then(function (response) {
		        $scope.account = response.data;
		    }).catch(function (error) {
		        console.log(error);
		    })
		}
		
		$scope.searchBtn = function(){
			$http.get("http://localhost:8080/admin/products/search?query="+$scope.productQuery).then(function (response) {
		        $scope.data = response.data;
		    }).catch(function (error) {
		        console.log(error);
		    })
		}
		
		$scope.addToCart = function(id) {
			$http.get("http://localhost:8080/admin/orders/add-to-cart/"+id).then(function (response) {
				if($scope.cart[id] == null){
		        	$scope.cart = {...$scope.cart, [response.data.product.id] : response.data};
				} else {
					$scope.cart[id].quantity += response.data.quantity;
				}
				console.log($scope.cart)
		    }).catch(function (error) {
		        console.log(error);
		    })
		}
		
		$scope.orderSubmit = function (e){
			e.preventDefault();
			if($scope.cart && Object.keys($scope.cart).length === 0){
				$('#create-order-modal-warning-message').modal('show');
				return;
			}
			
			$http.post('http://localhost:8080/admin/orders/create', 
					{ account : { id : $scope.account.id}, address : $scope.address, orderDetails : Object.values($scope.cart)}
			).then(function (response) {
				window.location.href = "http://localhost:8080/admin/orders/index";
		    }).catch(function (error) {
		        console.log(error);
		    })
		}
		
		$scope.resetBtn = function (){
			$scope.account = null;
			$scope.cart = {};
			$scope.query = "";
		}
		
		$scope.fmtNumber = function(x) {
	    	return x.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ".")+" ₫";
		}
		
		$scope.total = function() {
			return Object.values($scope.cart).reduce((total, orderDetail) => total + orderDetail.price*orderDetail.quantity, 0);
		}
	});
</script>