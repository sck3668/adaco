package com.icia.adaco.controller.rest;

import java.io.*;
import java.security.*;
import java.util.*;

import javax.validation.constraints.*;

import org.apache.commons.lang3.math.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.core.type.*;
import com.fasterxml.jackson.databind.*;
import com.icia.adaco.service.rest.*;

@RestController
public class MessageRestController {
	@Autowired
	private msgRestService msgRestService;
	@Autowired
	private ObjectMapper objectMapper;
	
	// 보낸 사람 측에서 메모 삭제
	@PatchMapping("/message/isSendMessage")
	public ResponseEntity<String> disableBySender(@RequestParam @NotNull String mnos, Principal principal) throws JsonParseException, JsonMappingException, IOException  {
		List<Integer> list = new ArrayList<>();
		String[] strings = mnos.split(",");
		// NumberUtils.toInt는 변경에 실패하면 기본값이 0이다. 따라서 예외는 발생하지 않는다 
		for(String str:strings)
			list.add(NumberUtils.toInt(str));
		msgRestService.disableBySender(list);
		return ResponseEntity.ok("/adaco/message/listSender");
	}
	
	// 받은 사람 측에서 메모 삭제
	@PatchMapping("/message/isReciverMessage")
	public ResponseEntity<String> disableByReceiver(@RequestParam @NotNull String mnos, Principal principal) throws JsonParseException, JsonMappingException, IOException {
		List<Integer> list = new ArrayList<>();
		String[] strings = mnos.split(",");
		// NumberUtils.toInt는 변경에 실패하면 기본값이 0이다. 따라서 예외는 발생하지 않는다 
		for(String str:strings)
			list.add(NumberUtils.toInt(str));
		msgRestService.disableByReceiver(list);
		return ResponseEntity.ok("/adaco/message/listReceiver");
	}
}
