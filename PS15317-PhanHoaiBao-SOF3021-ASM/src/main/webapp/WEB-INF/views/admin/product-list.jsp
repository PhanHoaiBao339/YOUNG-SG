<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<nav>
	<div class="nav nav-tabs">
		<a class="btn nav-link active text-dark" href="#">List Product</a> <a
			class="btn nav-link text-dark" href="/admin/product-editform">Edit
			Product</a> 
	</div>
</nav>
<div>
	<div class="tab-pane fade show active" id="nav-list" role="tabpanel"
		aria-labelledby="nav-home-tab">
		<!-- Bộ công cụ -->

		<div class="text-end p-2">
			<a class="btn btn-outline-primary btn-sm"
				href="/admin/product-list?field=id">Filter</a> <a
				class="btn btn-outline-primary btn-sm"
				href="/admin/product-list?field=name">Sort by name</a> <a
				class="btn btn-outline-primary btn-sm"
				href="/admin/product-list?field=price">Sort by price</a> <a
				class="btn btn-outline-primary btn-sm"
				href="/admin/product-list?field=brand">Sort by brand</a> <a
				class="btn btn-outline-primary btn-sm"
				href="/admin/product-list?field=quantity">Sort by amount</a>
		</div>
		<!-- Danh sách áo -->
		<table class="table text-center">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Price</th>
					<th scope="col">Brand</th>
					<th scope="col">Category</th>
					<th scope="col">Size</th>
					<th scope="col">Color</th>
					<th scope="col">Images</th>
					<th scope="col">Quantity</th>
					<th scope="col">Tool</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${pageproduct.content}"
					varStatus="loop">
					<tr>
						<td>${item.id }</td>
						<td>${item.name }</td>
						<td><fmt:formatNumber type="number" value="${item.price}" />
							VND</td>
						<td>${item.brand.name }</td>
						<td>${item.category.name }</td>
						<td><c:forEach var="size" items="${item.sizes }">
								[<span>${size.name }</span>]</c:forEach></td>
						<td><c:forEach var="color" items="${item.colors }">
								[<span>${color.name }</span>]
							</c:forEach></td>
						<td><c:forEach var="color" items="${item.colors }">
								[<span>${color.image.name } </span>]
							</c:forEach></td>
						<td>${item.quantity }</td>
						<td><a class="btn btn-outline-primary btn-sm"
							href="/admin/product-edit?id=${item.id }">Edit</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr class="text-primary" style="height: 5px">
		<div class="row">
			<div class="col">
				<nav>
					<ul class="pagination pagination-sm justify-content-center">
						<li class="page-item"><a
							class="btn btn-outline-primary btn-sm"
							href="/admin/product-list?p=0">First</a></li>
						<li class="page-item"><a
							class="btn btn-outline-primary btn-sm"
							href="/admin/product-list?p=${pageproduct.number-1}">Previous</a></li>
						<li class="page-item"><a
							class="btn btn-outline-primary btn-sm"
							href="/admin/product-list?p=${pageproduct.number+1}">Next</a></li>
						<li class="page-item"><a
							class="btn btn-outline-primary btn-sm"
							href="/admin/product-list?p=${pageproduct.totalPages-1}">Last</a></li>
					</ul>
				</nav>
			</div>

			<div class="col-1 text-end p-2">
				<form action="/admin/product-list">
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">Next</span> <input
							name="p" type="number" class="form-control" onchange="submit">
					</div>
				</form>
			</div>
			<div class="col-3 text-end p-2">
				<span>1-10 of ${pageproduct.totalElements} List (page
					${pageproduct.number+1}/${pageproduct.totalPages})</span>
			</div>
		</div>
	</div>
</div>
