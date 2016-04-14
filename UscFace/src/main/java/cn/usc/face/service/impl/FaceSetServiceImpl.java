package cn.usc.face.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.usc.face.dao.mapper.FaceSetUscMapper;
import cn.usc.face.po.FaceSetUsc;
import cn.usc.face.service.FaceSetService;

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

@Service(value="faceSetService")
public class FaceSetServiceImpl implements FaceSetService
{
	@Resource
	FaceSetUscMapper faceSetUscMapper;

	public int insertSelective(FaceSetUsc record)
	{
		return faceSetUscMapper.insert(record);
	}

	public int deleteByPrimaryKey(String id)
	{
		return faceSetUscMapper.deleteByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(FaceSetUsc record)
	{
		return faceSetUscMapper.updateByPrimaryKeySelective(record);
	}

	public FaceSetUsc selectByPrimaryKey(String id)
	{
		return faceSetUscMapper.selectByPrimaryKey(id);
	}
}
