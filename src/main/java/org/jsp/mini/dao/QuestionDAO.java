package org.jsp.mini.dao;

import java.util.ArrayList;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.jsp.mini.mapper.QuestionMapper;
import org.jsp.mini.vo.Question;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDAO implements QuestionMapper
{
	@Inject
	SqlSession session;

	//질문글 게시판 글목록
	public ArrayList<Question> selectQuestionList(String category)
	{
		return session.getMapper(QuestionMapper.class).selectQuestionList(category);
	}

	//질문글 게시판 글쓰기
	public int insertQuestion(Question question)
	{
		return session.getMapper(QuestionMapper.class).insertQuestion(question);
	}
	
	//질문글 게시판 글읽기
	public Question selectQuestion(int num)
	{
		return session.getMapper(QuestionMapper.class).selectQuestion(num);
	}
	//질문글 게시판 글읽기 시 조회수 증가
	public int addHits(int num)
	{
		return session.getMapper(QuestionMapper.class).addHits(num);
	}
	//질문글 게시판 글수정	
	public Integer updateQuestion(Question question)
	{
		return session.getMapper(QuestionMapper.class).updateQuestion(question);
	}
	//질문글 게시판 글삭제
	public int deleteQuestion(int num)
	{
		return session.getMapper(QuestionMapper.class).deleteQuestion(num);
	}

	
}
