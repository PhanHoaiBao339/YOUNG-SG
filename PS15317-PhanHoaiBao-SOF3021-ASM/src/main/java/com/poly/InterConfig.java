package com.poly;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.poly.interceptor.AuthInterceptor;
import com.poly.interceptor.GlobalInterceptor;

@Configuration
public class InterConfig implements WebMvcConfigurer {
	@Autowired
	GlobalInterceptor global;

	@Autowired
	AuthInterceptor auth;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(global).addPathPatterns("/**").excludePathPatterns("/assets/**");

		registry.addInterceptor(auth)
				.addPathPatterns("/account/edit", "/account/chgpwd", "/order/**", "/admin/**", "/report/**")
				.excludePathPatterns("/assets/**", "/admin/home/index");
	}
}