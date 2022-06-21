<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div>
	<nav>
		<div class="nav nav-tabs">
			<a class="btn nav-link active text-dark" href="#">List Order</a> <a
				class="btn nav-link text-dark" href="/report/orderdetails">List
				Order Detail</a>
		</div>
	</nav>
	<div class="tab-pane fade show active">
		<!-- Bộ công cụ -->

		<div class="text-end p-2">
			<button class="btn btn-outline-primary btn-sm">Filter</button>
			<button class="btn btn-outline-primary btn-sm">Sort by name</button>
			<button class="btn btn-outline-primary btn-sm">Sort by price</button>
			<button class="btn btn-outline-primary btn-sm">Sort by brand</button>
			<button class="btn btn-outline-primary btn-sm">Sort by
				amount</button>
		</div>
		<!-- Danh sách áo -->
		<table class="table text-center">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Phone</th>
					<th scope="col">Address</th>
					<th scope="col">Request Date</th>
					<th scope="col">Total</th>
					<th scope="col">Tool</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${pageorder.content}">
					<tr>
						<th scope="row">${item.id }</th>
						<td class="text-start">${item.account.fullname }</td>
						<td>${item.phone }</td>
						<td class="text-start">${item.address }</td>
						<td>${item.createdate }</td>
						<td class="text-end"><fmt:formatNumber type="number"
								value="${item.totalmoney }" /> VND</td>
						<td>
							<a class="btn btn-outline-primary btn-sm"
							href="/report/orderdetail?p=0&id=${item.id }">View
								details</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr class="text-primary" style="height: 5px">
		<div class="row d-flex align-items-center">
			<div class="col">
				<nav>
					<ul class="pagination pagination-sm justify-content-center">
						<li class="page-item"><a
							class="btn btn-outline-primary btn-sm" href="/report/order?p=0">First</a></li>
						<li class="page-item"><a
							class="btn btn-outline-primary btn-sm"
							href="/report/order?p=${pageorder.number-1}">Previous</a></li>
						<li class="page-item"><a
							class="btn btn-outline-primary btn-sm"
							href="/report/order?p=${pageorder.number+1}">Next</a></li>
						<li class="page-item"><a
							class="btn btn-outline-primary btn-sm"
							href="/report/order?p=${pageorder.totalPages-1}">Last</a></li>
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
				<span>1-10 of ${pageorder.totalElements} List (page
					${pageorder.number+1}/${pageorder.totalPages})</span>
			</div>
		</div>

	</div>
	<!-- Tab 2 -->

	<!-- Tab 3 -->
	<div class="tab-pane fade" id="nav-info" role="tabpanel"
		aria-labelledby="nav-contact-tab"></div>
</div>
