package org.jsp.mini.mapper;

import java.util.HashMap;

import org.jsp.mini.vo.Member;

public interface MemberMapper
{
	//회원가입
	public int insertMember(Member member);

	//아이디 중복확인
	public Member checkId(String id);
	
	//로그인
	public Member loginMember(HashMap<String, String> map);

	//정보수정
	public int updateMember(Member member);

	//회원탈퇴
	public int deleteMember(Member member);
	
	//로그아웃
	
}
