package org.jsp.mini;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.ArrayList;
import java.util.HashMap;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.jsp.mini.dao.MemberDAO;
import org.jsp.mini.dao.VoDAO;
import org.jsp.mini.vo.Category;
import org.jsp.mini.vo.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/member")
public class MemberController
{
	@Inject
	MemberDAO mbDao = new MemberDAO();
	
	@Inject
	VoDAO voDao = new VoDAO();
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	//회원가입
	@RequestMapping(value="insertMember", method=RequestMethod.GET)
	public String goToInsertMember() {
		return "member/insertMember";
	}
	@RequestMapping(value="doInsertMember", method=RequestMethod.POST)
	public String doInsertMember(Member member) {
		logger.debug("doInsertMember() - member: " + member);
		
		mbDao.insertMember(member);
		
		return "redirect:../";
	}
	//아이디 중복확인
	@RequestMapping(value="checkId", method=RequestMethod.GET)
	public String goToCheckId() {
		logger.debug("goToCheckId()");
		
		return "member/checkId";
	}
	@ResponseBody
	@RequestMapping(value="doCheckId", method=RequestMethod.POST)
	public String doCheckId(String id) {
		logger.debug("doCheckId() - id: " + id);
		
		Member checkId = mbDao.checkId(id);
		
		if (checkId == null) {
			return "null";
		}
		else {
			return "notNull";
		}
	}
	
	//비번확인
	@RequestMapping(value="checkPw", method=RequestMethod.GET)
	public String goToCheckPw() {
		return "member/checkPw";
	}
	@RequestMapping(value="doCheckPw", method=RequestMethod.POST)
	public String doCheckPw(HttpSession session, String pw) {
		Member member = (Member) session.getAttribute("loginMember");
		Member loginedMember = mbDao.checkId(member.getId());
		if (pw.equals(loginedMember.getPw())) {
			return "same";
		}
		else {
			return "notSame";
		}
	}
	
	//정보수정
	@RequestMapping(value="updateMember", method=RequestMethod.GET)
	public String goToUpdateMember(HttpSession session, Model model) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		
		return "member/updateMember";
	}
	@RequestMapping(value="doUpdateMember", method=RequestMethod.POST)
	public String doUpdateMember(HttpSession session, Member member) {
		logger.debug("member 들어오나?: " + member);
		
		try {
			mbDao.updateMember(member);
			session.setAttribute("loginMember", member);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return "redirect:../";
	}
	
	
	//회원탈퇴
	@RequestMapping(value="deleteMember", method=RequestMethod.GET)
	public String goToDeleteMember() {
		return "member/deleteMember";
	}
	@RequestMapping(value="doDeleteMember", method=RequestMethod.POST)
	public String doDeleteMember(Member member) {
		try {
			mbDao.deleteMember(member);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return "redirect:../";
	}
	
	//로그인
	@RequestMapping(value="/loginMember", method=RequestMethod.GET)
	public String goToLoginMember() {
		return "member/loginMember";
	}
	@ResponseBody
	@RequestMapping(value="/doLoginMember", method=RequestMethod.POST)
	public String doLoginMember(HttpSession session, Model model, Member member) {
		HashMap<String, String> map = new HashMap<>();
		map.put("id", member.getId());
		map.put("pw", member.getPw());
		Member loginMember = mbDao.loginMember(map);
		
		logger.debug("doLoginMember() - loginMember: " + loginMember);
		
		//로그인에 성공하면
		if (loginMember != null) {
			//확인된 유저의 객체를 세션에 저장한다.
			session.setAttribute("loginMember", loginMember);
			return "../";
		}
		//로그인에 실패하면
		else {
			logger.debug("로그인 실패");
			session.setAttribute("loginMember", null);
			
			return "failure"; 
		}
	}
	
	//로그아웃
	@RequestMapping(value="/logoutMember", method=RequestMethod.GET)
	public String doLogoutMember(HttpSession session) {
		session.invalidate();
		
		return "redirect:../";
	}
	
	//회원탈퇴
	@RequestMapping(value="deleteMember", method=RequestMethod.POST)
	public String doDeleteMember(HttpSession session, Member member) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		try {
			mbDao.deleteMember(loginMember);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		session.invalidate();
		
		return "redirect:/";
	}
}
