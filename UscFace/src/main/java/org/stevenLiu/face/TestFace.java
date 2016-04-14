package org.stevenLiu.face;

import java.nio.charset.Charset;
import java.util.ArrayList;

import org.json.JSONObject;
import org.junit.Before;
import org.junit.Test;
import org.stevenLiu.face.bean.FaceResponse;

import com.alibaba.fastjson.JSON;
import com.facepp.error.FaceppParseException;
import com.facepp.http.HttpRequests;
import com.facepp.http.PostParameters;


/************************************************
 * @版权: Copyright (c) 2015-2016 www.shunyou.cn公司技术开发部
 * @创建人版本: Steven liu E-mail:465282857@qq.com
 * @版本: 1.0
 * @创建日期: 2016年4月11日 上午10:21:47
 * @类描述:
 * 
 * @修改记录:
 * @版本:
 ************************************************/
public class TestFace
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

	
	@Test
	public void detect()    
	{
		try
		{
		// detection/detect
		result = httpRequests.detectionDetect(new PostParameters()
				.setUrl("http://img.bimg.126.net/photo/vrLdq4gK6HhjEAezC3dNmg==/4271664246562015485.jpg"));
		System.out.println(result);

		System.out.println(result.getJSONArray("face").length());

		FaceResponse tFaceResponse = JSON.parseObject(result.toString(), FaceResponse.class);

		System.out.println(tFaceResponse);
		
		} catch (FaceppParseException e)
		{
			e.printStackTrace();
		} catch (Exception e)
		{
		} finally
		{
			
		}
		
	}
	
	@Test
	public void person()    
	{
		try
		{
			// person/create-----------------------------------
			System.out.println("\nperson/create");
			for (int i = 0; i < result.getJSONArray("face").length(); ++i)
			{
				// {"response_code":200,"added_face":0,"added_group":0,
				// "person_name":"liu_0","tag":"","person_id":"a75b02d412e451bb0be74c850732e708"}
				//Person的Name 必须在App中全局唯一
				JSONObject personCreate = httpRequests.personCreate(new PostParameters().setPersonName("liu_" + i));
				System.out.println(personCreate);
			}

			/*
			 * new PostParameters().setPersonName("liu_" + 0)
			 * .setFaceId(result.getJSONArray
			 * ("face").getJSONObject(0).getString("face_id")).getMultiPart()
			 * .writeTo(System.out);
			 */

			// person/add_face-----------------------------------
			System.out.println("\nperson/add_face");
			for (int i = 0; i < result.getJSONArray("face").length(); ++i)
			{
				//{"response_code":200,"added":1,"success":true}
				JSONObject personAddFace = httpRequests.personAddFace(new PostParameters().setPersonName("liu_" + i)
						.setFaceId(result.getJSONArray("face").getJSONObject(i).getString("face_id")));
				System.out.println(personAddFace);

			}
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
		
		} catch (FaceppParseException e)
		{
			e.printStackTrace();
		} catch (Exception e)
		{
		} finally
		{
			
		}
	}
	
	@Test
	public void group()    
	{
		try
		{
			System.out.println("\ngroup/create");
			
			/*{"response_code":200,"group_id":"517e4ef4f1eb992c20777aa19d57ec63",
			 * "group_name":"group_0","added_person":0,"tag":""}*/
			JSONObject groupCreate = httpRequests.groupCreate(new PostParameters().setGroupName("group_0"));
			System.out.println(groupCreate);
			
			//group/add_person
			System.out.println("\ngroup/add_person");
			ArrayList<String> personList = new ArrayList<String>();
			for (int i = 0; i < result.getJSONArray("face").length(); ++i)
				personList.add("liu_"+i);
			
			//new PostParameters().setGroupName("group_0").setPersonName(personList).getMultiPart().writeTo(System.out);
			JSONObject groupAddPerson = httpRequests.groupAddPerson(new PostParameters().setGroupName("group_0").setPersonName(personList));
			System.out.println(groupAddPerson);
			
			//group/set_info
			System.out.println("\ngroup/set_info");
			System.out.println(httpRequests.groupSetInfo(new PostParameters().setGroupName("group_0").setTag("group tag")));
			
			//group/get_info
			System.out.println("\ngroup/get_info");
			System.out.println(httpRequests.groupGetInfo(new PostParameters().setGroupName("group_0")));
			
		
		} catch (FaceppParseException e)
		{
			e.printStackTrace();
		} catch (Exception e)
		{
		} finally
		{
			
		}
	}
	
	
	@Test
	public void faseset()    
	{
		try
		{
			//faceset/create
			System.out.println("\nfaceset/create");
			for (int i = 0; i < result.getJSONArray("face").length(); ++i)
				System.out.println(httpRequests.facesetCreate(new PostParameters().setFacesetName("faceset_"+i)));
			
			//faceset/add_face
			System.out.println("\nfaceset/add_face");
			for (int i = 0; i < result.getJSONArray("face").length(); ++i)
				System.out.println(httpRequests.facesetAddFace(new PostParameters().setFacesetName("faceset_"+i).setFaceId(
						result.getJSONArray("face").getJSONObject(i).getString("face_id"))));
			
			//faceset/set_info
			System.out.println("\nfaceset/set_info");
			for (int i = 0; i < result.getJSONArray("face").length(); ++i) {
				new PostParameters().setFacesetName("faceset_"+i).setTag("中文 tag_"+i).getMultiPart().writeTo(System.out);
				System.out.println(httpRequests.facesetSetInfo(new PostParameters().setFacesetName("faceset_"+i).setTag("中文 tag_"+i)));
			}
			
			//faceset/get_info
			System.out.println("\nfaceset/get_info");
			for (int i = 0; i < result.getJSONArray("face").length(); ++i)
				System.out.println(httpRequests.facesetGetInfo(new PostParameters().setFacesetName("faceset_"+i)));
			
		
		} catch (FaceppParseException e)
		{
			e.printStackTrace();
		} catch (Exception e)
		{
		} finally
		{
			
		}
	}
	
	@Test
	public void train()    
	{
		try
		{
			//recognition/train
			JSONObject syncRet = null; 
			
			System.out.println("\ntrain/Identify");
			syncRet = httpRequests.trainIdentify(new PostParameters().setGroupName("group_0"));
			System.out.println(syncRet);
			System.out.println(httpRequests.getSessionSync(syncRet.getString("session_id")));
			
			System.out.println("\ntrain/verify");
			for (int i = 0; i < result.getJSONArray("face").length(); ++i) {
				syncRet = httpRequests.trainVerify(new PostParameters().setPersonName("liu_" + i));
				System.out.println(httpRequests.getSessionSync(syncRet.get("session_id").toString()));
			}
			
			//-----------------Recognition-----------------
			//recognition/recognize   
			
			//identify  一个group中找
			System.out.println("\nrecognition/identify");
			System.out.println(httpRequests.recognitionIdentify(
					new PostParameters().setGroupName("group_0")
					.setUrl("http://cn.faceplusplus.com/wp-content/themes/faceplusplus/assets/img/demo/5.jpg")));
			
			//recognition/verify   
			System.out.println("\nrecognition/verify");
			System.out.println(
					httpRequests.recognitionVerify(new PostParameters().setPersonName("liu_0").setFaceId(
							result.getJSONArray("face").getJSONObject(0).getString("face_id"))));
			/*System.out.println(
					httpRequests.recognitionVerify(new PostParameters().setPersonName("liu_1").setFaceId(
							result.getJSONArray("face").getJSONObject(0).getString("face_id"))));*/
			
		
		} catch (FaceppParseException e)
		{
			e.printStackTrace();
		} catch (Exception e)
		{
		} finally
		{
			
		}
	}
	
	@Test
	public void info()    
	{
		try
		{
			//info/get_app
			System.out.println("\ninfo/get_app");
			System.out.println(httpRequests.infoGetApp());
			
			//info/get_face
			System.out.println("\ninfo/get_app");
			System.out.println(httpRequests.infoGetFace(new PostParameters().setFaceId(
					result.getJSONArray("face").getJSONObject(0).getString("face_id"))));
			
			//info/get_group_list
			System.out.println("\ninfo/get_group_list");
			System.out.println(httpRequests.infoGetGroupList());
			
			//info/get_image
			System.out.println("\ninfo/get_image");
			System.out.println(httpRequests.infoGetImage(new PostParameters().setImgId(
					result.getString("img_id"))));
			
			//info/get_person_list
			System.out.println("\ninfo/get_person_list");
			System.out.println(httpRequests.infoGetPersonList());
			
			//info/get_quota
			System.out.println("\ninfo/get_quota");
			System.out.println(httpRequests.infoGetQuota());
			
			//info/get_session
			System.out.println("\ninfo/get_session");
			System.out.println(httpRequests.infoGetSession(new PostParameters().setSessionId(
					result.getString("session_id"))));
			
		
		} catch (FaceppParseException e)
		{
			e.printStackTrace();
		} catch (Exception e)
		{
		} finally
		{
			
		}
	}
	
	
	@Test
	public void delete()    
	{
		try
		{
			System.out.println("\nperson/remove_face");
			System.out.println(httpRequests.personRemoveFace(
					new PostParameters().setPersonName("person_0").setFaceId(
							result.getJSONArray("face").getJSONObject(0).getString("face_id"))));
			
			//group/delete
			System.out.println("\ngroup/delete");
			System.out.println(httpRequests.groupDelete(new PostParameters().setGroupName("group_0")));
			
			//person/delete
			System.out.println("\nperson/delete");
			System.out.println(httpRequests.personDelete(new PostParameters().setPersonName("person_0")));
			
			//faceset/delete
			System.out.println("\nfaceset/delete");
			System.out.println(httpRequests.facesetDelete(new PostParameters().setFacesetName("faceset_0")));
			
		
		} catch (FaceppParseException e)
		{
			e.printStackTrace();
		} catch (Exception e)
		{
		} finally
		{
			
		}
	}
}
