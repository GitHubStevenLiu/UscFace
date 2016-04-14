package face.api;

import java.nio.charset.Charset;

import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;

import com.facepp.http.HttpRequests;
import com.facepp.http.PostParameters;

/************************************************
 * @版权: Copyright (c) 2015-2016 www.shunyou.cn公司技术开发部
 * @创建人版本: Steven liu E-mail:465282857@qq.com
 * @版本: 1.0
 * @创建日期: 2016年4月11日 下午5:12:38
 * @类描述:
 * 
 * @修改记录:
 * @版本:
 ************************************************/
public class Person
{

	private HttpRequests httpRequests = null;
	JSONObject result = null;

	@Before
	public void before()   
	{
		 httpRequests  = new HttpRequests("95ff7f00afe747e682b534a6c88c8918",
				"rOPpyMUf7oQSWJl4S4fJi-bFtvB08wQ_", true, true);
		JSONObject result = null;
		System.out.println(Charset.forName("UTF-8").name());
		System.out.println("FacePlusPlus API Test:");
		
		try
		{
		result = httpRequests.detectionDetect(new PostParameters()
				.setUrl("http://img.bimg.126.net/photo/vrLdq4gK6HhjEAezC3dNmg==/4271664246562015485.jpg"));
		System.out.println(result);
		
		}  catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	
	
	String face_id="2de7e8d0923ca6f1475e41c5ca3f5538";
	String person_name="jack";
	
	@Test
	public void person_create()     
	{
		
		try
		{
			// person/create-----------------------------------
			System.out.println("\nperson/create");
			// {"response_code":200,"added_face":0,"added_group":0,
			// "person_name":"liu_0","tag":"","person_id":"a75b02d412e451bb0be74c850732e708"}
			//Person的Name 必须在App中全局唯一
			JSONObject personCreate = httpRequests.personCreate(new PostParameters().setPersonName(person_name));
			System.out.println(personCreate);
		}catch (Exception e)
		{
		} 
	}
	
	
	@Test
	public void person_add_face()     
	{
		try
		{
			// person/add_face-----------------------------------
			System.out.println("\nperson/add_face");
				//{"response_code":200,"added":1,"success":true}
			JSONObject personAddFace = httpRequests.personAddFace(new PostParameters().setPersonName(person_name)
					.setFaceId(face_id));
			System.out.println(personAddFace);

		}catch (Exception e)
		{
		} 
	}
	
	@Test
	public void person_set_info()    
	{
		
		try
		{
			// person/set_info-----------------------------------
			System.out.println("\nperson/set_info");
			for (int i = 0; i < result.getJSONArray("face").length(); ++i)
			{
				
				/*--ubYooJLQnqLrOG5aTcgUDTZ2kDqQABIJ
				Content-Disposition: form-data; name="person_name"
				Content-Type: text/plain; charset=UTF-8
				Content-Transfer-Encoding: 8bit*/
				new PostParameters().setPersonName("liu_" + i).setTag("中文 tag_" + i).getMultiPart().writeTo(System.out);
				
				//中文 tag_0
/*				--ubYooJLQnqLrOG5aTcgUDTZ2kDqQABIJ--
				{"response_code":200,"person_name":"liu_0","tag":"中文 tag_0","person_id":"a09a1f6a70bfcf6c43d3ca6754a80ee1"}
*/
				JSONObject personSetInfo = httpRequests.personSetInfo(new PostParameters().setPersonName("liu_" + i).setTag(
							"中文 tag_" + i));
				System.out.println(personSetInfo);
			}
		}catch (Exception e)
		{
		} 
	}
	
	@Test
	public void person_get_info()    
	{
		
		try
		{
			// person/get_info-----------------------------------
			System.out.println("\nperson/get_info");
			for (int i = 0; i < result.getJSONArray("face").length(); ++i)
			{
				/*{"face":[{"face_id":"24df2ffc55f383906b274793c8115aef","tag":""}],
				 * "response_code":200,
				 * "person_name":"liu_0",
				 * "tag":"中文 tag_0","group":[],
				 * "person_id":"a09a1f6a70bfcf6c43d3ca6754a80ee1"}*/
				JSONObject personGetInfo = httpRequests.personGetInfo(new PostParameters().setPersonName("liu_" + i));
				System.out.println(personGetInfo);
			}
		}catch (Exception e)
		{
		} 
	}
	
	@Test
	public void person_()    
	{
		
		try
		{
			
		}catch (Exception e)
		{
		} 
	}
	
	@Test
	public void person_delete()    
	{
		
		try
		{
			//person/delete
			System.out.println("\nperson/delete");
			System.out.println(httpRequests.personDelete(new PostParameters().setPersonName("person_0")));
			
		}catch (Exception e)
		{
		} 
	}
	
}
