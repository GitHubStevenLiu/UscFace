package org.stevenLiu.face.util;

/************************************************
 * @版权: Copyright (c) 1998-2014 *********公司技术开发部 
 * @创建人版本: 刘洋 E-mail:465282857@qq.com
 * @版本: 1.0
 * @创建日期: 2015-8-7 上午10:09:22
 * @类描述:
 * 
 * @修改记录:
 * @版本:
 ************************************************/

import java.io.BufferedReader; 
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;

public class HttpUtil
{
	/**
	 * POST 方式请求服务器端数据
	 * 
	 * @param url
	 * @param params
	 * @return 以字节数组类型返回数据结果
	 * @throws IOException
	 */
	public static byte[] post(String url, HashMap<String, String> params) throws IOException
	{
		byte[] data = null;
		URL mUrl = new URL(url);
		HttpURLConnection conn = (HttpURLConnection) mUrl.openConnection();
		conn.setRequestMethod("POST");
		conn.setReadTimeout(5000);
		conn.setDoInput(true);
		conn.setDoOutput(true);
		byte[] content = getContent(params);
		// 设置请求头信息
		conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		// 计算数据字节
		conn.setRequestProperty("Content-Length", content.length + "");
		// 打字节输出流
		OutputStream out = conn.getOutputStream();
		out.write(content);
		out.flush();
		out.close();
		if (conn.getResponseCode() == 200)
		{
			// 解析输入流
			System.out.println("conn.getResponseCode() == 200");
			InputStream is = conn.getInputStream();
			data = StreamUtil.readInputStream(is);
		}
		return data;
	}

	private static byte[] getContent(HashMap<String, String> params) throws UnsupportedEncodingException
	{
		Set<Entry<String, String>> set = params.entrySet();
		StringBuilder builder = new StringBuilder();
		for (Entry<String, String> item : set)
		{
			builder.append(item.getKey()).append("=").append(URLEncoder.encode(item.getValue(), "UTF-8")).append("&");
		}
		String content = null;
		if (builder.length() > 0)
		{
			content = builder.substring(0, builder.length() - 1);
		}
		System.out.println("content:" + content);
		return content.getBytes();
	}

	/**
	 * 以POST 的方式请求服务器端的数据
	 * 
	 * @param url
	 * @param params
	 * @param charSet
	 * @return 以String 类型返回数据结果
	 * @throws IOException
	 */
	public static String post(String url, HashMap<String, String> params, String charSet) throws IOException
	{
		byte[] result = post(url, params);
		return new String(result, charSet);
	}

	/**
	 * GET 请求方式获取服务器端数据
	 * 
	 * @param url
	 * @return 返回byte 数组
	 * @throws IOException
	 */
	public static byte[] get(String url) throws IOException
	{
		byte[] data = null;
		URL mUrl = new URL(url);
		HttpURLConnection conn = (HttpURLConnection) mUrl.openConnection();
		conn.setRequestMethod("GET");
		conn.setReadTimeout(5000);
		if (conn.getResponseCode() == 200)
		{
			System.out.println("conn.getResponseCode() == 200");
			InputStream is = conn.getInputStream();
			data = StreamUtil.readInputStream(is);
		}
		return data;
	}

	/**
	 * GET 请求方式获取服务器端数据
	 * 
	 * @param url
	 * @param charSet
	 * @return 以String形式返回
	 * @throws IOException
	 */
	public static String get(String url, String charSet) throws IOException
	{
		byte[] data = get(url);
		return new String(data, charSet);
	}

	public static String httpPost(String url, ArrayList<NameValuePair> values)
	{
		try
		{
			HttpPost request = new HttpPost(url); // 根据内容来源地址创建一个Http请求

			request.setEntity(new UrlEncodedFormEntity(values, HTTP.UTF_8));
			HttpResponse httpResponse = new DefaultHttpClient().execute(request); // 发送请求并获取反馈

			int statusCode = httpResponse.getStatusLine().getStatusCode();
			if (statusCode != 404) // StatusCode为200表示与服务端连接成功，404为连接不成功

			{
				HttpEntity entity = httpResponse.getEntity();
				String string = EntityUtils.toString(entity);//
				return string;
			}
			System.out.println("状态码：" + statusCode);
		} catch (Exception e)
		{
			e.printStackTrace();
		}

		return "连接出错";
	}

	public static String httpPost(String url, String values)
	{
		try
		{
			HttpPost request = new HttpPost(url); // 根据内容来源地址创建一个Http请求

			request.setEntity(new StringEntity(values, "UTF-8"));
			HttpResponse httpResponse = new DefaultHttpClient().execute(request); // 发送请求并获取反馈

			int statusCode = httpResponse.getStatusLine().getStatusCode();
			if (statusCode != 404) // StatusCode为200表示与服务端连接成功，404为连接不成功
			{
				HttpEntity entity = httpResponse.getEntity();
				String string = EntityUtils.toString(entity);//
				return string;
			}
			System.out.println("状态码：" + statusCode);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		return "连接出错";
	}

	/**
	 * 文件上传
	 * 
	 * @param filePath
	 * @param accessToken
	 * @param type
	 * @return
	 * @throws IOException
	 * @throws NoSuchAlgorithmException
	 * @throws NoSuchProviderException
	 * @throws KeyManagementException
	 */
	public static String upload(String filePath, String url) throws Exception
	{
		File file = new File(filePath);
		if (!file.exists() || !file.isFile())
		{
			throw new IOException("文件不存在");
		}
		// String url = UPLOAD_URL.replace("ACCESS_TOKEN",
		// accessToken).replace("TYPE",type);
		URL urlObj = new URL(url);
		// 连接
		HttpURLConnection con = (HttpURLConnection) urlObj.openConnection();

		con.setRequestMethod("POST");
		con.setDoInput(true);
		con.setDoOutput(true);
		con.setUseCaches(false);

		// 设置请求头信息
		con.setRequestProperty("Connection", "Keep-Alive");
		con.setRequestProperty("Charset", "UTF-8");

		// 设置边界
		String BOUNDARY = "----------" + System.currentTimeMillis();
		con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + BOUNDARY);

		StringBuilder sb = new StringBuilder();
		sb.append("--");
		sb.append(BOUNDARY);
		sb.append("\r\n");
		sb.append("Content-Disposition: form-data;name=\"file\";filename=\"" + file.getName() + "\"\r\n");
		sb.append("Content-Type:application/octet-stream\r\n\r\n");

		byte[] head = sb.toString().getBytes("utf-8");

		// 获得输出流
		OutputStream out = new DataOutputStream(con.getOutputStream());
		// 输出表头
		out.write(head);

		// 文件正文部分
		// 把文件已流文件的方式 推入到url中
		DataInputStream in = new DataInputStream(new FileInputStream(file));
		int bytes = 0;
		byte[] bufferOut = new byte[1024];
		while ((bytes = in.read(bufferOut)) != -1)
		{
			out.write(bufferOut, 0, bytes);
		}
		in.close();

		// 结尾部分
		byte[] foot = ("\r\n--" + BOUNDARY + "--\r\n").getBytes("utf-8");// 定义最后数据分隔线

		out.write(foot);

		out.flush();
		out.close();

		StringBuffer buffer = new StringBuffer();
		BufferedReader reader = null;
		String result = null;
		try
		{
			// 定义BufferedReader输入流来读取URL的响应
			reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line = null;
			while ((line = reader.readLine()) != null)
			{
				buffer.append(line);
			}
			if (result == null)
			{
				result = buffer.toString();
			}
		} catch (IOException e)
		{
			e.printStackTrace();
		} finally
		{
			if (reader != null)
			{
				reader.close();
			}
		}

		return result;
	}

	
}
