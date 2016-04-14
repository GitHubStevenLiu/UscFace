package org.stevenLiu.face.util;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.thoughtworks.xstream.XStream;

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
public class XmlUtil
{

	public static XStream xstream = new XStream();

	// ------xml------
	public static String objectToXml(Object object, String key, Class clazz)
	{
		xstream.alias(key, clazz);
		return xstream.toXML(object);
	}

	public static String objectToXml(Object object, Map<String, Class> map)
	{
		Class clazz;
		for (String key : map.keySet())
		{
			clazz = map.get(key);
			if (clazz != null)
			{
				// xstream.alias("xml", clazz);
				xstream.alias(key, clazz);// 把className替换成key
			}
		}
		return xstream.toXML(object);
	}

	public static Object xmlToObject(String xml, Class clazz)
	{
		if (clazz != null) // 微信公众平台开发的时候需要把更节点替换成xml ！！！！
		{
			xml = xml.replace("<xml>", "<" + clazz.getName() + ">");
			xml = xml.replace("</xml>", "</" + clazz.getName() + ">");
		}
		try
		{
			Object fromXML = xstream.fromXML(xml);
			return fromXML;
		} catch (Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}

	public static Object xmlToObject(InputStream xml, Class clazz)
	{

		BufferedReader bf;
		try
		{
			bf = new BufferedReader(new InputStreamReader(xml, "UTF-8"));
			// 最好在将字节流转换为字符流的时候 进行转码
			StringBuffer buffer = new StringBuffer();
			String line = "";
			while ((line = bf.readLine()) != null)
			{
				buffer.append(line);
			}
			return xmlToObject(buffer.toString(), clazz);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		return null;
	}

	// ------map------
	/**
	 * request.getInputStream()
	 * 
	 * @param input
	 * @return
	 */
	public static Map<String, Object> xmlToMap(InputStream input)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		try
		{
			SAXReader saxReader = new SAXReader();
			Document doc = saxReader.read(input);
			Element root = doc.getRootElement();
			@SuppressWarnings("unchecked")
			List<Element> elements = root.elements();
			for (Element element : elements)
			{
				map.put(element.getName(), element.getText());
			}
		} catch (DocumentException e)
		{
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return map;
	}

	public static void mapToBean(Map<String, Object> map, Object obj)
	{
		BeanInfo beanInfo = null;
		try
		{
			beanInfo = Introspector.getBeanInfo(obj.getClass());
		} catch (IntrospectionException e1)
		{
			e1.printStackTrace();
		}
		PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();

		for (PropertyDescriptor property : propertyDescriptors)
		{
			try
			{
				String key = property.getName();
				String key2 = key.substring(0, 1).toUpperCase() + key.substring(1); // 首字母大写
				// getAbcAbc() -> abcAbc（key） ->AbcAbc（key2） 避免类似微信开发 字段首字母大写的情况
				if (map.containsKey(key))
				{
					Object value = map.get(key);
					System.out.println("--------key " + key + "----map.keyValue--" + map.get(key));
					// 得到property对应的setter方法
					Method setter = property.getWriteMethod();
					setter.invoke(obj, value);
				} else if (map.containsKey(key2))
				{
					Object value = map.get(key2);
					System.out.println("--------key2 " + key2 + "----map.keyValue--" + map.get(key2));
					Method setter = property.getWriteMethod();
					setter.invoke(obj, value);
				}
			} catch (Exception e)
			{
				System.out.println("transMap2Bean Error " + e);
				continue;
			}
		}
		return;
	}

	// ------json------
	/**
	 * gson.toJson(object); gson.fromJson(new String(bs), User.class);
	 */
	public static Gson gson = new GsonBuilder().setPrettyPrinting().disableHtmlEscaping().create();

	public static Map jsonToMap(String s)
	{
		return JSONObject.fromObject(s);
	}

	public static Map jsonToMap(JSONObject json)
	{
		Map map = new HashMap();
		Iterator keys = json.keys();
		while (keys.hasNext())
		{
			String key = (String) keys.next();
			String value = json.get(key).toString();
			if (value.startsWith("{") && value.endsWith("}"))
			{
				map.put(key, jsonToMap(value));
			} else
			{
				map.put(key, value);
			}
		}
		return map;
	}

	public static String listToJson(List list)
	{
		return gson.toJson(list);
	}

	public static String objectToJson(Object obj)
	{
		return gson.toJson(obj);
	}

/*	public static void main(String[] args) 
	{
		String json = "{'firstName':'John','lastName':'Doe'}";

		Map jsonToMap = XmlUtil.jsonToMap(json);
		System.out.println(jsonToMap);
		System.out.println(jsonToMap.get("firstName"));
		
		//copy
		WeiXinUser weiXinUser = new WeiXinUser();
		weiXinUser.setId("123");
		weiXinUser.setSubscribe_time(123213);
		Wxuser wxuser = new Wxuser();
		try
		{
			copyProperties(weiXinUser, wxuser);
			System.out.println(weiXinUser);
			System.out.println(wxuser);
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		
		
	}*/

	// ------------------------------
	
	  public static void copyProperties(Object fromObject,Object toObject) throws Exception{
          /*分别获得源对象和目标对象的Class类型对象,Class对象是整个反射机制的源头和灵魂！
            Class对象是在类加载的时候产生,保存着类的相关属性，构造器，方法等信息
          */
          Class sourceClz = fromObject.getClass();
          Class targetClz = toObject.getClass();
          //得到Class对象所表征的类的所有属性(包括私有属性)
          Field[] fields = sourceClz.getDeclaredFields();
          for (int i = 0; i < fields.length; i++) {
                 String fieldName = fields[i].getName();
                 Field targetField  = null;
                 try {
                        //得到targetClz对象所表征的类的名为fieldName的属性，不存在就进入下次循环
                         targetField = targetClz.getDeclaredField(fieldName);
                 } catch (SecurityException e) {
                        e.printStackTrace();
                        break;
                 } catch (NoSuchFieldException e) {
                        continue;
                 }
                 //判断sourceClz字段类型和targetClz同名字段类型是否相同
                 if(fields[i].getType()==targetField.getType()){
                        //由属性名字得到对应get和set方法的名字
                        String getMethodName = "get"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1);
                        String setMethodName = "set"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1);
                        //由方法的名字得到get和set方法的Method对象
                        Method getMethod;
                        try {
                               getMethod = sourceClz.getDeclaredMethod(getMethodName, new Class[]{});
                               Method setMethod = targetClz.getDeclaredMethod(setMethodName, fields[i].getType());
                               //调用source对象的getMethod方法
                               Object result = getMethod.invoke(fromObject, new Object[]{});
                               //调用target对象的setMethod方法
                               setMethod.invoke(toObject, result);
                        }  catch (Exception e) {
                              continue;
                        }
                 }else{
                        throw new Exception("同名属性类型不匹配！");
                 }
          }
   }


}
