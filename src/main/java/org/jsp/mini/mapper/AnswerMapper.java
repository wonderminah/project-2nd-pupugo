package org.jsp.mini.mapper;

import java.util.ArrayList;

import org.jsp.mini.vo.Answer;

public interface AnswerMapper
{
	//답변쓰기
	public int insertAnswer(Answer answer);
	
	//답변읽기
	public ArrayList<Answer> selectAnswerList(int num);
	
}
