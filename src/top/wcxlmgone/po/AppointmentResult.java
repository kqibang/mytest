package top.wcxlmgone.po;

import java.sql.Timestamp;
//由AppointRecords_Schedule.java代替
public class AppointmentResult {
private Integer appointment_id;
private Integer doctor_id;
private Integer patient_id;
private Integer date_id;
private Timestamp appointment_time;
private String appoint_result;
private Integer sche_doc_id;
public Integer getAppointment_id() {
	return appointment_id;
}
public void setAppointment_id(Integer appointment_id) {
	this.appointment_id = appointment_id;
}
public Integer getDoctor_id() {
	return doctor_id;
}
public void setDoctor_id(Integer doctor_id) {
	this.doctor_id = doctor_id;
}
public Integer getPatient_id() {
	return patient_id;
}
public void setPatient_id(Integer patient_id) {
	this.patient_id = patient_id;
}
public Integer getDate_id() {
	return date_id;
}
public void setDate_id(Integer date_id) {
	this.date_id = date_id;
}
public Timestamp getAppointment_time() {
	return appointment_time;
}
public void setAppointment_time(Timestamp appointment_time) {
	this.appointment_time = appointment_time;
}
public String getAppoint_result() {
	return appoint_result;
}
public void setAppoint_result(String appoint_result) {
	this.appoint_result = appoint_result;
}
@Override
public String toString() {
	return "AppointmentResult [appointment_id=" + appointment_id + ", doctor_id=" + doctor_id + ", patient_id="
			+ patient_id + ", date_id=" + date_id + ", appointment_time=" + appointment_time + ", appoint_result="
			+ appoint_result + ", sche_doc_id=" + sche_doc_id + "]";
}
public Integer getSche_doc_id() {
	return sche_doc_id;
}
public void setSche_doc_id(Integer sche_doc_id) {
	this.sche_doc_id = sche_doc_id;
}
}
