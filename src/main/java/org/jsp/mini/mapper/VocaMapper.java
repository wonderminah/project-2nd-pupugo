package org.jsp.mini.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.session.RowBounds;
import org.jsp.mini.vo.Category;
import org.jsp.mini.vo.Voca;

public interface VocaMapper
{
	//카테고리 목록을 사이드메뉴로 불러오기
	public ArrayList<Category> selectCategoryById(String id);
	
	//번역결과 저장
	public int addToNote(Voca voca);

	//단어장 목록 개수 구하기
	public int selectVocaCount(String id);
	
	//단어장 목록 가져오기
	public ArrayList<Voca> selectVocaList(String id, RowBounds rb);

	//단어 검색
	public ArrayList<Voca> searchVoca(HashMap<String, String> map);
	
	//단어 수정 후 변경된 단어를 뿌리기 위해 하나만 검색
	public Voca getModifiedVoca(int num);
	
	//단어 삭제
	public int deleteVoca(int num);

	//단어 수정결과 저장
	public int saveVoca(Voca voca);

//	//전체인원 단어 수 통계
//	public int vocaCountOfAll(int yyyymmdd);
//	
//	//아이디별 단어 수 통계
//	public int vocaCountById(HashMap<String, String> map);
//
//	//아이디별 일주일치 단어 수 통계
//	public ArrayList<Todays> getTodays(HashMap<String, String> map);

	//아이디별 단어장 전체 불러오기
	public ArrayList<Voca> selectVocaList(String id);

	//아이디별 일주일 통계
	public ArrayList<Voca> getMyChart(String id);

	//새 카테고리 만들기
	public int addNewCategory(HashMap<String, String> map);

	//카테고리별로 단어 뿌려주기
	public ArrayList<Voca> getVocaOfCategory(HashMap<String, String> map);

	//퀴즈에서 틀린 단어는 복습할 수 있도록 toreview를 1로 설정
	public int checkToReview(int num);

	//복습할 단어만 다시 뽑기
	public ArrayList<Voca> getVocaToReview(String id);

	

	

	
	
}
