package top.wcxlmgone.po;

import java.sql.Date;

public class Patient {
private Integer patient_id;
private String patient_name;
private Date patient_birth;
private String patient_gender;
private String patient_identity_id;
private String patient_phonenum;
private String patient_password;
public String getPatient_password() {
	return patient_password;
}
public void setPatient_password(String patient_password) {
	this.patient_password = patient_password;
}
public Integer getPatient_id() {
	return patient_id;
}
public void setPatient_id(Integer patient_id) {
	this.patient_id = patient_id;
}
public String getPatient_name() {
	return patient_name;
}
public void setPatient_name(String patient_name) {
	this.patient_name = patient_name;
}
public Date getPatient_birth() {
	return patient_birth;
}
public void setPatient_birth(Date patient_birth) {
	this.patient_birth = patient_birth;
}
public String getPatient_gender() {
	return patient_gender;
}
public void setPatient_gender(String patient_gender) {
	this.patient_gender = patient_gender;
}
public String getPatient_identity_id() {
	return patient_identity_id;
}
public void setPatient_identity_id(String patient_identity_id) {
	this.patient_identity_id = patient_identity_id;
}
public String getPatient_phonenum() {
	return patient_phonenum;
}
public void setPatient_phonenum(String patient_phonenum) {
	this.patient_phonenum = patient_phonenum;
}
@Override
public String toString() {
	return "Patient [patient_id=" + patient_id + ", patient_name=" + patient_name + ", patient_birth=" + patient_birth
			+ ", patient_gender=" + patient_gender + ", patient_identity_id=" + patient_identity_id
			+ ", patient_phonenum=" + patient_phonenum + ", patient_password=" + patient_password + "]";
}


}
