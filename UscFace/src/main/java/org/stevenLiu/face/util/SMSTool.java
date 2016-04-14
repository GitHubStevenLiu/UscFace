package org.stevenLiu.face.util;


import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class SMSTool {

	private static String BASEURL = "http://222.73.117.158/msg/HttpBatchSendSM";
	private static String ACCOUNT ="zssykj888";
	private static String PWD ="Adminsy888";
	private static String CONTENT = "是您本次身份效验码，5分钟有效，仅用于注册，请勿告知他人。【舜游科技】";
	private static String Getback_Password = "是您本次身份效验码，5分钟有效，仅用于找回密码，请勿告知他人。【舜游科技】";
	/**
	 * 发送验证码
	 * 
	 * @param telphone
	 * @param code
	 * @return
	 */
	public static String sendSMS(String telphone, String code,int type) {
		String flag = "0"; // "0":发送失败，"1":发送成功
		try {

			// 蓝讯科技start
			StringBuffer buffer = new StringBuffer(BASEURL);
			StringBuffer buffer2 = new StringBuffer();
			buffer2.append("account=" + ACCOUNT);
			buffer2.append("&pswd=" + PWD);
			buffer2.append("&mobile=" + telphone);
			buffer2.append("&msg=" + URLEncoder.encode(code, "utf-8"));
			
			if(type==1)
				buffer2.append(URLEncoder.encode(CONTENT, "utf-8"));
			else if(type ==2)
				buffer2.append(URLEncoder.encode(Getback_Password, "utf-8"));
			
			buffer2.append("&needstatus=true");

			URL url = new URL(buffer.toString());
			HttpURLConnection connection = (HttpURLConnection) url
					.openConnection();
			connection.setRequestMethod("POST");
			connection.setDoInput(true);
			connection.setDoOutput(true);
			OutputStreamWriter writer = new OutputStreamWriter(
					connection.getOutputStream());
			writer.write(buffer2.toString());
			writer.flush();
			InputStream in = connection.getInputStream();

			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			byte[] b = new byte[1024];
			int len = 0;
			while ((len = in.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			System.out.println("result.."
					+ URLDecoder.decode(baos.toString(), "UTF-8"));
			String resp = URLDecoder.decode(baos.toString(), "UTF-8");
			int m = resp.indexOf(",");
			if (0 == Integer.parseInt(resp.substring(m + 1, m + 2).trim())) {
				flag = "1";
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (ProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return flag;
	}
	public static void main(String[] args) {
		sendSMS("15813125374", "5689",1);
	}
}
