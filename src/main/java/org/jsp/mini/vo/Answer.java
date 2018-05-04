package org.jsp.mini.vo;

public class Answer			//답변
{
	public int num;			//답변번호
	public int qunum;		//원문 질문글 번호
	public String id;		//작성자 아이디
	public String date;		//작성일
	public String category;	//카테고리
	public String title;		//제목
	public String content;	//내용
	public int selected;		//채택여부 (0 또는 1)
	
	
	public int getNum()
	{
		return num;
	}
	public void setNum(int num)
	{
		this.num = num;
	}
	public int getqunum()
	{
		return qunum;
	}
	public void setqunum(int qunum)
	{
		this.qunum = qunum;
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
	public int getSelected()
	{
		return selected;
	}
	public void setSelected(int selected)
	{
		this.selected = selected;
	}
	
	public Answer() {}
	public Answer(int num, int qunum, String id, String date, String category, String title, String content, int selected)
	{
		super();
		this.num = num;
		this.qunum = qunum;
		this.id = id;
		this.date = date;
		this.category = category;
		this.title = title;
		this.content = content;
		this.selected = selected;
	}
	@Override
	public String toString()
	{
		return "Answer [num=" + num + ", qunum=" + qunum + ", id=" + id + ", date=" + date + ", category=" + category + ", title=" + title + ", content=" + content + ", selected=" + selected + "]";
	}
}
