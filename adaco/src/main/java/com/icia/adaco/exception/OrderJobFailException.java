package com.icia.adaco.exception;

import lombok.*;

@AllArgsConstructor
public class OrderJobFailException extends RuntimeException {
	
private String msg;
	
	@Override
	public String getMessage() {
		return msg;
	}
}
