package org.jsp.mini.vo;

public class Note			//쪽지
{
	public String num;		//기본 번호
	public String sendid;	//보낸사람 아이디
	public String recvid;	//받는사람 아이디
	public String date;		//보낸날짜
	public String title;		//제목
	public String content;	//내용
	
	public String getNum()
	{
		return num;
	}
	public void setNum(String num)
	{
		this.num = num;
	}
	public String getSendid()
	{
		return sendid;
	}
	public void setSendid(String sendid)
	{
		this.sendid = sendid;
	}
	public String getRecvid()
	{
		return recvid;
	}
	public void setRecvid(String recvid)
	{
		this.recvid = recvid;
	}
	public String getDate()
	{
		return date;
	}
	public void setDate(String date)
	{
		this.date = date;
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
	
	public Note() {}
	public Note(String num, String sendid, String recvid, String date, String title, String content)
	{
		super();
		this.num = num;
		this.sendid = sendid;
		this.recvid = recvid;
		this.date = date;
		this.title = title;
		this.content = content;
	}
	
	@Override
	public String toString()
	{
		return "Note [num=" + num + ", sendid=" + sendid + ", recvid=" + recvid + ", date=" + date + ", title=" + title + ", content=" + content + "]";
	}
}
