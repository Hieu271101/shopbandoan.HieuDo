package com.home.shop3.controller.user;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ControllerException {

	@ExceptionHandler({ Exception.class })  // Có thể bắt nhiều loại exception
    public String handleExceptionA(Exception e) {
		System.out.print(e.getMessage());
        return "common/error";
    }
}
