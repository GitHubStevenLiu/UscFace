package cn.usc.face.dao.mapper;

import cn.usc.face.po.FaceUsc;
import cn.usc.face.po.FaceUscExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface FaceUscMapper {
    int countByExample(FaceUscExample example);

    int deleteByExample(FaceUscExample example);

    int deleteByPrimaryKey(String id);

    int insert(FaceUsc record);

    int insertSelective(FaceUsc record);

    List<FaceUsc> selectByExample(FaceUscExample example);

    FaceUsc selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") FaceUsc record, @Param("example") FaceUscExample example);

    int updateByExample(@Param("record") FaceUsc record, @Param("example") FaceUscExample example);

    int updateByPrimaryKeySelective(FaceUsc record);

    int updateByPrimaryKey(FaceUsc record);
}