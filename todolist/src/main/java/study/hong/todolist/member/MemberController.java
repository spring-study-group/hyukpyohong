package study.hong.todolist.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@Autowired
	IMemberService memberService;

	@RequestMapping(value = "/login")
	public String login(MemberDto dto) {
		if (memberService.login()) {
			return null;
		} else {
			return null;
		}
	}

	@RequestMapping(value = "/register")
	public String register(MemberDto dto) {
		if (memberService.register()) {
			return null;
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/loginCheck")
	public String loginCheck(MemberDto dto) {
		if (memberService.loginCheck()) {
			return null;
		} else {
			return null;
		}
	}
	
	@RequestMapping(value = "/idCheck")
	public String idCheck(MemberDto dto) {
		if (memberService.idCheck()) {
			return null;
		} else {
			return null;
		}
	}
	
}
