package org.jsp.mini.vo;

public class Reply			//댓글
{
	public String num;		//댓글번호
	public String id;		//작성자 아이디
	public String date;		//작성일
	public String like;		//좋아요
	public String dislike;	//싫어요
	
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
	public String getDate()
	{
		return date;
	}
	public void setDate(String date)
	{
		this.date = date;
	}
	public String getLike()
	{
		return like;
	}
	public void setLike(String like)
	{
		this.like = like;
	}
	public String getDislike()
	{
		return dislike;
	}
	public void setDislike(String dislike)
	{
		this.dislike = dislike;
	}
	
	public Reply() {}
	public Reply(String num, String id, String date, String like, String dislike)
	{
		super();
		this.num = num;
		this.id = id;
		this.date = date;
		this.like = like;
		this.dislike = dislike;
	}
	
	@Override
	public String toString()
	{
		return "Reply [num=" + num + ", id=" + id + ", date=" + date + ", like=" + like + ", dislike=" + dislike + "]";
	}
}
