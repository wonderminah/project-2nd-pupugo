package org.jsp.mini.vo;

public class Scrap			//좋아요한 답변
{
	public String num;		//기본 번호
	public String qu_num;	//원문 답변글 번호
	public String id;		//좋아요한 사람의 아이디
	
	public String getNum()
	
	{
		return num;
	}
	public void setNum(String num)
	{
		this.num = num;
	}
	public String getQu_num()
	{
		return qu_num;
	}
	public void setQu_num(String qu_num)
	{
		this.qu_num = qu_num;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	
	public Scrap() {}
	public Scrap(String num, String qu_num, String id)
	{
		super();
		this.num = num;
		this.qu_num = qu_num;
		this.id = id;
	}
	
	@Override
	public String toString()
	{
		return "Scrap [num=" + num + ", qu_num=" + qu_num + ", id=" + id + "]";
	}
}   