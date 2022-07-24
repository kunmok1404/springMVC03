package kr.board.mvc01.controller;

import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	// 회원가입처리
	@PostMapping("/memRegister.do")
	public String memRegister(Member member, RedirectAttributes rttr, HttpSession session) {
		System.out.println(member);
		if(memberValid(member)) {
			rttr.addFlashAttribute("msgType", "fail");
			rttr.addFlashAttribute("msg", "필수 입력값을 확인해주세요.");
			return "redirect:/memJoin.do";
		}
		if(!member.getMemPassword1().equals(member.getMemPassword2())) {
			rttr.addFlashAttribute("msgType", "fail");
			rttr.addFlashAttribute("msg", "비밀번호가 서로 다릅니다.");
			return "redirect:/memJoin.do";
		}
		member.setMemPassword(member.getMemPassword1());
		member.setMemProfile("");
		// 회원가입처리
		int result = memberMapper.memberRegister(member);
		if(result > 0) {
			rttr.addFlashAttribute("msgType", "success");
			rttr.addFlashAttribute("msg", "회원가입이 완료되었습니다.");
			session.setAttribute("mvo", member);
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("msgType", "fail");
			rttr.addFlashAttribute("msg", "회원가입에 실패하였습니다.");
			return "redirect:/memJoin.do";
		}
		
	}
	
	// 로그아웃처리
	@GetMapping("/memLogout.do")
	public String memLogout(HttpSession httpSession) {
		httpSession.invalidate();
		return "redirect:/";
	}
	
	// 로그인화면 이동
	@GetMapping("/memLoginForm.do")
	public String memLoginForm() {
		return "member/login";
	}
	
	// 로그인처리
	@PostMapping("/memLogin.do")
	public String memLogin(Member member, RedirectAttributes rttr, HttpSession session) {
		if(member == null) {
			return "redirect:/";
		}
		if(member.getMemID() == null || member.getMemID().equals("") ||
		   member.getMemPassword() == null || "".equals(member.getMemPassword())){
			rttr.addFlashAttribute("msgType", "fail");
			rttr.addFlashAttribute("msg", "유저정보를 입력해주세요.");
			return "redirect:/memLoginForm.do";
		}
		Member memDto = memberMapper.chkLogin(member);
		if(memDto != null) {
			session.setAttribute("mvo", memDto);
			return "redirect:/";
		} else {
			rttr.addFlashAttribute("msgType", "fail");
			rttr.addFlashAttribute("msg", "아이디 혹은 비밀번호가 일치하지 않습니다.");
			return "redirect:/memLoginForm.do";
		}
	}
	
	private Boolean memberValid(Member member) {
		if(member.getMemID()== null || member.getMemID().equals("") ||
		   member.getMemPassword1()== null || member.getMemPassword1().equals("") ||
		   member.getMemPassword2()== null || member.getMemPassword2().equals("") ||	
		   member.getMemName()== null || member.getMemName().equals("") ||	
		   member.getMemAge()== 0 ||
		   member.getMemGender()== null || member.getMemGender().equals("") ||
		   member.getMemEmail()== null || member.getMemEmail().equals("")) {
		   return true;
		}
		return false;
	}
}
