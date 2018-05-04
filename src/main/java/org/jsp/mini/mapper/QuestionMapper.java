package org.jsp.mini.mapper;

import java.util.ArrayList;

import org.jsp.mini.vo.Question;

public interface QuestionMapper
{
	//질문글 게시판 글목록
	ArrayList<Question> selectQuestionList(String category);

	//질문글 게시판 글쓰기
	public int insertQuestion(Question question);

	//질문글 게시판 글읽기
	public Question selectQuestion(int num);

	//질문글 게시판 글읽기 시 조회수 증가
	public int addHits(int num);
	
	//질문글 게시판 글수정
	public Integer updateQuestion(Question question);

	//질문글 게시판 글삭제
	public int deleteQuestion(int num);


	
}
