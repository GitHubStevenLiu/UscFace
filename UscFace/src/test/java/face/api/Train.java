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
public class Train
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
	public void train_Identify()
	{

		try
		{
			JSONObject syncRet = null; 
			
			System.out.println("\ntrain/Identify");
			syncRet = httpRequests.trainIdentify(new PostParameters().setGroupName("group_0"));
			System.out.println(syncRet);
			System.out.println(httpRequests.getSessionSync(syncRet.getString("session_id")));
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	
	
	String person_name ="jack";
	String face_id ="38fc902b9f451c6685531953aac4c29d"; //rose
	
	@Test
	public void train_verify()
	{
		try
		{
			JSONObject syncRet = null; 
			System.out.println("\ntrain/verify");
			syncRet = httpRequests.trainVerify(new PostParameters().setPersonName(person_name));
			System.out.println(httpRequests.getSessionSync(syncRet.get("session_id").toString()));
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	@Test
	public void recognition_identify()
	{

		try
		{
			//identify  一个group中找
			System.out.println("\nrecognition/identify");
			System.out.println(httpRequests.recognitionIdentify(
					new PostParameters().setGroupName("group_0")
					.setKeyFaceId(face_id)));
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	@Test
	public void recognition_verify()
	{

		try
		{
			//recognition/verify   
			System.out.println("\nrecognition/verify");
			System.out.println(httpRequests.recognitionVerify
					(new PostParameters().setPersonName(person_name).setFaceId(
							face_id)));
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	@Test
	public void recognition_()
	{

		try
		{
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	


}
