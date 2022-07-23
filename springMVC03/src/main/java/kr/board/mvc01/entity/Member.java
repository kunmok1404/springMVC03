package kr.board.mvc01.entity;

import lombok.Data;

@Data
public class Member {
	
	private Integer memIdx;
	private String memID;
	private String memPassword;
	private String memName;
	private Integer memAge;
	private String memGender;
	private String memEmail;
	private String memProfile;

}
