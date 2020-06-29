package com.icia.adaco.exception;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public class JobFailException extends RuntimeException {
	private String msg;
	
	@Override
	public String getMessage() {
		return msg;
	}
}
