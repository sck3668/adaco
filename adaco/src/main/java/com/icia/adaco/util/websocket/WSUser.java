package com.icia.adaco.util.websocket;

import java.io.*;
import java.util.*;

import org.springframework.web.socket.*;

import lombok.*;
import lombok.extern.slf4j.*;

// 웹 소켓 세션은 0부터 1씩 증가하는 일련번호
// 웹 소켓은 하나의 페이지와 연결되며 페이지를 닫으면 끊어진다
// 한명의 사용자가 여러개의 웹소켓 세션을 가진다
@Slf4j
@Data
public class WSUser {
	private String username;
	
	// 동시작업을 하면 A작업을 하다가 도중에 중단하고 B작업을 한다
	// 작업 중에 일단 시작했으면 끝까지 가야하는 경우
	// ArrayList : 작업을 도중에 중단할 수 있다
	// Vector : 작업이 도중에 중단되지 않는다
	private List<WebSocketSession> list = new Vector<>();
	
	public WSUser(String username, WebSocketSession session) {
		this.username = username;
		list.add(session);
	}
	
	public void add(WebSocketSession session) {
		System.out.println("추가 : " + session);
		list.add(session);
	}
	
	public void delete(WebSocketSession session) {
		list.remove(session);
	}
	
	public void sendMessage(String msg) {
		// 웹소켓이 주고받는 텍스트 형식으로 변환
		TextMessage message = new TextMessage(msg);
		for(WebSocketSession session:list) {
			try {
				session.sendMessage(message);
			} catch (IOException e) {
				log.warn("{}", e.getMessage());
			}
		}
	}
	
	public int getSessionCount() {
		return list.size();
	}
}