package com.icia.adaco.util.editor;

import java.beans.*;
import java.util.*;

public class AuthorityPropertyEditor extends PropertyEditorSupport {
	// ROLE_USER		{ROLE_USER}
	// ROLE_MANAGER		{ROLE_USER, ROLE_SELLER}
	// ROLE_ADMIN		{ROLE_USER, ROLE_SELLER, ROLE_ADMIN}
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		List<String> list = new ArrayList<>();
		if(text.equals("ROLE_USER")) {
			list.add("ROLE_USER");
		} else if(text.equals("ROLE_SELLER")) {
			list.add("ROLE_SELLER");
		} else if(text.equals("ROLE_ADMIN")) {
			list.add("ROLE_USER");
			list.add("ROLE_SELLER");
			list.add("ROLE_ADMIN");
		} else
			new IllegalArgumentException();
		System.out.println(list);
		setValue(list);
	}
	
}



