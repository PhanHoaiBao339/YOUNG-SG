<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<hr>
<div class="row g-3">
	<div class="col-md-6 border-end">
		<div class="mt-4">
			<label class="form-label me-2">Seach Id Product</label>
			<form>
				<div class="input-group mb-3">
					<input name="idproseach" type="text" value="" class="form-control"
						placeholder="Id Product?" aria-label="Recipient's username"
						aria-describedby="basic-addon2">
					<button class="btn input-group-text" id="basic-addon2"
						formaction="/admin/size-seachid">
						<span><i class="fa-solid fa-magnifying-glass"></i></span>
					</button>

				</div>
			</form>
		</div>
		<div class="col">
			<nav>
				<ul class="pagination pagination-sm justify-content-center">
					<li class="page-item"><a
						class="btn btn-outline-primary btn-sm"
						href="/admin/size-editform?p=0">First</a></li>
					<li class="page-item"><a
						class="btn btn-outline-primary btn-sm"
						href="/admin/size-editform?p=${pagesize.number-1}">Previous</a></li>
					<li class="page-item"><a
						class="btn btn-outline-primary btn-sm"
						href="/admin/size-editform?p=${pagesize.number+1}">Next</a></li>
					<li class="page-item"><a
						class="btn btn-outline-primary btn-sm"
						href="/admin/size-editform?p=${pagesize.totalPages-1}">Last</a></li>
				</ul>
			</nav>
		</div>
		<table class="table text-center">
			<thead>
				<tr>
					<th scope="col">ID Product</th>
					<th scope="col">Size</th>
					<th scope="col">Tool</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${pagesize.content}">
					<tr>
						<td>${item.id }</td>
						<td><c:forEach var="size" items="${item.sizes }">
								[<span>${size.name }</span>]</c:forEach></td>
						<td><a class="btn btn-outline-primary btn-sm"
							href="/admin/size-edit?id=${item.id }">Edit</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="col-md-6 border-start">
		<form>
			<div class="row mt-4 justify-content-center">
				<label class="form-label me-2">Id Product</label>
				<div>
					<input name="idprod" readonly="readonly" type="text"
						value="${idprod }" class="form-control"
						id="exampleFormControlInput1">
				</div>
				<label class="form-label me-2">Size</label>
				<div class="btn-group" role="group"
					aria-label="Basic checkbox toggle button group">
					<input name="name" type="checkbox" class="btn-check" id="S"
						autocomplete="off" value="S"> <label
						class="btn btn-outline-primary" for="S">S</label> <input
						name="name" type="checkbox" class="btn-check" id="M"
						autocomplete="off" value="M"> <label
						class="btn btn-outline-primary" for="M">M</label> <input
						name="name" type="checkbox" class="btn-check" id="L"
						autocomplete="off" value="L"> <label
						class="btn btn-outline-primary" for="L">L</label> <input
						name="name" type="checkbox" class="btn-check" id="XL"
						autocomplete="off" value="XL"> <label
						class="btn btn-outline-primary" for="XL">XL</label> <input
						name="name" type="checkbox" class="btn-check" id="XXL"
						autocomplete="off" value="XXL"> <label
						class="btn btn-outline-primary" for="XXL">XXL</label>
				</div>
			</div>

			<!-- TOOL -->
			<div class="row mt-4 justify-content-center">
				<hr class="text-primary" style="height: 5px">
				<div class="col-2">
					<button formaction="/admin/size-save" class="btn btn-primary w-100">Update</button>
				</div>
				<div class="col-2">
					<a href="/admin/size-editform" type="button"
						class="btn btn-primary w-100">Reset</a>
				</div>
			</div>
		</form>
	</div>
</div>





