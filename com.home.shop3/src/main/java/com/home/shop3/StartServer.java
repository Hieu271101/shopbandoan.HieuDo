package com.home.shop3;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class StartServer {
	public static void main(String[] args) {
		System.out.print("running shop3");
		SpringApplication.run(StartServer.class, args);
	}
}
