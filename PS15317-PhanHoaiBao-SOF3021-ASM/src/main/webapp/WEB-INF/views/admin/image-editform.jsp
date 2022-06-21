<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<hr>
<div class="row g-3">
	<div class="col-md-6 border-end">
		<div class="mt-4">
			<label class="form-label me-2">Seach Id Image</label>
			<form>
				<div class="input-group mb-3">
					<input name="idimgseach" type="text" value="" class="form-control"
						placeholder="Id Image?" aria-label="Recipient's username"
						aria-describedby="basic-addon2">
					<button class="btn input-group-text" id="basic-addon2"
						formaction="/admin/image-seachid">
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
						href="/admin/image-editform?p=0">First</a></li>
					<li class="page-item"><a
						class="btn btn-outline-primary btn-sm"
						href="/admin/image-editform?p=${page.number-1}">Previous</a></li>
					<li class="page-item"><a
						class="btn btn-outline-primary btn-sm"
						href="/admin/image-editform?p=${page.number+1}">Next</a></li>
					<li class="page-item"><a
						class="btn btn-outline-primary btn-sm"
						href="/admin/image-editform?p=${page.totalPages-1}">Last</a></li>
				</ul>
			</nav>
		</div>
		<table class="table text-center">
			<thead>
				<tr>
					<th scope="col">ID Image</th>
					<th scope="col">Name</th>
					<th scope="col">Tool</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="item" items="${page.content}">
					<tr>
						<td>${item.id }</td>
						<td>${item.name }</td>
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
				<label class="form-label me-2">Id Image</label>
				<div>
					<input name="idimg" type="text"
						value="${idimg }" class="form-control me-2"
						id="exampleFormControlInput1">
				</div>
				<div class="mb-3">
					<label for="formFile" class="form-label">Choose Image</label> <input
						class="form-control" type="file" id="formFile">
				</div>
			</div>

			<!-- TOOL -->
			<div class="row mt-4 justify-content-center">
				<hr class="text-primary" style="height: 5px">
				<!-- TOOL -->
				<div class="row mt-4 justify-content-center">
					<div class="col-2">
						<button formaction="/admin/product-save"
							class="btn btn-primary w-100">Insert</button>
					</div>
					<div class="col-2">
						<button formaction="/admin/product-update"
							class="btn btn-primary w-100">Update</button>
					</div>
					<div class="col-2">
						<a href="/admin/product-delete?id=${prod.id }" type="button"
							class="btn btn-primary w-100">Delete</a>
					</div>
					<div class="col-2">
						<a href="/admin/product-editform" type="button"
							class="btn btn-primary w-100">Reset</a>
					</div>
				</div>
			</div>
		</form>
	</div>


</div>
