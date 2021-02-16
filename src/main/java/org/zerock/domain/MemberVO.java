package org.zerock.domain;

import java.util.Date;

import lombok.Data;



@Data
public class MemberVO {
	private String id;
	//회원 pw
	private String password;
	//회원 이름
	private String name;
	//회원 닉네임
	private String nickname;	
	//회원 전화번호
	private String phone;
	// 회원 이메일
	private String email;
	// 회원 가입일
	private Date regdate;

}
	
		
	
		
	
	
	
	
	
	

	

