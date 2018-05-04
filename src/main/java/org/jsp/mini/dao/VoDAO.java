package org.jsp.mini.dao;

import java.util.ArrayList;
import java.util.HashMap;
import javax.inject.Inject;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.jsp.mini.mapper.VocaMapper;
import org.jsp.mini.vo.Category;
import org.jsp.mini.vo.Voca;
import org.springframework.stereotype.Repository;

@Repository
public class VoDAO implements VocaMapper
{
	@Inject
	SqlSession session;
	
	//카테고리 목록을 사이드메뉴로 불러오기
	@Override
	public ArrayList<Category> selectCategoryById(String id)
	{
		return session.getMapper(VocaMapper.class).selectCategoryById(id);
	}
	//번역결과 저장
	@Override
	public int addToNote(Voca voca)
	{
		return session.getMapper(VocaMapper.class).addToNote(voca);
	}
	@Override
	//단어장 목록 개수 구하기
	public int selectVocaCount(String id)
	{
		return session.getMapper(VocaMapper.class).selectVocaCount(id);
	}
	@Override
	//단어장 목록 가져오기
	public ArrayList<Voca> selectVocaList(String id, RowBounds rb)
	{
		return session.getMapper(VocaMapper.class).selectVocaList(id, rb);
	}
	//단어검색
	@Override
	public ArrayList<Voca> searchVoca(HashMap<String, String> map)
	{
		System.out.println("map들어오나: " + map);
		return session.getMapper(VocaMapper.class).searchVoca(map);
	}
	@Override
	//단어 수정 후 변경된 단어를 뿌리기 위해 하나만 검색
	public Voca getModifiedVoca(int num)
	{
		return session.getMapper(VocaMapper.class).getModifiedVoca(num);
	}
	@Override
	//단어삭제
	public int deleteVoca(int num)
	{
		return session.getMapper(VocaMapper.class).deleteVoca(num);
	}
	@Override
	//단어저장
	public int saveVoca(Voca voca)
	{
		return session.getMapper(VocaMapper.class).saveVoca(voca);
	}
	//아이디별 단어장 전체 불러오기
	public ArrayList<Voca> selectVocaList(String id)
	{
		return session.getMapper(VocaMapper.class).selectVocaList(id);
	}
	//아이디별 일주일 통계
	public ArrayList<Voca> getMyChart(String id)
	{
		return session.getMapper(VocaMapper.class).getMyChart(id);
	}
	//새 카테고리 만들기
	public int addNewCategory(HashMap<String, String> map)
	{
		return session.getMapper(VocaMapper.class).addNewCategory(map);
	}
	//카테고리별로 단어 뿌려주기
	public ArrayList<Voca> getVocaOfCategory(HashMap<String, String> map)
	{
		return session.getMapper(VocaMapper.class).getVocaOfCategory(map);
	}
	//퀴즈에서 틀린 단어는 복습할 수 있도록 toreview를 1로 설정
	public int checkToReview(int num)
	{
		return session.getMapper(VocaMapper.class).checkToReview(num);
	}
	//복습할 단어만 다시 뽑기
	public ArrayList<Voca> getVocaToReview(String id)
	{
		return session.getMapper(VocaMapper.class).getVocaToReview(id);
	}
}
