<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>
	<nav>
		<div class="nav nav-tabs">
			<a class="btn nav-link text-dark" href="/report/order">List Order</a>
			<a class="btn nav-link active text-dark" href="#">List Order
				Detail</a>
		</div>
	</nav>
	<div class="tab-pane fade p-2 show active">
		<div class="table-responsive">
			<div class="">
				<h1 class="text-center">Order Information</h1>
				<table class="table text-center">
					<thead>
						<tr>
							<th scope="col">STT</th>
							<th scope="col">Name</th>
							<th scope="col">Phone</th>
							<th scope="col">Address</th>
							<th scope="col">Request Date</th>
							<th scope="col">Total</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">${item.id }</th>
							<td class="text-start"><p class="mb-0"
									style="font-weight: 500">${item.account.fullname }</p></td>
							<td>
								<p class="mb-0" style="font-weight: 500">${item.phone }</p>
							</td>
							<td class="text-start"><p class="mb-0"
									style="font-weight: 500">${item.address }</p></td>
							<td><p class="mb-0" style="font-weight: 500">${item.createdate }</p></td>
							<td class="text-end"><p class="mb-0"
									style="font-weight: 500">
									<fmt:formatNumber type="number" value="${item.totalmoney }" />
									VND
								</p></td>
						</tr>
					</tbody>
				</table>
			</div>
			<hr class="text-primary" style="height: 5px">
			<div class="">
				<h1 class="text-center">Order Details</h1>
				<table class="table text-center">
					<thead>
						<tr>
							<th scope="col" class="text-start h5">Order Deatils</th>
							<th scope="col">Name Product</th>
							<th scope="col">Size</th>
							<th scope="col">Color</th>
							<th scope="col">Quantity</th>
							<th scope="col">Unit Price</th>
							<th scope="col">Total</th>
						</tr>
					</thead>
					<tbody>
						<!-- Start item -->
						<c:forEach var="item" items="${pageorderdetail.content}">
							<tr>
								<th scope="row">
									<div class="d-flex align-items-center">
										<div>
											<img src="../images/${item.color.image.name}"
												class="img-fluid rounded-3" style="width: 120px" />
										</div>
									</div>
								</th>
								<td class="align-middle">
									<p class="mb-0" style="font-weight: 500">${item.oderproduct.name}</p>
								</td>
								<td class="align-middle">
									<p class="mb-0" style="font-weight: 500">${item.size.name}</p>
								</td>
								<td class="align-middle">
									<p class="mb-0" style="font-weight: 500">${item.color.name}</p>
								</td>
								<td class="align-middle">
									<p class="mb-0" style="font-weight: 500">${item.quantity}</p>
								</td>
								<td class="align-middle">
									<p class="mb-0" style="font-weight: 500">
										<fmt:formatNumber type="number" value="${item.price}" />
										VND
									</p>
								</td>
								<td class="align-middle" style="width: 180px">
									<p class="mb-0" style="font-weight: 500">
										<fmt:formatNumber type="number"
											value="${item.price * item.quantity}" />
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
					<p class="mb-2">Total:</p>
					<p class="mb-2">
						<fmt:formatNumber type="number" value="${item.totalmoney }" />
						VNĐ
					</p>
				</div>
			</div>
		</div>
		<hr class="text-primary" style="height: 5px">
		<div class="row">
			<div class="col">
				<nav>
					<ul class="pagination pagination-sm justify-content-center">
						<li class="page-item"><a
							class="btn btn-outline-primary btn-sm"
							href="/report/oderdetail?p=0&id=${item.id }">First</a></li>
						<li class="page-item"><a
							class="btn btn-outline-primary btn-sm"
							href="/report/oderdetail?p=${pageorderdetail.number-1}&id=${item.id }">Previous</a></li>
						<li class="page-item"><a
							class="btn btn-outline-primary btn-sm"
							href="/report/oderdetail?p=${pageorderdetail.number+1}&id=${item.id }">Next</a></li>
						<li class="page-item"><a
							class="btn btn-outline-primary btn-sm"
							href="/report/oderdetail?p=${pageorderdetail.totalPages-1}&id=${item.id }">Last</a></li>
					</ul>
				</nav>
			</div>

			<div class="col-1 text-end p-2">
				<div class="input-group mb-3">
					<span class="input-group-text" id="basic-addon1">Next</span> <input
						type="text" class="form-control" placeholder="" aria-label=""
						aria-describedby="basic-addon1">
				</div>
			</div>
			<div class="col-3 text-end p-2">
				<span>1-10 of ${pageorderdetail.totalElements} List (page
					${pageorderdetail.number+1}/${pageorderdetail.totalPages})</span>
			</div>
		</div>

	</div>
	<!-- Tab 3 -->
	<div class="tab-pane fade" id="nav-info" role="tabpanel"
		aria-labelledby="nav-contact-tab"></div>

</div>