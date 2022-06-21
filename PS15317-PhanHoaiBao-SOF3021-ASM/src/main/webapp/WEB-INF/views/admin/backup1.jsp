<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div>
	<input hidden="true" onload="change_tab(${tab2})">
	<nav>
		<div class="nav nav-tabs" id="nav-tab" role="tablist">
			<button class="nav-link active text-dark" id="nav-home-tab"
				data-bs-toggle="tab" data-bs-target="#nav-list" type="button"
				role="tab" aria-controls="nav-home" aria-selected="true">Danh
				sách áo</button>
			<button class="nav-link text-dark" id="nav-list-tab"
				data-bs-toggle="tab" data-bs-target="#nav-form" type="button"
				role="tab" aria-controls="nav-profile" aria-selected="false">Chỉnh
				sửa</button>
			<button class="nav-link text-dark" id="nav-detail-tab"
				data-bs-toggle="tab" data-bs-target="#nav-info" type="button"
				role="tab" aria-controls="nav-contact" aria-selected="false">...</button>
		</div>
	</nav>
	<div class="tab-content" id="nav-tabContent">
		<!-- Tab 1 -->
		<div class="tab-pane fade show active" id="nav-list" role="tabpanel"
			aria-labelledby="nav-home-tab">
			<!-- Bộ công cụ -->

			<div class="text-end p-2">
				<a class="btn btn-outline-primary btn-sm"
					href="/admin/product?field=id">Filter</a> <a
					class="btn btn-outline-primary btn-sm"
					href="/admin/product?field=name">Sort by name</a> <a
					class="btn btn-outline-primary btn-sm"
					href="/admin/product?field=price">Sort by price</a> <a
					class="btn btn-outline-primary btn-sm"
					href="/admin/product?field=brand">Sort by brand</a> <a
					class="btn btn-outline-primary btn-sm"
					href="/admin/product?field=quantity">Sort by amount</a>
			</div>
			<!-- Danh sách áo -->
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID Sản phẩm</th>
						<th scope="col">Tên sản phẩm</th>
						<th scope="col">Giá tiền</th>
						<th scope="col">Hãng</th>
						<th scope="col">Size</th>
						<th scope="col">Màu</th>
						<th scope="col">Ảnh</th>
						<th scope="col">Số lượng</th>
						<th scope="col">Công cụ</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${page.content}" varStatus="loop">
						<tr>
							<td>${item.id }</td>
							<td>${item.name }</td>
							<td><fmt:formatNumber type="number" value="${item.price}" />
								VND</td>
							<td>${item.brand.name }</td>
							<td><c:forEach var="size" items="${item.sizes }">
								[<span>${size.name }</span>]</c:forEach></td>
							<td><c:forEach var="color" items="${item.colors }">
								[<span>${color.name }</span>]
							</c:forEach></td>
							<td><c:forEach var="color" items="${item.colors }">
								[<span>${color.image.name } </span>]
							</c:forEach></td>
							<td>${item.quantity }</td>
							<td>
								<a class="btn btn-outline-primary btn-sm"
								href="/admin/productedit?id=${item.id }">Sửa</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="row">
				<div class="col">
					<nav aria-label="...">
						<ul class="pagination pagination-sm">
							<li class="page-item"><a
								class="btn btn-outline-primary btn-sm" href="/admin/product?p=0">First</a></li>
							<li class="page-item"><a
								class="btn btn-outline-primary btn-sm"
								href="/admin/product?p=${page.number-1}">Previous</a></li>
							<li class="page-item"><a
								class="btn btn-outline-primary btn-sm"
								href="/admin/product?p=${page.number+1}">Next</a></li>
							<li class="page-item"><a
								class="btn btn-outline-primary btn-sm"
								href="/admin/product?p=${page.totalPages-1}">Last</a></li>
						</ul>
					</nav>
				</div>

				<div class="col-1 text-end p-2">
					<form action="/admin/product">
						<div class="input-group mb-3">

							<span class="input-group-text" id="basic-addon1">Next</span> <input
								name="p" type="number" class="form-control" onchange="submit">
						</div>
					</form>
				</div>
				<div class="col-3 text-end p-2">
					<span>1-10 của ${page.totalElements} Danh sách (trang
						${page.number+1}/${page.totalPages})</span>
				</div>
			</div>
		</div>
		<!-- Tab 2 -->
		<div class="tab-pane fade" id="nav-form" role="tabpanel"
			aria-labelledby="nav-profile-tab">
			<form:form class="row g-3" action="/admin/viewproduct"
				modelAttribute="pro">
				<div class="col-md-6">
					<label class="form-label">ID Sản phẩm</label>
					<form:input class="form-control" path="id" />
				</div>
				<div class="col-md-6">
					<label class="form-label">Tên sản phẩm</label>
					<form:input type="text" class="form-control" path="name" />
				</div>
				<div class="col-md-6">
					<label class="form-label">Giá tiền</label>
					<form:input type="number" class="form-control" path="price"
						min="100000" max="5000000" />
				</div>
				<div class="col-md-6">
					<label class="form-label">Số lượng</label>
					<form:input type="number" class="form-control" min="1" max="2000"
						path="quantity" />
				</div>

				<div class="col-md-6">
					<label class="form-label">Hãng</label>
					<form:select path="brand" class="form-select">
						<form:options items="${brands}" itemValue="id" itemLabel="name" />
					</form:select>
				</div>
				<div class="col-md-6">
					<label class="form-label">Loại</label>
					<form:select path="category" class="form-select">
						<form:options items="${categorys}" itemValue="id" itemLabel="name" />
					</form:select>
				</div>
				<div class="col-md-6 btn-group" role="group">
					<label class="form-label m-auto me-2">Tồn kho:</label>
					<form:radiobutton path="available" value="true" class="btn-check"
						name="btnradio" id="btnradio1" autocomplete="off" />
					<label class="btn btn-outline-primary m-auto mx-auto"
						for="btnradio1">Còn</label>

					<form:radiobutton path="available" value="false" class="btn-check"
						name="btnradio" id="btnradio2" autocomplete="off" />
					<label class="btn btn-outline-primary m-auto mx-auto"
						for="btnradio2">Hết</label>
				</div>

				<div class="col-md-6">
					<label class="form-label">Mô tả</label>
					<form:textarea path="info" rows="3" cols="30" class="form-control" />
				</div>

				<hr>
				<!-- TOOL -->
				<div class="row mt-4 justify-content-center">
					<div class="col-1">
						<button formaction="/admin/productsave"
							class="btn btn-primary w-100">Thêm</button>
					</div>
					<div class="col-1">
						<button formaction="/admin/productupdate"
							class="btn btn-primary w-100">Sửa</button>
					</div>
					<div class="col-1">
						<a href="/admin/productdelete/${pro.id }" type="button"
							class="btn btn-primary w-100">Xóa</a>
					</div>
					<div class="col-1">
						<a href="" type="button" class="btn btn-primary w-100">Tạo mới</a>
					</div>
				</div>
			</form:form>

		</div>
		<!-- Tab 3 -->
		<div class="tab-pane fade" id="nav-info" role="tabpanel"
			aria-labelledby="nav-contact-tab"></div>
	</div>
</div>
<script>
	function change_tab(kt) {
		if (kt) {
			var detailTabEl = document.querySelector('#nav-detail-tab')
			var detailTab = new bootstrap.Tab(firstTabEl)
			detailTab.show()
		}

	}
</script>
