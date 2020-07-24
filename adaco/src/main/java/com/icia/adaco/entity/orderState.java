package com.icia.adaco.entity;

import java.util.*;

import com.icia.adaco.dto.*;
import com.icia.adaco.util.*;

public enum orderState {
	입금대기("입금대기"),입금완료("입금완료"),배송준비중("배송준비중"),배송중("배송중"),배송완료("배송완료");
	
	orderState(String name) {
	}
	
	public static orderState getorderState(String name) {
		if(name.equals("입금대기"))
			return orderState.입금대기;
		else if(name.equals("입금완료"))
			return orderState.입금완료;
		else if(name.equals("배송준비중"))
			return orderState.배송준비중;
		else if(name.equals("배송중"))
			return orderState.배송중;
		else if(name.equals("배송완료"))
			return orderState.배송완료;
		else
			throw new IllegalArgumentException();
	}
}
