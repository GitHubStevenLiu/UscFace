package cn.usc.face.po;

import java.util.Date;

public class GroupPersonUsc {
    private String id;

    private String groupLocId;

    private String personLocId;

    private Date createTime;

    private Integer type;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getGroupLocId() {
        return groupLocId;
    }

    public void setGroupLocId(String groupLocId) {
        this.groupLocId = groupLocId == null ? null : groupLocId.trim();
    }

    public String getPersonLocId() {
        return personLocId;
    }

    public void setPersonLocId(String personLocId) {
        this.personLocId = personLocId == null ? null : personLocId.trim();
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
}