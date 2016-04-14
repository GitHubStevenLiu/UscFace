package cn.usc.face.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.usc.face.dao.mapper.FaceUscMapper;
import cn.usc.face.po.FaceUsc;
import cn.usc.face.po.FaceUscExample;
import cn.usc.face.po.FaceUscExample.Criteria;
import cn.usc.face.service.FaceService;

/************************************************
 * @版权: Copyright (c) 2015-2016 www.shunyou.cn公司技术开发部
 * @创建人版本: Steven liu E-mail:465282857@qq.com
 * @版本: 1.0
 * @创建日期: 2016年4月12日 下午2:24:25
 * @类描述:
 * 
 * @修改记录:
 * @版本:
 ************************************************/

@Service(value="faceService")
public class FaceServiceImpl implements FaceService
{
	@Resource
	FaceUscMapper faceUscMapper;

	public int insertSelective(FaceUsc record)
	{
		return faceUscMapper.insert(record);
	}

	public int deleteByPrimaryKey(String id)
	{
		return faceUscMapper.deleteByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(FaceUsc record)
	{
		return faceUscMapper.updateByPrimaryKeySelective(record);
	}

	public FaceUsc selectByPrimaryKey(String id)
	{
		return faceUscMapper.selectByPrimaryKey(id);
	}
	public void sss()
	{
		FaceUscExample example = new FaceUscExample();
		Criteria createCriteria = example.createCriteria();
		
		createCriteria.andIdEqualTo("xx");
		
		example.setOrderByClause(" id desc");
		
		faceUscMapper.selectByExample(example );
		
		
	}
}
