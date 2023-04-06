package top.wcxlmgone.po;
//由AppointRecords_Schedule代替
public class ScheduleDoctor {
private Integer sche_doc_id;
private Integer date_id;
private Integer doctor_id;
private String startwork_time;
private String endwork_time;
public String getStartwork_time() {
	return startwork_time;
}
public void setStartwork_time(String startwork_time) {
	this.startwork_time = startwork_time;
}
public String getEndwork_time() {
	return endwork_time;
}
public void setEndwork_time(String endwork_time) {
	this.endwork_time = endwork_time;
}
private Integer rest;
public Integer getSche_doc_id() {
	return sche_doc_id;
}
public void setSche_doc_id(Integer sche_doc_id) {
	this.sche_doc_id = sche_doc_id;
}
public Integer getDate_id() {
	return date_id;
}
public void setDate_id(Integer date_id) {
	this.date_id = date_id;
}
public Integer getDoctor_id() {
	return doctor_id;
}
public void setDoctor_id(Integer doctor_id) {
	this.doctor_id = doctor_id;
}
public Integer getRest() {
	return rest;
}
public void setRest(Integer rest) {
	this.rest = rest;
}
@Override
public String toString() {
	return "ScheduleDoctor [sche_doc_id=" + sche_doc_id + ", date_id=" + date_id + ", doctor_id=" + doctor_id
			+ ", startwork_time=" + startwork_time + ", endwork_time=" + endwork_time + ", rest=" + rest + "]";
}
}
