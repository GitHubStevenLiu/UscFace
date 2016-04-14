package service;

import java.io.File;
import java.nio.charset.Charset;

import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.stevenLiu.face.bean.FaceResponse;

import cn.usc.face.service.FaceService;
import cn.usc.face.service.FaceSetService;

import com.alibaba.fastjson.JSON;
import com.facepp.http.HttpRequests;
import com.facepp.http.PostParameters;

/************************************************
 * @版权: Copyright (c) 2015-2016 www.shunyou.cn公司技术开发部
 * @创建人版本: Steven liu E-mail:465282857@qq.com
 * @版本: 1.0
 * @创建日期: 2016年4月12日 下午4:05:33
 * @类描述:
 * 
 * @修改记录:
 * @版本:
 ************************************************/
public class TestFaceService
{

	FaceService faceService;
	FaceSetService faceSetService;
	

	
	@Before
	public void before()
	{
		ApplicationContext ctxApplicationContext = new ClassPathXmlApplicationContext(
				"classpath:/spring/applicationContext*.xml", "classpath:/mybatis/SqlMapConfig.xml");
		
		faceService = (FaceService) ctxApplicationContext.getBean("faceService");
		faceSetService = (FaceSetService) ctxApplicationContext.getBean("faceSetService");
		
		
		httpRequests = new HttpRequests("95ff7f00afe747e682b534a6c88c8918", "rOPpyMUf7oQSWJl4S4fJi-bFtvB08wQ_", true,
				true);
		System.out.println(Charset.forName("UTF-8").name());
		System.out.println("FacePlusPlus API Test:");
	}
	
	
	private HttpRequests httpRequests = null;
	JSONObject result = null;
	
	
	/**
	 * 检测人脸  添加到face数据库里面
	 */
	@Test
	public void detect()
	{
		File file = new File("./src/test/resources/rose.jpg");
		try
		{
			
			/*rose{"face":[{"face_id":"c5a595869c09a22abb89ea34aac90753",
			 * "attribute":{"smiling":{"value":99.1982},
			 * "gender":{"confidence":99.9832,"value":"Female"},
			 * "race":{"confidence":99.06819999999999,"value":"White"},
			 * "age":{"range":6,"value":22}},
			 * "position":{"nose":{"x":56.023958,"y":57.178182},
			 * "center":{"x":57.291667,"y":54.090909},"mouth_right":
			 * {"x":67.671354,"y":60.622727},"width":42.708333,"eye_right":
			 * {"x":65.503646,"y":45.109273},"eye_left":{"x":45.686667,"y":46.600909},
			 * "mouth_left":{"x":47.735,"y":62.100455},"height":37.272727},"tag":""}],
			 * "response_code":200,"img_width":192,"img_height":220,"session_id":"1bf37b96ac9f4c6c85cc39f6fdfb9935","img_id":"90c7d3faaffe10c306f66cfc5bc53750","url":null}
			90c7d3faaffe10c306f66cfc5bc53750*/
			result = httpRequests.detectionDetect(new PostParameters().setImg(file));
			System.out.println(result);
			System.out.println(result.getString("img_id"));

			if(result.getInt("response_code")==200)
			{
				FaceResponse tFaceResponse = JSON.parseObject(result.toString(), FaceResponse.class);
				System.out.println(tFaceResponse);
	
				
			}
			
			
		} catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	
	
	
	
}
