package face.api;

import java.nio.charset.Charset;
import java.util.List;

import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;
import org.stevenLiu.face.bean.FaceGroup;
import org.stevenLiu.face.bean.Faceset;

import com.alibaba.fastjson.JSON;
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
public class Info
{

	private HttpRequests httpRequests = null;
	JSONObject result = null;

	@Before
	public void before()
	{
		httpRequests = new HttpRequests("95ff7f00afe747e682b534a6c88c8918", "rOPpyMUf7oQSWJl4S4fJi-bFtvB08wQ_", true,
				true);
		JSONObject result = null;
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
	public void info_get_app()
	{

		try
		{
			System.out.println("\ninfo/get_app");
			System.out.println(httpRequests.infoGetApp());
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	@Test
	public void info_get_face()
	{

		try
		{
			//info/get_face
			System.out.println("\ninfo/get_app");
			System.out.println(httpRequests.infoGetFace(new PostParameters().setFaceId(
					result.getJSONArray("face").getJSONObject(0).getString("face_id"))));
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	@Test
	public void info_get_faceset_list()
	{

		try
		{
			//info/get_face
			JSONObject infoGetFacesetList = httpRequests.infoGetFacesetList();
			System.out.println(infoGetFacesetList);
			
			List<Faceset> parseArray = JSON.parseArray(infoGetFacesetList.getJSONArray("faceset").toString(), Faceset.class);
			System.out.println(parseArray);
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	@Test
	public void info_get_group_list()
	{

		try
		{
			System.out.println("\ninfo/get_group_list");
			JSONObject infoGetGroupList = httpRequests.infoGetGroupList();
			System.out.println(infoGetGroupList);
			List<FaceGroup> parseArray = JSON.parseArray(infoGetGroupList.getJSONArray("group").toString(), FaceGroup.class);
			System.out.println(parseArray);
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	@Test
	public void info_get_image()
	{

		try
		{
			System.out.println("\ninfo/get_image");
			System.out.println(httpRequests.infoGetImage(new PostParameters().setImgId(
					result.getString("img_id"))));
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	@Test
	public void info_get_person_list()
	{

		try
		{
			//info/get_person_list
			System.out.println("\ninfo/get_person_list");
			System.out.println(httpRequests.infoGetPersonList());
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	@Test
	public void info_get_quota()
	{

		try
		{
			System.out.println("\ninfo/get_quota");
			System.out.println(httpRequests.infoGetQuota());
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	@Test
	public void info_get_session()
	{

		try
		{
			System.out.println("\ninfo/get_session");
			System.out.println(httpRequests.infoGetSession(new PostParameters().setSessionId(
					result.getString("session_id"))));
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	@Test
	public void info_()
	{

		try
		{
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	


}
