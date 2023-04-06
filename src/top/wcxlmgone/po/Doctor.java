package top.wcxlmgone.po;

public class Doctor {
private int doctor_id;
private String doctor_name;
private String doctor_address;
private String doctor_award;
private String doctor_identity_id;
private int sub_id;
private String sub_name;
private int sec_id;
private String sec_name;
private String doctor_password;
private int doctor_position_id;	
private String position_name;
public int getDoctor_id() {
	return doctor_id;
}
public void setDoctor_id(int doctor_id) {
	this.doctor_id = doctor_id;
}
public String getDoctor_name() {
	return doctor_name;
}
public void setDoctor_name(String doctor_name) {
	this.doctor_name = doctor_name;
}
public String getDoctor_address() {
	return doctor_address;
}
public void setDoctor_address(String doctor_address) {
	this.doctor_address = doctor_address;
}
public String getDoctor_award() {
	return doctor_award;
}
public void setDoctor_award(String doctor_award) {
	this.doctor_award = doctor_award;
}
public String getDoctor_identity_id() {
	return doctor_identity_id;
}
public void setDoctor_identity_id(String doctor_identity_id) {
	this.doctor_identity_id = doctor_identity_id;
}
public int getSub_id() {
	return sub_id;
}
public void setSub_id(int sub_id) {
	this.sub_id = sub_id;
}
public int getSec_id() {
	return sec_id;
}
public void setSec_id(int sec_id) {
	this.sec_id = sec_id;
}
public String getDoctor_password() {
	return doctor_password;
}
public void setDoctor_password(String doctor_password) {
	this.doctor_password = doctor_password;
}
public int getDoctor_position_id() {
	return doctor_position_id;
}
public void setDoctor_position_id(int doctor_position_id) {
	this.doctor_position_id = doctor_position_id;
}

public String getSub_name() {
	return sub_name;
}
public void setSub_name(String sub_name) {
	this.sub_name = sub_name;
}
public String getSec_name() {
	return sec_name;
}
public void setSec_name(String sec_name) {
	this.sec_name = sec_name;
}
public String getPosition_name() {
	return position_name;
}
public void setPosition_name(String position_name) {
	this.position_name = position_name;
}
@Override
public String toString() {
	return "Doctor [doctor_id=" + doctor_id + ", doctor_name=" + doctor_name + ", doctor_address=" + doctor_address
			+ ", doctor_award=" + doctor_award + ", doctor_identity_id=" + doctor_identity_id + ", sub_id=" + sub_id
			+ ", sub_name=" + sub_name + ", sec_id=" + sec_id + ", sec_name=" + sec_name + ", doctor_password="
			+ doctor_password + ", doctor_position_id=" + doctor_position_id + ", position_name=" + position_name + "]";
}

}
