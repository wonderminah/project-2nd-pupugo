package org.jsp.mini.dao;

import java.util.HashMap;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.jsp.mini.mapper.MemberMapper;
import org.jsp.mini.vo.Member;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO implements MemberMapper
{
	@Inject
	SqlSession session;

	//회원가입
	@Override
	public int insertMember(Member member)
	{
		return session.getMapper(MemberMapper.class).insertMember(member);
	}

	//아이디 중복확인
	@Override
	public Member checkId(String id)
	{
		System.out.println("id 들어오나: " + id);
		Member member = session.getMapper(MemberMapper.class).checkId(id);
		System.out.println("디비에서 다오로 멤버 넘어오냐: " + member);
		return session.getMapper(MemberMapper.class).checkId(id);
	}
	
	//로그인
	@Override
	public Member loginMember(HashMap<String, String> map)
	{
		return session.getMapper(MemberMapper.class).loginMember(map);
	}
	
	//회원정보 수정
	@Override
	public int updateMember(Member member)
	{
		return session.getMapper(MemberMapper.class).updateMember(member);
	}

	//회원탈퇴
	public int deleteMember(Member member)
	{
		return session.getMapper(MemberMapper.class).deleteMember(member);
	}
}
