package com.icia.adaco.util.websocket;

import java.util.*;

import org.springframework.stereotype.*;
import org.springframework.web.socket.*;

// 여러명의 WSUser 관리
@Component
public class WSUserService {
	private List<WSUser> list = new Vector<>();
	
	// 새로운 웹소켓 세션이 연결되면 기존 유저의 새로운 세션인지
	// 아니면 새로운 유저인지 판단
	public void add(WebSocketSession session) {
		System.out.println("웹 소켓 연결 : " + session.getId());
		String username = session.getPrincipal().getName();
		// WSUser에서 리스트에서 username을 찾는다
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getUsername().equals(username)) {
				// 찾았다 -> 기존 유저이므로 세션만 추가
				list.get(i).add(session);
				return;
			}
		}
		// 못찾았다 ->새로운 유저. WSUser를 추가
		WSUser user = new WSUser(username, session);
		list.add(user);
		System.out.println(list);
	}
	
	// 연결이 끊어진 경우 마지막 연결이 유저를 삭제, 아니면 세션 삭제
	public int delete(WebSocketSession session) {
		System.out.println("웹 소켓 연결 해제 : " + session.getId());
		String username = session.getPrincipal().getName();
		for(int i=0; i<list.size(); i++) {
			// WSUser를 찾았다
			if(list.get(i).getUsername().equals(username)) {
				// WSUser가 가진 세션이 마지막 세션이면 유저 자체 삭제
				if(list.get(i).getSessionCount()==1) {
					list.remove(i);
					return 1;
				} else 
					list.get(i).delete(session);
			}
		}
		return -1;
	}
	
	// 메시지 보내기 1: 보내는 사람, 받는 사람
	public void sendMsg(String sendId, String recipientId, String msg) {
		System.out.println("보내는 사람 : " + recipientId);
		System.out.println("list=="+list);
		for(WSUser user:list) {
			System.out.println("리스트에 저장된 유저 : " + user);
			if(user.getUsername().equals(recipientId)) {
				user.sendMessage(recipientId+"의 메시지:" + msg);
			}
		}
	}
	
	// 메시지 보내기 2: 모든 사람(broadcast)
	public void sendMsgAll(String sendId, String msg) {
		for(WSUser user:list) 
			user.sendMessage(sendId+"의 메시지:" + msg);
	}
}