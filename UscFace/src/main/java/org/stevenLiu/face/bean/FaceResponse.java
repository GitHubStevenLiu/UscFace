package org.stevenLiu.face.bean;

import java.util.List;

/**
 * Created by MrFu on 15/12/16.
 */
public class FaceResponse {

	
	/*{
	 * 
	 * "face":[
	 * {
		 * "face_id":"86d30f0ceb72a9c18022bd4828ebd1b0",
		 * -----------
		 * "attribute":{
		 * "smiling":{"value":21.1957},
		 * "gender":{"confidence":99.3203,"value":"Male"},
		 * "race":{"confidence":99.7146,"value":"White"},
		 * "age":{"range":9,"value":20}
		 * },
		 * 
		 * -----------
		 * "position":{"nose":{"x":59.406,"y":46.78475},
		 * "center":{"x":59.333333,"y":46.25},
		 * "mouth_right":{"x":60.082167,"y":47.95525},
		 * "width":4.333333,"eye_right":{"x":60.2675,"y":44.91675},
		 * "eye_left":{"x":58.467667,"y":44.74875},"mouth_left":{"x":58.282,"y":47.859},
		 * "height":6.5},
		 * 
		 * "tag":""}
		 * 
		 * {"face_id":"cecfaf278f23a9f53e6021ad9f8ab625","attribute":{"smiling":{"value":10.5684},"gender":{"confidence":99.9661,"value":"Male"},"race":{"confidence":99.9053,"value":"White"},"age":{"range":7,"value":30}},"position":{"nose":{"x":45.502333,"y":43.26775},"center":{"x":45.666667,"y":43},"mouth_right":{"x":46.280667,"y":44.547},"width":4,"eye_right":{"x":46.5185,"y":41.40925},"eye_left":{"x":44.7975,"y":41.3235},"mouth_left":{"x":44.610667,"y":44.0875},"height":6},"tag":""}
		 * ],
	 * 
	 * -----------
	 * "response_code":200,"img_width":600,"img_height":400,
	 * "session_id":"07a8c28623784c799d188774e05220c3",
	 * "img_id":"cfa30d8f4955c4196afc9c78c8f5339a",
	 * "url":"http://cn.faceplusplus.com/wp-content/themes/faceplusplus/assets/img/demo/9.jpg"}
	 *{"x":59.333333,"y":46.25}*/

	public String img_id;
    public int img_height;
    public int img_width;
    public String session_id;
    public String url;
 

    public List<FaceEntity> face;

    public static class FaceEntity {


        public AttributeEntity attribute;
        public String face_id;

        public PositionEntity position;
        public String tag;

        public static class AttributeEntity {

            public AgeEntity age;

            public GenderEntity gender;

            public RaceEntity race;

            public SmilingEntity smiling;

            public static class AgeEntity {
                public int range;
                public int value;
            }

            public static class GenderEntity {
                public double confidence;
                public String value;
            }

            public static class RaceEntity {
                public double confidence;
                public String value;
            }

            public static class SmilingEntity {
                public double value;
            }
        }

        public static class PositionEntity {

            public CenterEntity center;

            public EyeLeftEntity eye_left;

            public EyeRightEntity eye_right;
            public double height;
            public MouthLeftEntity mouth_left;

            public MouthRightEntity mouth_right;

            public NoseEntity nose;
            public double width;

            public static class CenterEntity {
                public double x;
                public double y;
            }

            public static class EyeLeftEntity {
                public double x;
                public double y;
            }

            public static class EyeRightEntity {
                public double x;
                public double y;
            }

            public static class MouthLeftEntity {
                public double x;
                public double y;
            }

            public static class MouthRightEntity {
                public double x;
                public double y;
            }

            public static class NoseEntity {
                public double x;
                public double y;
            }
        }
    }
}
