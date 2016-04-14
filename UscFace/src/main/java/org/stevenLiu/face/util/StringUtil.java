package org.stevenLiu.face.util;

import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/************************************************
 * @版权: Copyright (c) 2015-2016 www.shunyou.cn公司技术开发部
 * @创建人版本: Steven liu E-mail:465282857@qq.com
 * @版本: 1.0
 * @创建日期: 2016年3月10日 下午2:13:16
 * @类描述:
 * 
 * @修改记录:
 * @版本:
 ************************************************/
public class StringUtil
{
	/** 判断是否是合法手机 */
	public static boolean isPhone(String phone)
	{
		Pattern p = Pattern.compile("^((1[3-9]))\\d{9}$");
		Matcher m = p.matcher(phone);
		return m.matches();
	}

	/**
	 * <pre>
	 * StringUtils.isBlank(null)      = true
	 * StringUtils.isBlank("")        = true
	 * StringUtils.isBlank(" ")       = true
	 * StringUtils.isBlank("bob")     = false
	 * StringUtils.isBlank("  bob  ") = false
	 * </pre>
	 */
	public static boolean isBlank(String str)
	{
		int strLen;
		if (str == null || (strLen = str.length()) == 0)
		{
			return true;
		}
		for (int i = 0; i < strLen; i++)
		{
			if ((Character.isWhitespace(str.charAt(i)) == false))
			{
				return false;
			}
		}
		return true;
	}

	/** * 生成随机数 */
	public static String validateCode(int length)
	{
		Random random = new Random();
		String ssource = "0123456789";
		char[] sourceArr = ssource.toCharArray();
		char[] resultArr = new char[length];

		int index = 0;
		for (int i = 0; i < length; i++)
		{
			index = Math.abs(random.nextInt()) % sourceArr.length;
			resultArr[i] = sourceArr[index];
		}
		return new String(resultArr);
	}
}
