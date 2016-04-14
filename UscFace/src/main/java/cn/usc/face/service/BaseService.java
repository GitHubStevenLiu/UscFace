package cn.usc.face.service;





/************************************************
 * @版权: Copyright (c) 1998-2014 *********公司技术开发部
 * @创建人版本: 刘洋 E-mail:465282857@qq.com
 * @版本: 1.0
 * @创建日期: 2015-8-7 上午10:09:22
 * @类描述:
 * 
 * @修改记录:
 * @版本:
 ************************************************/
 public interface  BaseService<T>
{
	 /**
	  * 
	  * @param record
	  * @return
	  */
    int insertSelective(T record);
    //-----------------------------------
    /**
     * 
     * @param id
     * @return
     */
    int deleteByPrimaryKey(String id);
    //-----------------------------------
    /**
     * 
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(T record);
   //------------------------------------
    /**
     * 
     * @param id
     * @return
     */
    T selectByPrimaryKey(String id);
    

    
    
}
