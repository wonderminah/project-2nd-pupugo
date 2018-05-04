package org.jsp.mini;

import javax.inject.Inject;
import org.jsp.mini.dao.AnswerDAO;
import org.jsp.mini.dao.QuestionDAO;
import org.jsp.mini.vo.Answer;
import org.jsp.mini.vo.Question;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/qna")
public class AnswerController
{
	@Inject
	AnswerDAO anDao = new AnswerDAO();
	
	@Inject
	QuestionDAO quDao = new QuestionDAO();
	
	//답변쓰기
	@RequestMapping(value="/insertAnswer", method=RequestMethod.GET)
	public String goToinsertAnswer(Model model, String category, int num) {
		Question question = quDao.selectQuestion(num);
		model.addAttribute("question", question);
		
		return "answer/insertAnswer";
	}
	@RequestMapping(value="/doInsertAnswer", method=RequestMethod.POST)
	public String doInsertAnswer(Answer answer) {
		anDao.insertAnswer(answer);
		
		return "redirect:selectQuestionList?category=" + answer.getCategory();
	}
}
