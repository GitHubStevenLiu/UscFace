package cn.usc.face.po;

import java.util.Date;

public class FaceUsc {
    private String id;

    private String faceId;

    private String faceName;

    private String tag;

    private Date createTime;

    private Integer type;

    private String preImg;

    private String personId;

    private String facesetId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getFaceId() {
        return faceId;
    }

    public void setFaceId(String faceId) {
        this.faceId = faceId == null ? null : faceId.trim();
    }

    public String getFaceName() {
        return faceName;
    }

    public void setFaceName(String faceName) {
        this.faceName = faceName == null ? null : faceName.trim();
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag == null ? null : tag.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getPreImg() {
        return preImg;
    }

    public void setPreImg(String preImg) {
        this.preImg = preImg == null ? null : preImg.trim();
    }

    public String getPersonId() {
        return personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId == null ? null : personId.trim();
    }

    public String getFacesetId() {
        return facesetId;
    }

    public void setFacesetId(String facesetId) {
        this.facesetId = facesetId == null ? null : facesetId.trim();
    }
}