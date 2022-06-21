<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="container">
	<div class="row g-5">
		<div class="col-md-6 col-lg-7 order-md-last">
			<h4 class="d-flex justify-content-between align-items-center mb-3">
				<span class="text-primary">Giỏ hàng</span> <span
					class="badge bg-warning rounded-pill">${sessionScope.cart == null ? '0' : sessionScope.cart.tongsl}</span>
			</h4>
			<div class="table-responsive m-3">
				<table class="table text-center">
					<thead>
						<tr>
							<th scope="col" class="text-start h5">GIỎ HÀNG CỦA BẠN</th>
							<th scope="col">Kích thước</th>
							<th scope="col">Màu</th>
							<th scope="col">Số lượng</th>
							<th scope="col">Giá</th>
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
													<fmt:formatNumber type="number" value="${item.value.price}" />
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
									<p class="mb-0" style="font-weight: 500">${item.value.quantityOder}</p>
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
				<div class="d-flex justify-content-between mb-4 h2"
					style="font-weight: 500">
					<p class="mb-2">Tổng tiền:</p>
					<p class="mb-2" id="tongTien">
						<fmt:formatNumber type="number"
							value="${sessionScope.cart.tongtien}" />
						VND
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-6 col-lg-5">
			<h4 class="mb-3">Địa chỉ thanh toán</h4>
			<form class="needs-validation" action="/cart/paynow">
				<div class="row g-3">
					<div class="col-sm-12">
						<label for="firstName" class="form-label">Tên đầy đủ</label> <input
							type="text" class="form-control" id="fullname" name="fullname"
							value="${sessionScope.user.fullname }" required="">
						<div class="invalid-feedback">Tên hợp lệ là bắt buộc.</div>
					</div>

					<div class="col-12">
						<label for="email" class="form-label">Email</label> <input
							type="email" class="form-control" id="email" name="email"
							placeholder="you@example.com" value="${sessionScope.user.email }">
						<div class="invalid-feedback">Vui lòng nhập một địa chỉ
							email hợp lệ để cập nhật thông tin vận chuyển.</div>
					</div>

					<div class="col-12">
						<label for="address" class="form-label">Địa chỉ</label> <input
							type="text" class="form-control" id="address" name="address"
							placeholder="1234 Main St" required="">
						<div class="invalid-feedback">Vui lòng nhập thông tin vận
							chuyển của bạn địa chỉ.</div>
					</div>

					<div class="col-12">
						<label for="phone" class="form-label">Số điện thoại</label> <input
							type="text" class="form-control" id="phone" name="phone"
							placeholder="01234567891" required="">
						<div class="invalid-feedback">Vui lòng nhập số điện thoại
							của bạn.</div>
					</div>

				</div>

				<hr class="my-4">

				<button class="w-100 btn btn-primary btn-lg" type="submit">Thanh
					toán</button>
			</form>
		</div>
	</div>
</div>