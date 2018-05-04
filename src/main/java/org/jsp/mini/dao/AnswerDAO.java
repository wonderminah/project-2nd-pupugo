package org.jsp.mini.dao;

import java.util.ArrayList;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.jsp.mini.mapper.AnswerMapper;
import org.jsp.mini.vo.Answer;
import org.springframework.stereotype.Repository;

@Repository
public class AnswerDAO implements AnswerMapper
{
	@Inject
	SqlSession session;

	//답변쓰기
	public int insertAnswer(Answer answer)
	{
		return session.getMapper(AnswerMapper.class).insertAnswer(answer);
	}
	//답변읽기
	public ArrayList<Answer> selectAnswerList(int num)
	{
		return session.getMapper(AnswerMapper.class).selectAnswerList(num);
	}
	
	
}
