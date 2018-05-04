package org.jsp.mini.vo;

import java.io.Serializable;

public class Category implements Serializable
{
	public int num;			
	public String name;			
	public String id;			
	public String date;			
	
	public int getNum()
	{
		return num;
	}
	public void setNum(int num)
	{
		this.num = num;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
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

	public Category() {}
	public Category(int num, int code, String name, String id, String date, String inputText, String outputText)
	{
		super();
		this.num = num;
		this.name = name;
		this.id = id;
		this.date = date;
	}
	
	@Override
	public String toString()
	{
		return "Category [num=" + num + ", name=" + name + ", id=" + id + ", date=" + date + "]";
	}
}
