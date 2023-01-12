package com.home.shop3.conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

//@Configuration
//public class MVCConf implements WebMvcConfigurer {
//	@Override
//	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
//		registry.addResourceHandler("/mananager/**").addResourceLocations("classpath:/manager/");
//	}
//	
//	@Bean
//	public ViewResolver viewResolver() {
//		InternalResourceViewResolver bean=new InternalResourceViewResolver();
//		bean.setViewClass(JstlView.class);
//		bean.setPrefix("WEB-INF/views/");
//		bean.setSuffix(".jsp");
//		return bean;
//	}
//}

@Configuration
public class MVCConf implements WebMvcConfigurer {
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/user/**").addResourceLocations("classpath:/user/");
		registry.addResourceHandler("/manager/**").addResourceLocations("classpath:/manager/");
		registry.addResourceHandler("/upload/**").addResourceLocations("file:" + "C:/upload/");
	}
	
	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver bean =new InternalResourceViewResolver();
		bean.setViewClass(JstlView.class);
		bean.setPrefix("/WEB-INF/views/");
		bean.setSuffix(".jsp");
		return bean;
	}
}