package face.api;

import java.nio.charset.Charset;
import java.util.ArrayList;

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
public class Group
{

	private HttpRequests httpRequests = null;
	JSONObject result = null;

	@Before
	public void before()
	{
		httpRequests = new HttpRequests("95ff7f00afe747e682b534a6c88c8918", "rOPpyMUf7oQSWJl4S4fJi-bFtvB08wQ_", true,
				true);
		result = null;
		System.out.println(Charset.forName("UTF-8").name());
		System.out.println("FacePlusPlus API Test:");

		try
		{
			result = httpRequests.detectionDetect(new PostParameters()
					.setUrl("http://img.bimg.126.net/photo/vrLdq4gK6HhjEAezC3dNmg==/4271664246562015485.jpg"));
			System.out.println(result);

		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	@Test
	public void group_create()
	{

		try
		{
			System.out.println("\ngroup/create");
			for (int i = 2; i < 10; i++)
			{
				JSONObject groupCreate = httpRequests.groupCreate(new PostParameters().setGroupName("group_"+i));
				System.out.println(groupCreate);
				
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	@Test
	public void group_add_person()
	{
		try
		{
			// group/add_person
			System.out.println("\ngroup/add_person");
			ArrayList<String> personList = new ArrayList<String>();
			personList.add("jack");

			JSONObject groupAddPerson = httpRequests.groupAddPerson(new PostParameters().setGroupName("group_0")
					.setPersonName(personList));
			System.out.println(groupAddPerson);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	@Test
	public void group_set_info()
	{

		try
		{
			// group/set_info
			System.out.println("\ngroup/set_info");
			System.out.println(httpRequests.groupSetInfo(new PostParameters().setGroupName("group_0").setTag(
					"group tag")));
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	@Test
	public void group_get_info()
	{

		try
		{
			// group/get_info
			System.out.println("\ngroup/get_info");
			System.out.println(httpRequests.groupGetInfo(new PostParameters().setGroupName("group_0")));

		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	@Test
	public void group_()
	{

		try
		{

		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	@Test
	public void group_delete()
	{

		try
		{
			//group/delete
			System.out.println("\ngroup/delete");
			System.out.println(httpRequests.groupDelete(new PostParameters().setGroupName("group_0")));
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
