package cn.usc.face.po;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class FaceUscExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public FaceUscExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(String value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(String value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(String value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(String value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(String value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(String value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLike(String value) {
            addCriterion("id like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotLike(String value) {
            addCriterion("id not like", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<String> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<String> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(String value1, String value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(String value1, String value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andFaceIdIsNull() {
            addCriterion("face_id is null");
            return (Criteria) this;
        }

        public Criteria andFaceIdIsNotNull() {
            addCriterion("face_id is not null");
            return (Criteria) this;
        }

        public Criteria andFaceIdEqualTo(String value) {
            addCriterion("face_id =", value, "faceId");
            return (Criteria) this;
        }

        public Criteria andFaceIdNotEqualTo(String value) {
            addCriterion("face_id <>", value, "faceId");
            return (Criteria) this;
        }

        public Criteria andFaceIdGreaterThan(String value) {
            addCriterion("face_id >", value, "faceId");
            return (Criteria) this;
        }

        public Criteria andFaceIdGreaterThanOrEqualTo(String value) {
            addCriterion("face_id >=", value, "faceId");
            return (Criteria) this;
        }

        public Criteria andFaceIdLessThan(String value) {
            addCriterion("face_id <", value, "faceId");
            return (Criteria) this;
        }

        public Criteria andFaceIdLessThanOrEqualTo(String value) {
            addCriterion("face_id <=", value, "faceId");
            return (Criteria) this;
        }

        public Criteria andFaceIdLike(String value) {
            addCriterion("face_id like", value, "faceId");
            return (Criteria) this;
        }

        public Criteria andFaceIdNotLike(String value) {
            addCriterion("face_id not like", value, "faceId");
            return (Criteria) this;
        }

        public Criteria andFaceIdIn(List<String> values) {
            addCriterion("face_id in", values, "faceId");
            return (Criteria) this;
        }

        public Criteria andFaceIdNotIn(List<String> values) {
            addCriterion("face_id not in", values, "faceId");
            return (Criteria) this;
        }

        public Criteria andFaceIdBetween(String value1, String value2) {
            addCriterion("face_id between", value1, value2, "faceId");
            return (Criteria) this;
        }

        public Criteria andFaceIdNotBetween(String value1, String value2) {
            addCriterion("face_id not between", value1, value2, "faceId");
            return (Criteria) this;
        }

        public Criteria andFaceNameIsNull() {
            addCriterion("face_name is null");
            return (Criteria) this;
        }

        public Criteria andFaceNameIsNotNull() {
            addCriterion("face_name is not null");
            return (Criteria) this;
        }

        public Criteria andFaceNameEqualTo(String value) {
            addCriterion("face_name =", value, "faceName");
            return (Criteria) this;
        }

        public Criteria andFaceNameNotEqualTo(String value) {
            addCriterion("face_name <>", value, "faceName");
            return (Criteria) this;
        }

        public Criteria andFaceNameGreaterThan(String value) {
            addCriterion("face_name >", value, "faceName");
            return (Criteria) this;
        }

        public Criteria andFaceNameGreaterThanOrEqualTo(String value) {
            addCriterion("face_name >=", value, "faceName");
            return (Criteria) this;
        }

        public Criteria andFaceNameLessThan(String value) {
            addCriterion("face_name <", value, "faceName");
            return (Criteria) this;
        }

        public Criteria andFaceNameLessThanOrEqualTo(String value) {
            addCriterion("face_name <=", value, "faceName");
            return (Criteria) this;
        }

        public Criteria andFaceNameLike(String value) {
            addCriterion("face_name like", value, "faceName");
            return (Criteria) this;
        }

        public Criteria andFaceNameNotLike(String value) {
            addCriterion("face_name not like", value, "faceName");
            return (Criteria) this;
        }

        public Criteria andFaceNameIn(List<String> values) {
            addCriterion("face_name in", values, "faceName");
            return (Criteria) this;
        }

        public Criteria andFaceNameNotIn(List<String> values) {
            addCriterion("face_name not in", values, "faceName");
            return (Criteria) this;
        }

        public Criteria andFaceNameBetween(String value1, String value2) {
            addCriterion("face_name between", value1, value2, "faceName");
            return (Criteria) this;
        }

        public Criteria andFaceNameNotBetween(String value1, String value2) {
            addCriterion("face_name not between", value1, value2, "faceName");
            return (Criteria) this;
        }

        public Criteria andTagIsNull() {
            addCriterion("tag is null");
            return (Criteria) this;
        }

        public Criteria andTagIsNotNull() {
            addCriterion("tag is not null");
            return (Criteria) this;
        }

        public Criteria andTagEqualTo(String value) {
            addCriterion("tag =", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagNotEqualTo(String value) {
            addCriterion("tag <>", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagGreaterThan(String value) {
            addCriterion("tag >", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagGreaterThanOrEqualTo(String value) {
            addCriterion("tag >=", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagLessThan(String value) {
            addCriterion("tag <", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagLessThanOrEqualTo(String value) {
            addCriterion("tag <=", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagLike(String value) {
            addCriterion("tag like", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagNotLike(String value) {
            addCriterion("tag not like", value, "tag");
            return (Criteria) this;
        }

        public Criteria andTagIn(List<String> values) {
            addCriterion("tag in", values, "tag");
            return (Criteria) this;
        }

        public Criteria andTagNotIn(List<String> values) {
            addCriterion("tag not in", values, "tag");
            return (Criteria) this;
        }

        public Criteria andTagBetween(String value1, String value2) {
            addCriterion("tag between", value1, value2, "tag");
            return (Criteria) this;
        }

        public Criteria andTagNotBetween(String value1, String value2) {
            addCriterion("tag not between", value1, value2, "tag");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andTypeIsNull() {
            addCriterion("type is null");
            return (Criteria) this;
        }

        public Criteria andTypeIsNotNull() {
            addCriterion("type is not null");
            return (Criteria) this;
        }

        public Criteria andTypeEqualTo(Integer value) {
            addCriterion("type =", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotEqualTo(Integer value) {
            addCriterion("type <>", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeGreaterThan(Integer value) {
            addCriterion("type >", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeGreaterThanOrEqualTo(Integer value) {
            addCriterion("type >=", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeLessThan(Integer value) {
            addCriterion("type <", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeLessThanOrEqualTo(Integer value) {
            addCriterion("type <=", value, "type");
            return (Criteria) this;
        }

        public Criteria andTypeIn(List<Integer> values) {
            addCriterion("type in", values, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotIn(List<Integer> values) {
            addCriterion("type not in", values, "type");
            return (Criteria) this;
        }

        public Criteria andTypeBetween(Integer value1, Integer value2) {
            addCriterion("type between", value1, value2, "type");
            return (Criteria) this;
        }

        public Criteria andTypeNotBetween(Integer value1, Integer value2) {
            addCriterion("type not between", value1, value2, "type");
            return (Criteria) this;
        }

        public Criteria andPreImgIsNull() {
            addCriterion("pre_img is null");
            return (Criteria) this;
        }

        public Criteria andPreImgIsNotNull() {
            addCriterion("pre_img is not null");
            return (Criteria) this;
        }

        public Criteria andPreImgEqualTo(String value) {
            addCriterion("pre_img =", value, "preImg");
            return (Criteria) this;
        }

        public Criteria andPreImgNotEqualTo(String value) {
            addCriterion("pre_img <>", value, "preImg");
            return (Criteria) this;
        }

        public Criteria andPreImgGreaterThan(String value) {
            addCriterion("pre_img >", value, "preImg");
            return (Criteria) this;
        }

        public Criteria andPreImgGreaterThanOrEqualTo(String value) {
            addCriterion("pre_img >=", value, "preImg");
            return (Criteria) this;
        }

        public Criteria andPreImgLessThan(String value) {
            addCriterion("pre_img <", value, "preImg");
            return (Criteria) this;
        }

        public Criteria andPreImgLessThanOrEqualTo(String value) {
            addCriterion("pre_img <=", value, "preImg");
            return (Criteria) this;
        }

        public Criteria andPreImgLike(String value) {
            addCriterion("pre_img like", value, "preImg");
            return (Criteria) this;
        }

        public Criteria andPreImgNotLike(String value) {
            addCriterion("pre_img not like", value, "preImg");
            return (Criteria) this;
        }

        public Criteria andPreImgIn(List<String> values) {
            addCriterion("pre_img in", values, "preImg");
            return (Criteria) this;
        }

        public Criteria andPreImgNotIn(List<String> values) {
            addCriterion("pre_img not in", values, "preImg");
            return (Criteria) this;
        }

        public Criteria andPreImgBetween(String value1, String value2) {
            addCriterion("pre_img between", value1, value2, "preImg");
            return (Criteria) this;
        }

        public Criteria andPreImgNotBetween(String value1, String value2) {
            addCriterion("pre_img not between", value1, value2, "preImg");
            return (Criteria) this;
        }

        public Criteria andPersonIdIsNull() {
            addCriterion("person_id is null");
            return (Criteria) this;
        }

        public Criteria andPersonIdIsNotNull() {
            addCriterion("person_id is not null");
            return (Criteria) this;
        }

        public Criteria andPersonIdEqualTo(String value) {
            addCriterion("person_id =", value, "personId");
            return (Criteria) this;
        }

        public Criteria andPersonIdNotEqualTo(String value) {
            addCriterion("person_id <>", value, "personId");
            return (Criteria) this;
        }

        public Criteria andPersonIdGreaterThan(String value) {
            addCriterion("person_id >", value, "personId");
            return (Criteria) this;
        }

        public Criteria andPersonIdGreaterThanOrEqualTo(String value) {
            addCriterion("person_id >=", value, "personId");
            return (Criteria) this;
        }

        public Criteria andPersonIdLessThan(String value) {
            addCriterion("person_id <", value, "personId");
            return (Criteria) this;
        }

        public Criteria andPersonIdLessThanOrEqualTo(String value) {
            addCriterion("person_id <=", value, "personId");
            return (Criteria) this;
        }

        public Criteria andPersonIdLike(String value) {
            addCriterion("person_id like", value, "personId");
            return (Criteria) this;
        }

        public Criteria andPersonIdNotLike(String value) {
            addCriterion("person_id not like", value, "personId");
            return (Criteria) this;
        }

        public Criteria andPersonIdIn(List<String> values) {
            addCriterion("person_id in", values, "personId");
            return (Criteria) this;
        }

        public Criteria andPersonIdNotIn(List<String> values) {
            addCriterion("person_id not in", values, "personId");
            return (Criteria) this;
        }

        public Criteria andPersonIdBetween(String value1, String value2) {
            addCriterion("person_id between", value1, value2, "personId");
            return (Criteria) this;
        }

        public Criteria andPersonIdNotBetween(String value1, String value2) {
            addCriterion("person_id not between", value1, value2, "personId");
            return (Criteria) this;
        }

        public Criteria andFacesetIdIsNull() {
            addCriterion("faceset_id is null");
            return (Criteria) this;
        }

        public Criteria andFacesetIdIsNotNull() {
            addCriterion("faceset_id is not null");
            return (Criteria) this;
        }

        public Criteria andFacesetIdEqualTo(String value) {
            addCriterion("faceset_id =", value, "facesetId");
            return (Criteria) this;
        }

        public Criteria andFacesetIdNotEqualTo(String value) {
            addCriterion("faceset_id <>", value, "facesetId");
            return (Criteria) this;
        }

        public Criteria andFacesetIdGreaterThan(String value) {
            addCriterion("faceset_id >", value, "facesetId");
            return (Criteria) this;
        }

        public Criteria andFacesetIdGreaterThanOrEqualTo(String value) {
            addCriterion("faceset_id >=", value, "facesetId");
            return (Criteria) this;
        }

        public Criteria andFacesetIdLessThan(String value) {
            addCriterion("faceset_id <", value, "facesetId");
            return (Criteria) this;
        }

        public Criteria andFacesetIdLessThanOrEqualTo(String value) {
            addCriterion("faceset_id <=", value, "facesetId");
            return (Criteria) this;
        }

        public Criteria andFacesetIdLike(String value) {
            addCriterion("faceset_id like", value, "facesetId");
            return (Criteria) this;
        }

        public Criteria andFacesetIdNotLike(String value) {
            addCriterion("faceset_id not like", value, "facesetId");
            return (Criteria) this;
        }

        public Criteria andFacesetIdIn(List<String> values) {
            addCriterion("faceset_id in", values, "facesetId");
            return (Criteria) this;
        }

        public Criteria andFacesetIdNotIn(List<String> values) {
            addCriterion("faceset_id not in", values, "facesetId");
            return (Criteria) this;
        }

        public Criteria andFacesetIdBetween(String value1, String value2) {
            addCriterion("faceset_id between", value1, value2, "facesetId");
            return (Criteria) this;
        }

        public Criteria andFacesetIdNotBetween(String value1, String value2) {
            addCriterion("faceset_id not between", value1, value2, "facesetId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}