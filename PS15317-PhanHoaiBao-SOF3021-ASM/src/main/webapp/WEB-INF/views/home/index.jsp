<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<section>
	<div class="container-xl m-auto">
		<div id="carouselExampleIndicators" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="../images/p1.png" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="../images/p2.png" class="d-block w-100" alt="...">
				</div>
				<div class="carousel-item">
					<img src="../images/p3.png" class="d-block w-100" alt="...">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
</section>
<article class="container-xl">
	<div>
		<main>
			<!-- DEMO HTML -->
			<div class="container bg-white">
				<nav class="navbar navbar-expand-md navbar-light bg-white">
					<div class="container-fluid p-0">
						<a class="navbar-brand text-uppercase fw-800" href="#"> <span
							class="border-red pe-2 brand">NHỮNG MẪU ÁO MỚI NHẤT</span>
						</a>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse" data-bs-target="#myNav"
							aria-controls="myNav" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="fas fa-bars"></span>
						</button>
						<div class="collapse navbar-collapse" id="myNav">
							<div class="navbar-nav ms-auto">
								<a class="nav-link active" aria-current="page" href="#">All</a>
								<a class="nav-link" href="#">Women's</a> <a class="nav-link"
									href="#">Men's</a> <a class="nav-link" href="#">Kid's</a> <a
									class="nav-link" href="#">Accessories</a> <a class="nav-link"
									href="#">Cosmetics</a>
							</div>
						</div>
					</div>
				</nav>
				<div class="row">
					<c:forEach var="item" items="${page.content}">
						<div
							class="col-lg-3 col-sm-6 d-flex flex-column align-items-center justify-content-center product-item my-3">
							<div class="product">
								<img src="../images/${item.colors.get(0).getImage().getName() }"
									alt="Hình ảnh không tồn tại">
								<ul
									class="d-flex align-items-center justify-content-center list-unstyled icons">
									<li class="icon me-2"><a class="btn"
										href="/product/detail?id=${item.id}"><i class="fas fa-eye"></i></a></li>
									<li class="icon ms-2"><a class="btn"
										data-bs-toggle="modal" data-bs-target="#${item.id}"> <span
											class="fas fa-shopping-bag"></span>
									</a></li>
								</ul>
							</div>
							<div class="tag bg-red">sale</div>
							<div class="title pt-4 pb-1">${item.name}</div>
							<div class="d-flex align-content-center justify-content-center">
								<span class="fas fa-star"></span> <span class="fas fa-star"></span>
								<span class="fas fa-star"></span> <span class="fas fa-star"></span>
								<span class="fas fa-star"></span>
							</div>
							<div class="price">
								<fmt:formatNumber type="number" value="${item.price}" />
								VND
							</div>
						</div>
						<div class="modal fade" id="${item.id}" tabindex="-1"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-lg">
								<div class="modal-content">
									<div class="modal-body p-0 m-0">
										<form class="" action="/cart/add/${item.id }/false"
											method="get">
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
																				src="../images/${image.getImage().getName() }"
																				width="70">

																		</c:forEach>
																	</div>
																</div>
															</div>
															<div class="col-md-6 p-0">
																<div class="product p-4">
																	<div
																		class="d-flex justify-content-between align-items-center">
																		<button class="btn" data-bs-dismiss="modal">
																			<div class="d-flex align-items-center">
																				<i class="fa fa-long-arrow-left"></i> &nbsp; <span
																					class="ml-1">Back</span>
																			</div>
																		</button>
																	</div>
																	<div class="mt-4 mb-3">
																		<span class="text-uppercase text-muted brand">${item.brand.getName()}</span>
																		<h5 class="text-uppercase">${item.name}</h5>
																		<div class="price d-flex flex-row align-items-center">
																			<span class="act-price"><fmt:formatNumber
																					type="number" value="${item.price}" /> VND</span>
																			<!-- <div class="ml-2">
																				<small class="dis-price">$59</small> <span>40%
																					OFF</span>
																			</div> -->
																		</div>
																	</div>
																	<p class="about">${item.info}</p>
																	<div class="mt-3">
																		<h6 class="text-uppercase">Color</h6>
																		<c:forEach var="color" items="${item.colors}">
																			<label class="rdocolor"> <input type="radio"
																				id="color" name="color" value="${color.name}">
																				<span class="bg-${color.name}"
																				style="height: 32px; width: 32px;"></span>
																			</label>
																		</c:forEach>
																	</div>
																	<div class="mt-3">
																		<h6 class="text-uppercase">Size</h6>
																		<c:forEach var="size" items="${item.sizes}">
																			<label class="radio"> <input type="radio"
																				id="size" name="size" value="${size.name}">
																				<span>${size.name}</span>
																			</label>
																		</c:forEach>
																	</div>
																	<div class="mt-3">
																		<h6 class="text-uppercase">Quantity</h6>
																		<input name="soLuongMua" type="number" value="1"
																			class="form-control w-25" placeholder="1" min="1"
																			max="${item.quantity}">
																	</div>
																	<div class="cart mt-4 align-items-center">
																		<button
																			class="btn btn-danger text-uppercase mr-2 px-4"
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
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>
			<!-- EMD DEMO HTML -->
		</main>
	</div>
</article>
<script>
	function change_image(image) {
		var container = document.getElementById("main-image");
		container.src = image.src;
	}
</script>
