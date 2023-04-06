package top.wcxlmgone.po;
//由DoctorAndAppointInfo.java代替
public class MedicalCategory {
private Integer sub_id;
private String sub_name;
private Integer sec_id;
private String sec_name;
public Integer getSub_id() {
	return sub_id;
}
public void setSub_id(Integer sub_id) {
	this.sub_id = sub_id;
}
public String getSub_name() {
	return sub_name;
}
public void setSub_name(String sub_name) {
	this.sub_name = sub_name;
}
public Integer getSec_id() {
	return sec_id;
}
public void setSec_id(Integer sec_id) {
	this.sec_id = sec_id;
}
public String getSec_name() {
	return sec_name;
}
public void setSec_name(String sec_name) {
	this.sec_name = sec_name;
}
@Override
public String toString() {
	return "MedicalCategory [sub_id=" + sub_id + ", sub_name=" + sub_name + ", sec_id=" + sec_id + ", sec_name="
			+ sec_name + "]";
}
}
