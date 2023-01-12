package com.home.shop3.controller.manager;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.home.shop3.entities.admin.PositionEmployee;

@Controller
public class TestController {

	@RequestMapping(value= "/test",method=RequestMethod.GET)
	public String test(final Model model, final HttpServletRequest request,
					   final HttpServletResponse response)throws Exception{
		return "common/user/home_new";
	}
	
	@RequestMapping(value ="/test" , method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> ajax_addPosition(final Model model, final HttpServletRequest request,
			final HttpServletResponse response, final @RequestBody PositionEmployee position) {
		System.out.println("dcm no co nhan duoc "+ position.getName());
		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("statusCode", 200); // status code ví dụ: 200: Success, 500: Error, 404: NotFound
		jsonResult.put("statusMessage", "Cảm ơn bạn ");
		return ResponseEntity.ok(jsonResult);
	}

}
