package cn.usc.face.dao.mapper;

import cn.usc.face.po.GroupUsc;
import cn.usc.face.po.GroupUscExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface GroupUscMapper {
    int countByExample(GroupUscExample example);

    int deleteByExample(GroupUscExample example);

    int deleteByPrimaryKey(String id);

    int insert(GroupUsc record);

    int insertSelective(GroupUsc record);

    List<GroupUsc> selectByExample(GroupUscExample example);

    GroupUsc selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") GroupUsc record, @Param("example") GroupUscExample example);

    int updateByExample(@Param("record") GroupUsc record, @Param("example") GroupUscExample example);

    int updateByPrimaryKeySelective(GroupUsc record);

    int updateByPrimaryKey(GroupUsc record);
}