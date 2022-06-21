<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container">
	<div class="row">
		<!-- Profile -->
		<div class="col-md-4 border">
			<div
				class="d-flex flex-column align-items-center text-center p-3 py-5">
				<img class="rounded-circle mt-5" width="150px"
					src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg"><span
					class="font-weight-bold">${user.fullname }</span><span
					class="text-black-50">${user.email }</span><span> </span>
			</div>
		</div>
		<div class="col-md-8 border">
			<div class="p-3 py-5">
				<div class="d-flex justify-content-between align-items-center mb-3">
					<h4 class="text-right">Thông tin tài khoản</h4>
				</div>
				<form action="/account/profile-update">
					<div class="row mt-1">
						<div class="col-md-6 p-2">
							<label class="labels p-2">Tài khoản</label><input type="text" readonly="readonly"
								class="form-control" value="${user.username }">
						</div>
						<div class="col-md-6 p-2">
							<label class="labels p-2">Mật khẩu</label><input type="password"
								class="form-control" name="newpw" value="${user.password }">
						</div>
						<div class="col-md-12 p-2">
							<label class="labels p-2">Tên đầy đủ</label><input type="text"
								class="form-control" name="newfullname"
								value="${user.fullname }">
						</div>
						<div class="col-md-12 p-2">
							<label class="labels p-2">Email</label><input type="email"
								class="form-control" name="newemail" value="${user.email }">
						</div>
					</div>
					<div class="mt-5 text-center">
						<p>${message }</p>
						<button class="btn btn-primary profile-button" type="submit">Cập nhật</button>
					</div>
				</form>
				
			</div>
		</div>
		
		<!-- Profile end -->

		<!-- Order Table -->
		<h3 class="mt-4">Lịch sử mua hàng</h3>
		<div class="row bg-white m-auto mt-2 p-0 border">

			<div class="col-md-12 mt-2">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<button class="nav-link active text-dark" id="nav-home-tab"
							data-bs-toggle="tab" data-bs-target="#nav-list" type="button"
							role="tab" aria-controls="nav-home" aria-selected="true">Danh sách hóa đơn</button>
						<button class="nav-link text-dark" id="nav-profile-tab"
							data-bs-toggle="tab" data-bs-target="#nav-form" type="button"
							role="tab" aria-controls="nav-profile" aria-selected="false">Hóa đơn chi tiết</button>
						<button class="nav-link text-dark" id="nav-contact-tab"
							data-bs-toggle="tab" data-bs-target="#nav-info" type="button"
							role="tab" aria-controls="nav-contact" aria-selected="false">...</button>
					</div>
				</nav>
				<div class="tab-content" id="nav-tabContent">

					<!-- Tab 1 -->
					<div class="tab-pane fade show active" id="nav-list"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<!-- Danh sách áo -->
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Mã đơn hàng</th>
									<th scope="col">Tên</th>
									<th scope="col">Số điện thoại</th>
									<th scope="col">Địa chỉ giao hàng</th>
									<th scope="col">Ngày đặt</th>
									<th scope="col">Tổng tiền</th>
									<th scope="col">Công cụ</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">1</th>
									<td>Dân Chơi</td>
									<td>113</td>
									<td>Chân cầu Sài Gòn</td>
									<td>2022-06-18</td>
									<td>350.000</td>
									<td>
										<button class="btn btn-outline-primary btn-sm">Xem chi tiết</button>
									</td>
								</tr>
								<tr>
									<th scope="row">1</th>
									<td>Dân Chơi</td>
									<td>113</td>
									<td>Chân cầu Sài Gòn</td>
									<td>2022-06-18</td>
									<td>350.000</td>
									<td>
										<button class="btn btn-outline-primary btn-sm">View
											details</button>
									</td>
								</tr>
								<tr>
									<th scope="row">1</th>
									<td>Dân Chơi</td>
									<td>113</td>
									<td>Chân cầu Sài Gòn</td>
									<td>2022-06-18</td>
									<td>350.000</td>
									<td>
										<button class="btn btn-outline-primary btn-sm">View
											details</button>
									</td>
								</tr>
								<tr>
									<th scope="row">1</th>
									<td>Dân Chơi</td>
									<td>113</td>
									<td>Chân cầu Sài Gòn</td>
									<td>2022-06-18</td>
									<td>350.000</td>
									<td>
										<button class="btn btn-outline-primary btn-sm">View
											details</button>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="row">
							<div class="col">
								<nav aria-label="...">
									<ul class="pagination pagination-sm">
										<li class="page-item active" aria-current="page"><span
											class="page-link">1</span></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
									</ul>
								</nav>
							</div>
						</div>

					</div>
					<!-- Tab 1 end -->

					<!-- Tab 2 -->
					<div class="tab-pane fade p-2   " id="nav-form" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<div class="table-responsive m-3">
							<table class="table text-center">
								<thead>
									<tr>
										<th scope="col" class="text-start h5">Order Deatils</th>
										<th scope="col">Size</th>
										<th scope="col">Color</th>
										<th scope="col">Quantity</th>
										<th scope="col">Unit Price</th>
										<th scope="col">Total</th>
									</tr>
								</thead>
								<tbody>
									<!-- Start item -->
									<c:forEach var="item" items="${sessionScope.cart.detail}"
										varStatus="loop">
										<tr id="tr-${item.value.id}">
											<th scope="row">
												<div class="d-flex align-items-center">
													<div>
														<img src="../images/${item.value.image}"
															class="img-fluid rounded-3" style="width: 120px" />
													</div>
													<div class="flex-fill">
														<div class="flex-column ms-4">
															<p class="mb-2">${item.value.name}</p>
															<p class="mb-0">
																<fmt:formatNumber type="number"
																	value="${item.value.price}" />
																VND
															</p>
														</div>
													</div>
												</div>
											</th>
											<td class="align-middle">
												<p class="mb-0" style="font-weight: 500">${item.value.size}</p>
											</td>
											<td class="align-middle">
												<p class="mb-0" style="font-weight: 500">${item.value.color}</p>
											</td>
											<td class="align-middle">
												<p class="mb-0" style="font-weight: 500">
													${item.value.quantityOder}</p>
											</td>
											<td class="align-middle" style="width: 180px">
												<p class="mb-0" style="font-weight: 500"
													id="totalSP-${cartDetail.value.masp}">
													<fmt:formatNumber type="number"
														value="${item.value.price * item.value.quantityOder}" />
													VND
												</p>
											</td>
										</tr>
									</c:forEach>
									<!-- End item -->
								</tbody>
							</table>
							<div class="d-flex justify-content-between mb-4 h4"
								style="font-weight: 500">
								<p class="mb-2">Total:</p>
								<p class="mb-2" id="tongTien">
									<fmt:formatNumber type="number"
										value="${sessionScope.cart.tongtien}" />
									VNĐ
								</p>
							</div>
						</div>
						<hr>

						<div class="row">
							<div class="col">
								<nav aria-label="...">
									<ul class="pagination pagination-sm">
										<li class="page-item active" aria-current="page"><span
											class="page-link">1</span></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
									</ul>
								</nav>
							</div>
						</div>

					</div>
					<!-- Tab 2 end -->

					<!-- Tab 3 -->
					<div class="tab-pane fade" id="nav-info" role="tabpanel"
						aria-labelledby="nav-contact-tab">...</div>
				</div>

			</div>
		</div>
	</div>
</div>
