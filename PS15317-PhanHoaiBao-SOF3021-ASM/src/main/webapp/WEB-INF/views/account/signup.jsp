<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class=" d-flex align-items-center justify-content-center ">
        <div class="col-12 col-sm-11 col-md-9 col-lg-7 col-xl-5 text-center p-2 shadow-lg rounded-3">
            <form action="/account/signup" method="post">
                <h1>Đăng ký</h1>
                <div class="mb-3">
                    <input class="form-control" type="text" name="username" placeholder="Tên đăng nhập" />
                </div>
                <div class="mb-3">
                    <input class="form-control" type="text" name="fullname" placeholder="Tên đầy đủ" />
                </div>
                <div class="mb-3">
                    <input class="form-control" type="email" name="email" placeholder="Email" />
                </div>
                <div class="mb-3">
                    <input class="form-control" type="password" name="password" placeholder="Mật khẩu" />
                </div>
                
                <div class="mb-1">
                    <a href="/account/login">Có tài khoản! Đăng nhập!</a>
                </div>
                <div class="mb-3">
                    <button class="btn btn-outline-success">Đăng ký</button>
                </div>
            </form>
            <p><b><i>${message}${param.error}</i></b></p>
        </div>
    </div>