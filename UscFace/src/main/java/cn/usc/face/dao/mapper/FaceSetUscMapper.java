package cn.usc.face.dao.mapper;

import cn.usc.face.po.FaceSetUsc;
import cn.usc.face.po.FaceSetUscExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FaceSetUscMapper {
    int countByExample(FaceSetUscExample example);

    int deleteByExample(FaceSetUscExample example);

    int deleteByPrimaryKey(String id);

    int insert(FaceSetUsc record);

    int insertSelective(FaceSetUsc record);

    List<FaceSetUsc> selectByExample(FaceSetUscExample example);

    FaceSetUsc selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") FaceSetUsc record, @Param("example") FaceSetUscExample example);

    int updateByExample(@Param("record") FaceSetUsc record, @Param("example") FaceSetUscExample example);

    int updateByPrimaryKeySelective(FaceSetUsc record);

    int updateByPrimaryKey(FaceSetUsc record);
}