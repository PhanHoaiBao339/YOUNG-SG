<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<nav class="mt-2">
	<div class="container-x d-flex flex-column">
		<div class="navbar navbar-expand-lg p-0 d-flex justify-content-center">
			<div class="row container-xxl p-0 ">
				<!-- Button -->
				<div class="col-2 col-lg-2 d-lg-none d-block">
					<button class="navbar-toggler" type="button"
						data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar">
						<span><i class="fas fa-bars"></i></span>
					</button>
				</div>

				<!-- Logo -->
				<div class="col col-lg-2 m-auto my-2 text-center">
					<picture>
					<source media="(max-width: 991px)" srcset="../images/logo.png">
					<img class="img-fluid logo" src="../images/logo.png" alt="logo">
					</picture>
				</div>

				<!-- Giỏ hàng -->
				<div
					class="col-2 col-lg-2 d-lg-none d-block p-0 d-flex justify-content-center">
					<a type="button" class="btn btn-outline-primary border-2 p-2"
						href="<c:url value='/cart/view' />"> <i
						class="fas fa-shopping-bag fs-3"></i> <span
						class=" d-none d-xl-inline">Giỏ hàng</span> <b>(<span
							class="badge bg-warning m-auto" id="countTotal">
								${sessionScope.cart == null ? '0' : sessionScope.cart.tongsl}</span>)
					</b>
					</a>
				</div>

				<!-- Tìm tiếm -->
				<div class="col-xl-5 col-lg-4 col-12 header-center"
					id="search-header">
					<form action="/search" method="get" class="input-group"
						role="search">
						<input type="text" name="q" value="" autocomplete="off"
							placeholder="Tìm kiếm sản phẩm..."
							class="border-0 rounded-pill rounded-end auto-search form-control "
							required=""> <input type="hidden" name="type"
							value="product"> <span
							class="input-group-btn input-group-text p-0 rounded-pill rounded-start auto-search">
							<button type="submit" class="btn h-100">
								<span class="fa fa-search"></span>
							</button>
						</span>
					</form>
				</div>


				<!-- Người dùng -->
				<div class="col-xl-5 col-lg-4 col-12 m-0">
					<ul class="d-flex my-auto p-0 justify-content-center">

						<!-- Hỗ trợ khách hàng -->
						<div class="d-flex m-auto">
							<li class="d-flex align-self-center d-lg-flex d-none me-2">
								<i class="fas fa-phone-square-alt fa-2x text-success"></i>
							</li>
							<li
								class="m-1 d-flex flex-column align-self-center d-lg-flex d-none contact">
								<span> Hỗ trợ khách hàng </span> <a href=""
								class="text-decoration-none text-dark fw-bold">0793818670</a>
							</li>
						</div>

						<!-- Tài khoản người dùng -->
						<div class="d-flex m-auto">
							<li class="d-flex align-self-center d-lg-flex d-none me-2">
								<i class="fas fa-user-circle fa-2x text-success"></i>
							</li>
							<li
								class="d-flex flex-column align-self-center d-lg-flex d-none user"
								ng-show="${ktdn }">

								<div class="dropdownone">
									<a class="dropdown-toggle text-light active" href="#"
										role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
										aria-expanded="false"> <span
										class="text-decoration-none text-dark fw-bold">Chào:
											${sessionScope.user.fullname }</span>
									</a>

									<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
										<li><a class="dropdown-item" href="/account/profile">Thông
												tin tài khoản</a></li>
										<li><a class="dropdown-item" href="/account/logout">Đăng
												xuất</a></li>
									</ul>
								</div>

							</li>
							<li
								class=" d-flex flex-column align-self-center d-lg-flex d-none user"
								ng-show="!${ktdn }"><a
								class="text-decoration-none text-dark fw-bold"
								href="/account/login">Đăng nhập</a> <a
								class="text-decoration-none text-dark fw-light register"
								href="/account/signup">Đăng ký</a></li>
						</div>

						<!-- Giỏ hàng -->
						<div class="d-flex m-auto">
							<li class="d-flex align-self-center d-none d-lg-inline"><a
								type="button" class="btn btn-outline-primary border-2 p-2"
								href="<c:url value='/cart/view' />"> <i
									class="fas fa-shopping-bag fs-3"></i> <span
									class=" d-none d-xl-inline">Giỏ hàng</span> <b><span
										class="badge bg-warning m-auto" id="countTotal">
											${sessionScope.cart == null ? '0' : sessionScope.cart.tongsl}</span>
								</b>
							</a></li>
						</div>

					</ul>
				</div>
			</div>
		</div>

		<!-- Menu -->
		<div class="my-2 ">
			<nav
				class="navbar menu navbar-expand-lg navbar-dark d-lg-flex d-none">
				<div class="container-xl">
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item me-3"><a
								class="nav-link active text-light" aria-current="page"
								href="/home/index">Trang chủ</a></li>
							<li class="nav-item dropdownone me-3"><a
								class="nav-link dropdown-toggle active text-light"
								href="#sanpham" id="navbarDropdown"> Sản phẩm </a>


								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<c:forEach var="item" items="${categories}">
										<li><a class="dropdown-item" href="#">${item.name }</a></li>
									</c:forEach>
								</ul></li>
							<li class="nav-item dropdownone me-3"><a
								class="nav-link dropdown-toggle active text-light" href="#"
								id="navbarDropdown"> Bộ sưu tập </a>
								<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
									<c:forEach var="item" items="${brands}">
										<li><a class="dropdown-item" href="#">${item.name }</a></li>
									</c:forEach>

								</ul></li>
							<li class="nav-item me-3"><a
								class="nav-link active text-light" aria-current="page" href="#">RANDOM
									SALE</a></li>
							<li class="nav-item"><a class="nav-link active text-light"
								aria-current="page" href="#">Liên hệ</a></li>
					</div>
				</div>
			</nav>
		</div>
	</div>
</nav>


<div>
	<div class="offcanvas offcanvas-start menu-canvas" tabindex="-1"
		id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
		<div class="offcanvas-header bg-lightblue">
			<h5 class="offcanvas-title" id="offcanvasNavbarLabel">
				<ul class="d-flex flex-row m-0 p-0">
					<li class="m-auto me-1 d-flex align-self-center"><i
						class="fas fa-user-circle fa-3x text-light me-2"></i></li>
					<li
						class="d-flex flex-column align-self-center d-lg-flex d-none user"
						ng-show="${ktdn }">
						<div class="dropdownone">
							<a class="dropdown-toggle text-light active" href="#"
								role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
								aria-expanded="false"> <span
								class="text-decoration-none text-dark fw-bold">Chào:
									${user.fullname }</span>
							</a>

							<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
								<li><a class="dropdown-item" href="/account/profile">Thông
										tin tài khoản</a></li>
								<li><a class="dropdown-item" href="/account/logout">Đăng
										xuất</a></li>
							</ul>
						</div>



					</li>
					<li class="m-auto ms-1 d-flex flex-column align-self-center"
						ng-show="!${ktdn }"><a
						class="text-decoration-none text-light fw-bold"
						href="/account/login">Đăng nhập</a> <a
						class="text-decoration-none text-light fw-light"
						href="/account/signup">Đăng ký</a></li>
				</ul>
			</h5>
			<button type="button" class="btn-close text-reset"
				data-bs-dismiss="offcanvas" aria-label="Close"></button>
		</div>

		<!-- Sub menu offcanvas-->
		<div class="offcanvas-body">
			<nav class="navbar navbar-light text-center fs-5">
				<ul class="navbar-nav flex-grow-1 pe-3 fw-bold">
					<li class="nav-item navsubitem"><a class="nav-link text-dark"
						aria-current="page" href="#!homepage">Trang chủ</a></li>
					<!-- Dropdown helper start -->
					<li class="nav-item dropdown navsubitem"><span
						class="nav-link text-dark dropdown-toggle" href="#"
						id="offcanvasNavbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Sản phẩm </span>
						<ul class="dropdown-menu"
							aria-labelledby="offcanvasNavbarDropdown">
							<c:forEach var="item" items="${categories}">
								<li><a class="dropdown-item" href="#">${item.name }</a></li>
							</c:forEach>
						</ul></li>
					<!-- Dropdown helper end -->
					<!-- Dropdown account start -->
					<li class="nav-item dropdown navsubitem"><span
						class="nav-link text-dark dropdown-toggle" href="#"
						id="offcanvasNavbarDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Bộ sưu tập
					</span>
						<ul class="dropdown-menu"
							aria-labelledby="offcanvasNavbarDropdown">
							<c:forEach var="item" items="${brands}">
								<li><a class="dropdown-item" href="#">${item.name }</a></li>
							</c:forEach>
						</ul></li>
					<!-- Dropdown account end -->
					<li class="nav-item navsubitem"><a class="nav-link text-dark"
						aria-current="page" href="#!homepage">RANDOM SALE</a></li>
				</ul>
			</nav>

		</div>
	</div>
</div>