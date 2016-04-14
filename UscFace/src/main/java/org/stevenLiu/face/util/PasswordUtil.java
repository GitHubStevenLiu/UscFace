package org.stevenLiu.face.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.UUID;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

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
public class PasswordUtil
{
	/**
	 * 加密 encodeBase64
	 * 
	 * @param str
	 * @return
	 */
	public static String strToBase64(String str)
	{
		byte[] b = null;
		String s = null;
		try
		{
			b = str.getBytes("utf-8");
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		if (b != null)
		{
			s = new BASE64Encoder().encode(b);
		}
		return s;
	}

	/**
	 * 解密 decodEncoderBase64
	 * 
	 * @param s
	 * @return
	 */
	public static String base64ToString(String s)
	{

		byte[] b = base64ToBytes(s);
		if (b != null)
			try
			{
				String result = new String(b, "utf-8");
				return result;
			} catch (UnsupportedEncodingException e)
			{
				e.printStackTrace();
			}
		return null;
	}

	/**
	 * 解密 decodEncoderBase64ToBtyes
	 * 
	 * @param s
	 * @return
	 */
	public static byte[] base64ToBytes(String s)
	{
		byte[] b = null;
		if (s != null && s.length() > 0)
		{
			System.out.println("内空大小:" + s.length());
			BASE64Decoder decoder = new BASE64Decoder();
			try
			{
				b = decoder.decodeBuffer(s);
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		return b;
	}

	// -----------base64--------------，md5-----
	/**
	 * 加密
	 */
	public static String strToMd5(String passWord) 
	{
		// 创建MD5加密对象
		MessageDigest md = null;
		try
		{
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e)
		{
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		// 调用它加密
		md.update(passWord.getBytes());
		// 获取加密后的
		byte[] arrs = md.digest();
		String res = "";
		for (int i = 0; i < arrs.length; i++)
		{
			int temp = arrs[i] & 0xff;
			if (temp <= 0xf)
			{
				res += "0";
			}
			res += Integer.toHexString(temp);
		}
		return res;
	}

	// ------md5---------------------sha1
	public static String strToSha1(String str)
	{
		if (str == null || str.length() == 0)
		{
			return null;
		}
		char[] hexDigits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'a', 'b', 'c', 'd', 'e', 'f' };
		try
		{
			MessageDigest mdTemp = MessageDigest.getInstance("SHA1");
			mdTemp.update(str.getBytes("UTF-8"));
			byte[] md = mdTemp.digest();
			int j = md.length;
			char buf[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++)
			{
				byte byte0 = md[i];
				buf[k++] = hexDigits[byte0 >>> 4 & 0xf];
				buf[k++] = hexDigits[byte0 & 0xf];
			}
			return new String(buf);
		} catch (Exception e)
		{
			return null;
		}
	}

	// ------------------UUID----------

	public static String getUUID() 
	{
		return UUID.randomUUID().toString();
	}

	// -----------------Sha1----------
	
	public static String getSha1(String str) 
	{
		if (str == null || str.length() == 0)
		{
			return null;
		}
		char[] hexDigits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
		try
		{
			MessageDigest mdTemp = MessageDigest.getInstance("SHA1");
			mdTemp.update(str.getBytes("UTF-8"));
			byte[] md = mdTemp.digest();
			int j = md.length;
			char buf[] = new char[j * 2];
			int k = 0;
			for (int i = 0; i < j; i++)
			{
				byte byte0 = md[i];
				buf[k++] = hexDigits[byte0 >>> 4 & 0xf];
				buf[k++] = hexDigits[byte0 & 0xf];
			}
			return new String(buf);
		} catch (Exception e)
		{
			return null;
		}
	}
	public static void main(String[] args)
	{
		//d93a5def7511da3d0f2d171d9c344e91
		System.out.println(strToEncrypt("123456"));
	}

	
	/**
	 * 加密
	 * @param passWord
	 * @return
	 */
	public static String strToEncrypt(String passWord) 
	{
		String sha1 = getSha1(passWord);
		String strToMd5 = strToMd5(sha1);
		return strToMd5;
	}
	
	
	
}
