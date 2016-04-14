package cn.usc.face.controller;


import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public abstract class BaseController
{
	protected JSONObject json =null;  
	protected Gson gson =new GsonBuilder().setDateFormat(
			"yyyy-MM-dd HH:mm:ss").create();
	
	@InitBinder
	public void initBinder(WebDataBinder binder)
	{
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				dateFormat, true));
	}
	
	public void writeData(String message,HttpServletResponse response) throws Exception   
	{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(new String(message));
		out.flush();
		out.close();
	}
	
	
	public void writeDataJSONObject(JSONObject json,HttpServletResponse response) throws Exception   
	{
		response.setContentType("text/json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache"); // 取消浏览器缓存
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
		out.close();
	}
	
	
	
	
}
