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
public class FaceSet
{

	private HttpRequests httpRequests = null;
	JSONObject result = null;

	@Before
	public void before()
	{
		httpRequests = new HttpRequests("95ff7f00afe747e682b534a6c88c8918", "rOPpyMUf7oQSWJl4S4fJi-bFtvB08wQ_", true,
				true);
		System.out.println(Charset.forName("UTF-8").name());
		System.out.println("FacePlusPlus API Test:");

		try
		{
			result = httpRequests.detectionDetect(new PostParameters()
			.setUrl("http://img.bimg.126.net/photo/vrLdq4gK6HhjEAezC3dNmg==/4271664246562015485.jpg"));
			System.out.println(result);
			
			System.out.println(result.getString("img_id"));
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * 
{"face":[{"face_id":"fc7a7c7d62eac7f89c494b76dfea4c2f","attribute":
{"smiling":{"value":97.6655},"gender":{"confidence":99.951,"value":"Male"},
"race":{"confidence":99.7846,"value":"Asian"},"age":{"range":8,"value":28}},
"position":{"nose":{"x":48.630244,"y":47.323415},"center":{"x":49.390244,"y":46.219512},
"mouth_right":{"x":58.285854,"y":58.141463},"width":46.097561,"eye_right":{"x":59.425854,"y":37.582683},
"eye_left":{"x":38.632439,"y":37.703902},"mouth_left":{"x":37.413659,"y":57.59878},"height":46.097561},"tag":""}],
"response_code":200,"img_width":410,"img_height":410,"session_id":"0d7d0323c13f4c8b8a56b1df8cfd3d43",
"img_id":"b82db5ec45c164050e5ca981b6f8ccc6",
"url":"http://img.bimg.126.net/photo/vrLdq4gK6HhjEAezC3dNmg==/4271664246562015485.jpg"}
b82db5ec45c164050e5ca981b6f8ccc6
	 */
	

	@Test
	public void faseset_create()
	{

		try
		{
			//faceset/create
			System.out.println("\nfaceset/create");
			System.out.println(httpRequests.facesetCreate(new PostParameters().setFacesetName("faceset_"+7)));
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	@Test
	public void faseset_add_face()
	{
		try
		{
			//faceset/add_face
			System.out.println("\nfaceset/add_face");
			
//			"face_id":"2de7e8d0923ca6f1475e41c5ca3f5538"
			
			System.out.println(httpRequests.facesetAddFace(new PostParameters().setFacesetName("faceset_"+0).setFaceId("2de7e8d0923ca6f1475e41c5ca3f5538")  ));
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	@Test
	public void faseset_set_info()
	{

		try
		{
			//faceset/set_info
			System.out.println("\nfaceset/set_info");
			for (int i = 0; i < result.getJSONArray("face").length(); ++i) {
				new PostParameters().setFacesetName("faceset_"+i).setTag("中文 tag_"+i).getMultiPart().writeTo(System.out);
				System.out.println(httpRequests.facesetSetInfo(new PostParameters().setFacesetName("faceset_"+i).setTag("中文 tag_"+i)));
			}
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	@Test
	public void faseset_get_info()
	{

		try
		{
			//faceset/get_info
			System.out.println("\nfaceset/get_info");
			for (int i = 0; i < result.getJSONArray("face").length(); ++i)
				System.out.println(httpRequests.facesetGetInfo(new PostParameters().setFacesetName("faceset_"+i)));
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	@Test
	public void faseset_()
	{

		try
		{

		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

	@Test
	public void faseset_delete()
	{

		try
		{
			//faceset/delete
			System.out.println("\nfaceset/delete");
			System.out.println(httpRequests.facesetDelete(new PostParameters().setFacesetName("faceset_0")));
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}

}
