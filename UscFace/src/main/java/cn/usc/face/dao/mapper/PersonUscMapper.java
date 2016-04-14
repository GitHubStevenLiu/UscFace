package cn.usc.face.dao.mapper;

import cn.usc.face.po.PersonUsc;
import cn.usc.face.po.PersonUscExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PersonUscMapper {
    int countByExample(PersonUscExample example);

    int deleteByExample(PersonUscExample example);

    int deleteByPrimaryKey(String id);

    int insert(PersonUsc record);

    int insertSelective(PersonUsc record);

    List<PersonUsc> selectByExample(PersonUscExample example);

    PersonUsc selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") PersonUsc record, @Param("example") PersonUscExample example);

    int updateByExample(@Param("record") PersonUsc record, @Param("example") PersonUscExample example);

    int updateByPrimaryKeySelective(PersonUsc record);

    int updateByPrimaryKey(PersonUsc record);
}