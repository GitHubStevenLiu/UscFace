package cn.usc.face.dao.mapper;

import cn.usc.face.po.GroupPersonUsc;
import cn.usc.face.po.GroupPersonUscExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GroupPersonUscMapper {
    int countByExample(GroupPersonUscExample example);

    int deleteByExample(GroupPersonUscExample example);

    int deleteByPrimaryKey(String id);

    int insert(GroupPersonUsc record);

    int insertSelective(GroupPersonUsc record);

    List<GroupPersonUsc> selectByExample(GroupPersonUscExample example);

    GroupPersonUsc selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") GroupPersonUsc record, @Param("example") GroupPersonUscExample example);

    int updateByExample(@Param("record") GroupPersonUsc record, @Param("example") GroupPersonUscExample example);

    int updateByPrimaryKeySelective(GroupPersonUsc record);

    int updateByPrimaryKey(GroupPersonUsc record);
}