<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<nav>
	<div class="nav nav-tabs">
		<a class="btn nav-link text-dark" href="/admin/product-list">List
			Product</a> <a class="btn nav-link active text-dark" href="#">Edit
			Product</a>
	</div>
</nav>

<div>
	<form:form class="row g-3" action="/admin/product-editform"
		modelAttribute="prod">
		<form>
			<div class="col-md-6">
				<form:label class="form-label" path="id">ID </form:label>
				<form:input class="form-control" path="id" id="id" />
			</div>
			<div class="col-md-6">
				<form:label class="form-label" path="name">Name</form:label>
				<form:input class="form-control" path="name" id="name" />
			</div>
			<div class="col-md-6">
				<form:label class="form-label" path="price">Price</form:label>
				<form:input class="form-control" path="price" id="price"
					type="number" min="100000" max="5000000" />
			</div>
			<div class="col-md-6">
				<form:label class="form-label" path="quantity">Quantity</form:label>
				<form:input class="form-control" path="quantity" id="quantity"
					type="number" min="1" max="500" />
			</div>

			<div class="col-md-6">
				<form:label class="form-label" path="brand.id">Brand</form:label>
				<form:select path="brand.id" class="form-select" id="brand.id">
					<form:options items="${brands}" itemValue="id" itemLabel="name" />
				</form:select>
			</div>
			<div class="col-md-6">
				<form:label class="form-label" path="category.id">Category</form:label>
				<form:select path="category.id" class="form-select" id="category.id">
					<form:options items="${categorys}" itemValue="id" itemLabel="name" />
				</form:select>
			</div>
			<div class="col-md-6 btn-group" role="group">
				<form:label class="form-label m-auto me-2" path="available">Available</form:label>

				<form:radiobutton path="available" value="true" class="btn-check"
					name="btnradio" id="btnradio1" autocomplete="off" />
				<form:label class="btn btn-outline-primary m-auto mx-auto"
					for="btnradio1" path="available">Yes</form:label>

				<form:radiobutton path="available" value="false" class="btn-check"
					name="btnradio" id="btnradio2" autocomplete="off" />
				<form:label class="btn btn-outline-primary m-auto mx-auto"
					for="btnradio2" path="available">No</form:label>

			</div>

			<div class="col-md-6">
				<form:label class="form-label" path="info">Info</form:label>
				<form:textarea path="info" rows="3" cols="30" class="form-control"
					id="info" />
			</div>

			<hr class="text-primary" style="height: 5px">
			<!-- TOOL -->
			<div class="row mt-4 justify-content-center">
				<div class="col-1">
					<button formaction="/admin/product-save"
						class="btn btn-primary w-100">Insert</button>
				</div>
				<div class="col-1">
					<button formaction="/admin/product-update"
						class="btn btn-primary w-100">Update</button>
				</div>
				<div class="col-1">
					<a href="/admin/product-delete?id=${prod.id }" type="button"
						class="btn btn-primary w-100">Delete</a>
				</div>
				<div class="col-1">
					<a href="/admin/product-editform" type="button"
						class="btn btn-primary w-100">Reset</a>
				</div>
			</div>
		</form>
	</form:form>
</div>
