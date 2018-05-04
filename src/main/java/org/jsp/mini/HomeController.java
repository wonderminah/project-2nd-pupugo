package org.jsp.mini;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.jsp.mini.dao.VoDAO;
import org.jsp.mini.vo.Category;
import org.jsp.mini.vo.Member;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController
{
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Inject
	VoDAO voDao = new VoDAO();
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home(HttpSession session, Locale locale, Model model) 
	{
		//기본
		logger.info("Welcome home! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		
		//사이드 메뉴에 사용자의 단어장 카테고리를 db에서 받아 세션에 저장한다.
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		if (loginMember != null) {
			ArrayList<Category> myCategory = voDao.selectCategoryById(loginMember.getId());
			System.out.println("myCategory 들어오나?: " + myCategory);
			session.setAttribute("myCategory", myCategory);
		}
		
		return "home";
	}
	@RequestMapping(value="/home2")
	public String home2() {
		return "home2";
	}
	@RequestMapping(value="/home3")
	public String home3() {
		return "home3";
	}
	@RequestMapping(value="/positioning")
	public String positioning() {
		return "positioning";
	}
	@RequestMapping(value="/googleMapAPI")
	public String goTogoogleMapAPI() {
		return "googleMapAPI";
	}
	@RequestMapping(value="/megamenu")
	public String goToMegamenu() {
		return "megamenu";
	}
	@RequestMapping(value="/audio")
	public String goToAudio() {
		return "audio";
	}
	@RequestMapping(value="/audiohtml")
	public String goToAudiohtml() {
		return "audiohtml";
	}
	@RequestMapping(value="/main")
	public String goToMain() {
		return "main";
	}
	@RequestMapping(value="/main2")
	public String goToMain2() {
		return "main2";
	}
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public String goToTest(HttpSession session, Model model) {
		return "test";
	}
}
