<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<section class="h-100 h-custom">
	<div class="container h-100 py-5">
		<div
			class="row d-flex justify-content-center align-items-center h-100">
			<div class="col" id="listCart">
				<div class="table-responsive m-3">
					<table class="table text-center">
						<thead>
							<tr>
								<th scope="col" class="text-start h5">GIỎ HÀNG CỦA BẠN</th>
								<th scope="col">Kích thước</th>
								<th scope="col">Màu</th>
								<th scope="col">Số lượng</th>
								<th scope="col">Giá</th>
								<th scope="col">Xóa</th>
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
										<form action="/cart/update/${item.value.id}/true" method="get">
											<div class="d-flex flex-row justify-content-center">
												<button class="btn btn-link px-2"
													onmousedown="this.parentNode.querySelector('input[type=number]').stepDown()"
													onmouseup="summit">
													<i class="fas fa-minus"></i>
												</button>
												<input name="soLuongMua" onchange="summit" type="number"
													class="form-control form-control-sm quantityProd"
													value="${item.value.quantityOder}" style="width: 50px">
												<button class="btn btn-link px-2"
													onmousedown="this.parentNode.querySelector('input[type=number]').stepUp()"
													onmouseup="summit">
													<i class="fas fa-plus"></i>
												</button>
											</div>
										</form>

									</td>
									<td class="align-middle" style="width: 180px">
										<p class="mb-0" style="font-weight: 500"
											id="totalSP-${cartDetail.value.masp}">
											<fmt:formatNumber type="number"
												value="${item.value.price * item.value.quantityOder}" />
											VND
										</p>
									</td>
									<td class="align-middle"><a class="btn btn-link px-2"
										href="/cart/remove/${item.value.id}"> <i
											class="fa-solid fa-x"></i>
									</a></td>
								</tr>
								<input type="hidden" id="giaSP-${item.value.id}"
									value="${item.value.price}" />
								<input type="hidden" id="colorSP-${item.value.id}"
									value="${item.value.color}" />
								<input type="hidden" id="sizeSP-${item.value.id}"
									value="${item.value.size}" />
							</c:forEach>
							<!-- End item -->
						</tbody>
					</table>
					<div class="text-end">
						<a class="btn bg-primary text-white" href="/cart/clear"> Xóa
							tất cả <i class="p-2 fa-solid fa-x"></i>
						</a>
					</div>
				</div>
				<!-- Start pay -->
				<div
					class="card pay-card shadow-2-strong mb-5 mb-lg-0 col-auto m-auto"
					style="border-radius: 16px">
					<div class="card-body p-4">
						<div class="row">
							<div class="d-flex justify-content-between mb-4"
								style="font-weight: 500">
								<p class="mb-2">Tổng tiền:</p>
								<p class="mb-2" id="tongTien">
									<fmt:formatNumber type="number"
										value="${sessionScope.cart.tongtien}" />
									VND
								</p>
							</div>

							<a type="button" class="btn btn-primary btn-block btn-lg"
								id="payNow" href="/cart/checkout"> <span
								class="d-flex justify-content-between"> <span>Tiến
										hành thanh toán</span> <span id="tongTien"><fmt:formatNumber
											type="number" value="${sessionScope.cart.tongtien}" /> VND</span>
							</span>
							</a>
						</div>
					</div>
				</div>
			</div>
			<!-- End pay -->
		</div>
	</div>
</section>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
