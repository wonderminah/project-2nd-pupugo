package org.jsp.mini.vo;

public class Voca
{
	public int num;
	public String id;
	public String date;
	public String inputText;
	public String outputText;
	
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
	public String getInputText()
	{
		return inputText;
	}
	public void setInputText(String inputText)
	{
		this.inputText = inputText;
	}
	public String getOutputText()
	{
		return outputText;
	}
	public void setOutputText(String outputText)
	{
		this.outputText = outputText;
	}
	
	public Voca() {}
	public Voca(int num, String id, String date, String inputText, String outputText)
	{
		super();
		this.num = num;
		this.id = id;
		this.date = date;
		this.inputText = inputText;
		this.outputText = outputText;
	}
	
	@Override
	public String toString()
	{
		return "Voca [num=" + num + ", id=" + id + ", date=" + date + ", inputText=" + inputText + ", outputText=" + outputText + "]";
	}
}
