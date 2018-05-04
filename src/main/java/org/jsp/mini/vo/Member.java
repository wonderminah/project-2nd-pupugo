package org.jsp.mini.vo;

public class Member			//회원
{
	public String num;		//회원번호
	public String id;		//아이디
	public String pw;		//비밀번호
	public String name;		//이름
	public String nick;		//닉네임
	public String gender;	//성별
	public String birth;		//생년월일
	public String ability;	//내공
	public String interest; 	//관심분야
	
	public String getNum()
	{
		return num;
	}
	public void setNum(String num)
	{
		this.num = num;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getPw()
	{
		return pw;
	}
	public void setPw(String pw)
	{
		this.pw = pw;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getNick()
	{
		return nick;
	}
	public void setNick(String nick)
	{
		this.nick = nick;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public String getBirth()
	{
		return birth;
	}
	public void setBirth(String birth)
	{
		this.birth = birth;
	}
	public String getAbility()
	{
		return ability;
	}
	public void setAbility(String ability)
	{
		this.ability = ability;
	}
	public String getInterest()
	{
		return interest;
	}
	public void setInterest(String interest)
	{
		this.interest = interest;
	}
	
	public Member() {}
	public Member(String num, String id, String pw, String name, String nick, String gender, String birth, String ability, String interest)
	{
		super();
		this.num = num;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nick = nick;
		this.gender = gender;
		this.birth = birth;
		this.ability = ability;
		this.interest = interest;
	}
	
	@Override
	public String toString()
	{
		return "Member [num=" + num + ", id=" + id + ", pw=" + pw + ", name=" + name + ", nick=" + nick + ", gender=" + gender + ", birth=" + birth + ", ability=" + ability + ", interest=" + interest + "]";
	}
}
