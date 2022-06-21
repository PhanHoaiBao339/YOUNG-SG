<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="container-xl m-auto">
	<form class="" action="/cart/add/${item.id }/false" method="get">
		<div class="row d-flex justify-content-center">
			<div class="col-md-12 p-0">
				<div class="card">
					<div class="row">
						<div class="col-md-6 p-0">
							<div class="images p-3">
								<div class="text-center p-4">
									<img id="main-image"
										src="../images/${item.colors.get(0).getImage().getName() }"
										width="250" />
								</div>
								
									<div class="thumbnail text-center">
									<c:forEach var="image" items="${item.colors}">
										<img onclick="change_image(this)"
											src="../images/${image.getImage().getName() }" width="70">
									</c:forEach>
								</div>
								
							</div>
						</div>
						<div class="col-md-6 p-0">
							<div class="product p-4">
								<div class="">
									<span class="text-uppercase text-muted brand">${item.brand.getName()}</span>
									<h5 class="text-uppercase">${item.name}</h5>
								</div>
								<p class="about">${item.info}</p>
								<div class="mt-3">
									<h6 class="text-uppercase">Color</h6>
									<c:forEach var="color" items="${item.colors}">
										<label class="rdocolor"> <input type="radio"
											id="color" name="color" value="${color.name}"> <span
											class="bg-${color.name}" style="height: 32px; width: 32px;"></span>
										</label>
									</c:forEach>
								</div>
								<div class="mt-3">
									<h6 class="text-uppercase">Size</h6>
									<c:forEach var="size" items="${item.sizes}">
										<label class="radio"> <input type="radio" id="size"
											name="size" value="${size.name}"> <span>${size.name}</span>
										</label>
									</c:forEach>
								</div>
								<div class="mt-3">
									<h6 class="text-uppercase">Quantity</h6>
									<input name="soLuongMua" type="number" value="1" class="form-control w-25"
										placeholder="1" min="1" max="${item.quantity}">
								</div>
								<div class="price mt-4 d-flex flex-row align-items-center">
									<h3 class="act-price m-0">
										<fmt:formatNumber type="number" value="${item.price}" />
										VND
									</h3>
									<!-- <div class="ml-2">
																				<small class="dis-price">$59</small> <span>40%
																					OFF</span>
																			</div> -->
								</div>
								<div class="cart mt-4 align-items-center">
									<button class="btn btn-danger text-uppercase mr-2 px-4"
										type="submit">Add to cart</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

