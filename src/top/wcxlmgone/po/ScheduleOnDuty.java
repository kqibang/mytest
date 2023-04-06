package top.wcxlmgone.po;

import java.sql.Date;
//由AppointRecords_Schedule代替
public class ScheduleOnDuty {
private Integer date_id;
private Date data_name;


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


@Override
public String toString() {
	return "ScheduleOnDuty [date_id=" + date_id + ", data_name=" + data_name + "]";
}
}
