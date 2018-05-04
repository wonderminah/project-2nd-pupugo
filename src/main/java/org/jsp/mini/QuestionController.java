package org.jsp.mini;

import java.util.ArrayList;

import javax.inject.Inject;

import org.jsp.mini.dao.AnswerDAO;
import org.jsp.mini.dao.QuestionDAO;
import org.jsp.mini.vo.Answer;
import org.jsp.mini.vo.Question;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/qna")
public class QuestionController
{
	@Inject
	QuestionDAO quDao = new QuestionDAO();
	
	@Inject
	AnswerDAO auDao = new AnswerDAO();
	
	//질문글 게시판 글목록
	@RequestMapping(value="/selectQuestionList", method=RequestMethod.GET)
	public String goToSelectBoard(Model model, String category) {
		ArrayList<Question> boardList = quDao.selectQuestionList(category);
		model.addAttribute("boardList", boardList);
		
		return "question/selectQuestionList";
	}
	//질문글 게시판 글쓰기
	@RequestMapping(value="/insertQuestion", method=RequestMethod.GET)
	public String goToInsertQuestion() {
		return "question/insertQuestion";
	}
	@RequestMapping(value="/doInsertQuestion", method=RequestMethod.POST)
	public String doInsertQuestion(Question question) {
		quDao.insertQuestion(question);
		
		return "redirect:selectQuestionList?category=" + question.getCategory();
	}
	//질문글 게시판 글읽기
	@RequestMapping(value="/selectQuestion", method=RequestMethod.GET)
	public String doSelectQuestion(Model model, int num) {
		Question question = quDao.selectQuestion(num);
		model.addAttribute("question", question);
		
		quDao.addHits(num);
		
		ArrayList<Answer> answerList = auDao.selectAnswerList(num);
		model.addAttribute("answerList", answerList);
		
		return "question/selectQuestion";
	}
	//질문글 게시판 글수정
	@RequestMapping(value="/updateQuestion", method=RequestMethod.GET)
	public String goToUpdateQuestion(Model model, String category) {
		model.addAttribute("category", category);
		
		return "question/updateQuestion";
	}
	@RequestMapping(value="/doUpdateQuestion", method=RequestMethod.POST)
	public String doUpdateQuestion(Question question) {
		quDao.updateQuestion(question);
		
		return "redirect:selectQuestionList?category=" + question.getCategory();
	}
	//질문글 게시판 글삭제
	@RequestMapping(value="/deleteQuestion", method=RequestMethod.GET)
	public String doDeleteQuestion(String category, int num) {
		quDao.deleteQuestion(num);
		
		return "redirect:selectQuestionList?category=" + category; 
	}
}
