package org.jsp.mini.vo;

public class Question			//질문
{
	public int num;				//질문글 번호
	public String id;			//작성자 아이디
	public String date;			//작성일
	public String category;		//카테고리
	public int ability;			//등록내공
	public String title;			//제목
	public String content;		//내용
	public int hits;				//조회수
	
	public int getNum()
	{
		return num;
	}
	public void setNum(int num)
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
	public String getDate()
	{
		return date;
	}
	public void setDate(String date)
	{
		this.date = date;
	}
	public String getCategory()
	{
		return category;
	}
	public void setCategory(String category)
	{
		this.category = category;
	}
	public int getAbility()
	{
		return ability;
	}
	public void setAbility(int ability)
	{
		this.ability = ability;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public int getHits()
	{
		return hits;
	}
	public void setHits(int hits)
	{
		this.hits = hits;
	}

	@Override
	public String toString()
	{
		return "Question [num=" + num + ", id=" + id + ", date=" + date + ", category=" + category + ", ability=" + ability + ", title=" + title + ", content=" + content + ", hits=" + hits + "]";
	}
}
