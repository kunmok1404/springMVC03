package kr.board.mvc01.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.board.mvc01.entity.Member;

@Mapper
public interface MemberMapper {

	public Member memRegisterChk(String memID);
}
