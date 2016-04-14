package face.api;

import java.io.File;
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
 * @创建日期: 2016年4月12日 上午10:43:05
 * @类描述:
 * 
 * @修改记录:
 * @版本:
 ************************************************/
public class TestFunc
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

	}
	@Test
	public void detect()
	{
		
		File file = new File("./src/test/resources/rose.jpg");
		
		try
		{
			result = httpRequests.detectionDetect(new PostParameters().setImg(file));
			System.out.println(result);
			System.out.println(result.getString("img_id"));
//			jack "face_id":"2de7e8d0923ca6f1475e41c5ca3f5538"
			//rose "face_id":"38fc902b9f451c6685531953aac4c29d"
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
