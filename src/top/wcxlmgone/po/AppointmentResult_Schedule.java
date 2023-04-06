package top.wcxlmgone.po;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class AppointmentResult_Schedule {
private Integer sche_doc_id;
private Integer appointment_id;
private Integer patient_id;
private String patient_age;
private String patient_name;
private String patient_gender;
private Integer doctor_id;
private String doctor_name;
private String appoint_result;
private Timestamp appointment_time;
private Integer date_id;
private Date data_name;
private Time startwork_time;
private Time endwork_time;
private Integer appoint_or_not;
private String sub_name;
private String sec_name;
public Integer getSche_doc_id() {
	return sche_doc_id;
}

public void setSche_doc_id(Integer sche_doc_id) {
	this.sche_doc_id = sche_doc_id;
}

public Integer getAppointment_id() {
	return appointment_id;
}

public void setAppointment_id(Integer appointment_id) {
	this.appointment_id = appointment_id;
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

public Integer getDoctor_id() {
	return doctor_id;
}

public void setDoctor_id(Integer doctor_id) {
	this.doctor_id = doctor_id;
}

public String getDoctor_name() {
	return doctor_name;
}

public void setDoctor_name(String doctor_name) {
	this.doctor_name = doctor_name;
}

public String getAppoint_result() {
	return appoint_result;
}

public void setAppoint_result(String appoint_result) {
	this.appoint_result = appoint_result;
}

public Integer getDate_id() {
	return date_id;
}

public void setDate_id(Integer date_id) {
	this.date_id = date_id;
}

public Date getData_name() {
	return data_name;
}

public void setData_name(Date data_name) {
	this.data_name = data_name;
}

public Time getStartwork_time() {
	return startwork_time;
}

public void setStartwork_time(Time startwork_time) {
	this.startwork_time = startwork_time;
}

public Time getEndwork_time() {
	return endwork_time;
}

public void setEndwork_time(Time endwork_time) {
	this.endwork_time = endwork_time;
}



@Override
public String toString() {
	return "AppointmentResult_Schedule [sche_doc_id=" + sche_doc_id + ", appointment_id=" + appointment_id
			+ ", patient_id=" + patient_id + ", patient_age=" + patient_age + ", patient_name=" + patient_name
			+ ", patient_gender=" + patient_gender + ", doctor_id=" + doctor_id + ", doctor_name=" + doctor_name
			+ ", appoint_result=" + appoint_result + ", appointment_time=" + appointment_time + ", date_id=" + date_id
			+ ", data_name=" + data_name + ", startwork_time=" + startwork_time + ", endwork_time=" + endwork_time
			+ ", appoint_or_not=" + appoint_or_not + ", sub_name=" + sub_name + ", sec_name=" + sec_name + "]";
}

public Timestamp getAppointment_time() {
	return appointment_time;
}

public void setAppointment_time(Timestamp appointment_time) {
	this.appointment_time = appointment_time;
}

public String getPatient_gender() {
	return patient_gender;
}

public void setPatient_gender(String patient_gender) {
	this.patient_gender = patient_gender;
}

public String getPatient_age() {
	return patient_age;
}

public void setPatient_age(String patient_age) {
	this.patient_age = patient_age;
}

public Integer getAppoint_or_not() {
	return appoint_or_not;
}

public void setAppoint_or_not(Integer appoint_or_not) {
	this.appoint_or_not = appoint_or_not;
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
}
