package com.icia.adaco.entity;


import lombok.*;
import lombok.experimental.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Accessors(chain=true)
@Builder
public class OrderDetail {
	private Integer oderno;
	private Integer optno;
	private Integer artno;
	private Integer amount;
	private Integer price;
	private String address; 
	private String recipient;
	private String tel;
	private String email;
	private String request;
	private Integer addPoint;
	private String postalcode;
	private String refundAccount;
	
}
