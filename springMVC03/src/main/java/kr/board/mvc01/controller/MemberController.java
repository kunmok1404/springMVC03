package kr.board.mvc01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

	@GetMapping("/memJoin.do")
	public String memJoin() {
		return "member/join";
	}
	
}
