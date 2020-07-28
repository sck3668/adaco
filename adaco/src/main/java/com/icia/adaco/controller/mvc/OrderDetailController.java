package com.icia.adaco.controller.mvc;

import java.io.*;
import java.security.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.access.prepost.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.core.type.*;
import com.fasterxml.jackson.databind.*;
import com.icia.adaco.entity.*;
import com.icia.adaco.service.mvc.*;

@Controller
public class OrderDetailController {
	@Autowired
	private OrderDetailService service;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ObjectMapper objectMapper = new ObjectMapper();

}