<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="topbar" data-navbarbg="skin6">
	<nav class="navbar top-navbar navbar-expand-md navbar-dark">
		<div class="navbar-header" data-logobg="skin6">
			<!-- ============================================================== -->
			<!-- Logo -->
			<!-- ============================================================== -->
			<a class="navbar-brand" href="/admin/index"> <!-- Logo icon --> <b
				class="logo-icon text-center"> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
					<!-- Dark Logo icon --> <img src="../images/logo.png"
					alt="homepage" class="dark-logo w-75" />
			</b>
			</a>
			<!-- ============================================================== -->
			<!-- End Logo -->
			<!-- ============================================================== -->
			<!-- ============================================================== -->
			<!-- toggle and nav items -->
			<!-- ============================================================== -->
			<a
				class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
				href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
		</div>
		<!-- ============================================================== -->
		<!-- End Logo -->
		<!-- ============================================================== -->
		<div class="navbar-collapse collapse" id="navbarSupportedContent"
			data-navbarbg="skin5">

			<!-- ============================================================== -->
			<!-- toggle and nav items -->
			<!-- ============================================================== -->
			<ul class="navbar-nav me-auto mt-md-0 ">
				<!-- ============================================================== -->
				<!-- Search -->
				<!-- ============================================================== -->

				<li class="nav-item hidden-sm-down">
					<form class="app-search ps-3">
						<input type="text" class="form-control"
							placeholder="Search for..."> <a class="srh-btn"><i
							class="ti-search"></i></a>
					</form>
				</li>
			</ul>

			<!-- ============================================================== -->
			<!-- Right side toggle and nav items -->
			<!-- ============================================================== -->
			
			
			<ul class="navbar-nav">
				<!-- ============================================================== -->
				<!-- User profile and search -->
				<!-- ============================================================== -->
				<li class="nav-item dropdown">
					<div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
						<ul class="navbar-nav">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" id="navbarDarkDropdownMenuLink"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									${user.fullname } </a>
								<ul class="dropdown-menu dropdown-menu-dark"
									aria-labelledby="navbarDarkDropdownMenuLink">
									<li><a class="dropdown-item" href="/account/logout">Đăng
											xuất</a></li>
								</ul></li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</nav>
</header>