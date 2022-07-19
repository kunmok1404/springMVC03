package kr.board.mvc01.controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.board.mvc01.entity.Member;
import kr.board.mvc01.mapper.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper memberMapper;

	@GetMapping("/memJoin.do")
	public String memJoin() {
		return "member/join";
	}
	
	@ResponseBody
	@PostMapping("/memRegisterChk")
	public int memRegisterChk(@RequestBody Member member) {
		Member m = memberMapper.memRegisterChk(member.getMemID());
		return Objects.isNull(m) ? 1 : 0;
	}
}
