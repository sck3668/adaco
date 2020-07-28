package com.icia.adaco.controller.rest;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.icia.adaco.service.rest.*;

@Controller
public class OrderRestController {
	@Autowired
	private OrderRestService orderservice;
	
}
