<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <div class="d-flex align-items-center justify-content-center">
        <div class="col-12 col-sm-11 col-md-9 col-lg-7 col-xl-5 text-center p-2 shadow-lg rounded-3">
            <form action="/account/login" method="post">
                <h1 class="text-center">Đăng nhập</h1>
                <div class="mb-3">
                    <input class="form-control" name="username" type="text" placeholder="Tên đăng nhập" />
                </div>
                <div class="mb-3">
                    <input class="form-control" name="password" type="password" placeholder="Mật khẩu" />
                </div>
                <div class="mb-1">
                    <a class="text-danger" href="#">Quên mật khẩu?</a>
                    <a href="/account/signup">Chưa có tài khoản? Đăng ký!</a>
                </div>
                <div class="mb-3">
                    <button class="btn btn-outline-primary">Đăng nhập</button>
                </div>
            </form>
            <p><b>${message}${param.error}</b></p>
        </div>
    </div>
