package com.icia.adaco.exception;

public class OrderDetailNotFoundException extends RuntimeException{

	private String msg;
	
	@Override
	public String getMessage() {
		return msg;
	}
}
