package top.wcxlmgone.po;

import java.sql.Date;

public class DateSubSecID {
private Date data_name;
private Integer sub_id;
private Integer sec_id;

public Integer getSub_id() {
	return sub_id;
}
public void setSub_id(Integer sub_id) {
	this.sub_id = sub_id;
}
public Integer getSec_id() {
	return sec_id;
}
public void setSec_id(Integer sec_id) {
	this.sec_id = sec_id;
}
public Date getData_name() {
	return data_name;
}
public void setData_name(Date data_name) {
	this.data_name = data_name;
}
@Override
public String toString() {
	return "DateSubSecID [data_name=" + data_name + ", sub_id=" + sub_id + ", sec_id=" + sec_id + "]";
}

}
