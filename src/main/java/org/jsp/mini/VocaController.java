package org.jsp.mini;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.RowBounds;
import org.jsp.mini.dao.VoDAO;
import org.jsp.mini.vo.Category;
import org.jsp.mini.vo.Member;
import org.jsp.mini.vo.Voca;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/voca")
public class VocaController {
	
	private static final Logger logger = LoggerFactory.getLogger(VocaController.class);
	
	@Inject
	VoDAO voDao = new VoDAO();
	
	//번역하기
	@RequestMapping(value="/translate", method=RequestMethod.GET)
	public String goToTranslate() {
		return "voca/translate";
	}
	@ResponseBody
	@RequestMapping(value="/doTranslate", method=RequestMethod.GET)
    public String doTranslate(Model model, String inputText) {
		System.out.println("inputtext: " + inputText);
		
        String clientId = "lw9XkEdO7NOtchwowaOH"; //애플리케이션 클라이언트 아이디값";
        String clientSecret = "hpbhrPIo2b"; //애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(inputText, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            
            // post request
            String postParams = "source=ko&target=en&text=" + text;
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.writeBytes(postParams);
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            model.addAttribute("outputText", response.toString());
            
            return response.toString();
        }
        catch (Exception e) {
            System.out.println(e);
            return "voca/translate";
        }
    }
	
	//번역결과 저장
	@ResponseBody
	@RequestMapping(value="/doAddToNote", method=RequestMethod.POST)
	public int doAddToNote(Voca voca) {
		int result = 0;
		
		try {
			result = voDao.addToNote(voca);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}
	
	//내단어장
	@RequestMapping(value="/note", method=RequestMethod.GET)
	public String goToVocanote(HttpSession session, Model model, String page) {
		Member member = (Member) session.getAttribute("loginMember");
		
		int startPage = 1;
		int boardCount = 10;
		int offset = 0; 
		int boardCountSum = voDao.selectVocaCount(member.getId());
		System.out.println(boardCountSum);
		
		if (page != null) {
			startPage = Integer.parseInt(page);
		
			if (startPage <= 0) {
				startPage = 1; //아무리 prev 버튼을 눌러도 계속 첫 화면만 가져오게 된다. 근데 지금 안 먹힘.
			}
			
			if ((boardCountSum/boardCount) +1 < startPage) {
				startPage = (boardCountSum/boardCount) +1;
			}
		}
		offset = (boardCount * startPage) - boardCount;
		RowBounds rb = new RowBounds(offset, boardCount);
	
		// 상황 2. 요청한 페이지를 보여주는 경우
		
		//ArrayList<BoardVO> boardList = dao.selectBoardList(rb);
		ArrayList<Voca> vocaList = voDao.selectVocaList(member.getId(), rb);
		
		//model.addAttribute("boardList", boardList); //게시글 목록
		model.addAttribute("vocaList", vocaList);
		model.addAttribute("startPage", startPage); //현재 페이지
		model.addAttribute("boardCountSum", boardCountSum); //전체 게시글 수
		
		return "voca/note";
	}
	
	//단어검색
	@RequestMapping(value="/searchVoca", method=RequestMethod.GET)
	public String searchVoca(HttpSession session, Model model, String text) {
		System.out.println("searchVoca() 진입 - text: " + text);
		
		Member loginMember = (Member) session.getAttribute("loginMember");
		HashMap<String, String> map = new HashMap<>();
		map.put("id", loginMember.getId());
		map.put("text", text);
		
		ArrayList<Voca> searchVocaList = new ArrayList<>();
		try {
			searchVocaList = voDao.searchVoca(map);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		System.out.println("searchVocaList 들어오나?: " + searchVocaList);
		model.addAttribute("searchVocaList", searchVocaList);
		model.addAttribute("text", text);
		
		return "voca/searchVocaList";
	}
	
	//단어 수정 후 변경된 단어를 뿌리기 위해 하나만 검색
	@ResponseBody
	@RequestMapping(value="/getModifiedVoca", method=RequestMethod.GET)
	public Voca getModifiedVoca(int num) {
		System.out.println("num 들어오나?: " + num);
		
		Voca voca = null;
		
		try {
			voca = voDao.getModifiedVoca(num);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return voca;
	}
	
	//단어저장
	@ResponseBody
	@RequestMapping(value="/saveVoca", method=RequestMethod.POST)
	public int saveVoca(Voca voca) {
		System.out.println("voca 들어오나?: " + voca);
		
		int result = 0;
		try {
			result = voDao.saveVoca(voca);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return result;
	}
	
	//단어삭제
	@ResponseBody
	@RequestMapping(value="/deleteVoca", method=RequestMethod.POST)
	public int doDeleteVoca(int num) {
		int result = voDao.deleteVoca(num);
		
		return result;
	}
	
	//단어퀴즈
	@RequestMapping(value="/myStatic", method=RequestMethod.GET) 
	public String goToQuiz(HttpSession session, Model model) {
		
		return "voca/myStatic";
	}
	@ResponseBody //(ajax로 DB에 접근하여 아이디별 단어목록을 반환하는 함수)
	@RequestMapping(value="/getVocaList", method=RequestMethod.GET)
	public ArrayList<Voca> doGetVocaList(HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		ArrayList<Voca> vocaList = voDao.selectVocaList(loginMember.getId());
		System.out.println("vocaList 들어오나? 단어퀴즈 페이지: " + vocaList);
		
		return vocaList;
	}
	
	//아이디별 일주일치 통계
	@RequestMapping(value="/myChart", method=RequestMethod.GET)
	public String goToMyChart (HttpSession session, Model model) {
//		
//		//세션에서 사용자의 아이디를 구한다.
//		Member loginMember = (Member) session.getAttribute("loginMember");
//		String id = loginMember.getId();
//		
//		ArrayList<Voca> vocaList = voDao.getMyChart(id);
//		
//		System.out.println("vocaList 들어오나? " + vocaList);
//		
//		model.addAttribute("vocaList", vocaList);
		
		return "voca/myChart";
	}
	@ResponseBody
	@RequestMapping(value="/getMyChart", method=RequestMethod.GET)
	public ArrayList<Voca> getMyChart(HttpSession session) {
		
		//세션에서 사용자의 아이디를 구한다.
		Member loginMember = (Member) session.getAttribute("loginMember");
		String id = loginMember.getId();
		
		//아이디별 일주일치 단어목록을 구한다.
		ArrayList<Voca> vocaList = voDao.getMyChart(id);
		
		//오늘의 날짜를 구한다.
		Calendar c = Calendar.getInstance();
		int date = c.get(Calendar.DATE);
		
		
		//날짜별로 담을 리스트를 선언한다.
		ArrayList<Voca> weeklyList = new ArrayList<>();
		
		for (Voca voca : vocaList)
		{
		}
		
		return vocaList;
	}
	
	//새 카테고리 만들기
	@RequestMapping(value="/goToAddNewCategory", method=RequestMethod.GET)
	public String goToAddNewCategory() {
		return "voca/addNewCategory";
	}
	@ResponseBody
	@RequestMapping(value="/addNewCategory", method=RequestMethod.POST)
	public String addNewCategory(HttpSession session, String name) {
		System.out.println("name 들어오나?: " + name);
		
		//세션에서 아이디값 불러온다.
		Member loginMember = (Member) session.getAttribute("loginMember");
		String id = loginMember.getId();
		System.out.println("id 들어오나?: " + id);
		
		//아이디값과 카테고리 네임을 맵에 저장한다.
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("name", name);
		
		try {
			voDao.addNewCategory(map);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return "success";
	}
	@ResponseBody
	@RequestMapping(value="/categoryReload", method=RequestMethod.GET)
	public String categoryReload(HttpSession session, String id) {
		System.out.println("categoryReload 입장");
		//Member loginMember = (Member) session.getAttribute("lobinMember");
		ArrayList<Category> myCategory = voDao.selectCategoryById(id);
		System.out.println("categoryReload(): " + myCategory);
		session.setAttribute("myCategory", myCategory);
		
		return "success";
	}
	//카테고리별로 단어 뿌려주기
	@RequestMapping(value="/viewCategory", method=RequestMethod.GET)
	public String viewCategory(HttpSession session, Model model, String name) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		String id = loginMember.getId();
		
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("categoryName", name);
		
		ArrayList<Voca> vocaList = voDao.getVocaOfCategory(map);
		model.addAttribute("vocaList", vocaList);
		
		return "voca/viewCategory";
	}
	//퀴즈에서 틀린 단어는 복습할 수 있도록 toreview를 1로 설정
	@ResponseBody
	@RequestMapping(value="/checkToReview", method=RequestMethod.POST)
	public String checkToReview(String vonum) {
		logger.debug("voca 들어오나?: " + vonum);
		
		try {
			int num = Integer.parseInt(vonum);
			voDao.checkToReview(num);
		}
		catch (Exception e) {
			System.out.println(e);
		}
		
		return "success";
	}
	//복습할 단어만 다시 뽑기
	@ResponseBody
	@RequestMapping(value="/getVocaToReview", method=RequestMethod.GET)
	public String getVocaToReview (HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		ArrayList<Voca> vocaListToReview = voDao.getVocaToReview(loginMember.getId());
		
		//복습단어 목록 리턴해줘야함.
		logger.debug("vocaListToReview", vocaListToReview);
		
		return "success";
	}
}
