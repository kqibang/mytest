package top.wcxlmgone.po;

import java.sql.Date;
import java.sql.Time;

public class DoctorAndAppointInfo {
	private Integer doctor_id;
	private String doctor_name;
	private String doctor_award;
	private Integer sub_id;
	private String sub_name;
	private Integer sec_id;
	private String sec_name;
	private Integer doctor_position_id;
	private String position_name;
	private Integer medical_expenses;
	private Integer rest;
	private Time startwork_time;
	private Time endwork_time;
	private Integer date_id;
	private Date data_name;
	private Integer sche_doc_id;
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
	public String getDoctor_award() {
		return doctor_award;
	}
	public void setDoctor_award(String doctor_award) {
		this.doctor_award = doctor_award;
	}
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
	public Integer getDoctor_position_id() {
		return doctor_position_id;
	}
	public void setDoctor_position_id(Integer doctor_position_id) {
		this.doctor_position_id = doctor_position_id;
	}
	public String getPosition_name() {
		return position_name;
	}
	public void setPosition_name(String position_name) {
		this.position_name = position_name;
	}
	public Integer getMedical_expenses() {
		return medical_expenses;
	}
	public void setMedical_expenses(Integer medical_expenses) {
		this.medical_expenses = medical_expenses;
	}
	public Integer getRest() {
		return rest;
	}
	public void setRest(Integer rest) {
		this.rest = rest;
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
	public Integer getSche_doc_id() {
		return sche_doc_id;
	}
	public void setSche_doc_id(Integer sche_doc_id) {
		this.sche_doc_id = sche_doc_id;
	}
	@Override
	public String toString() {
		return "DoctorAndAppointInfo [doctor_id=" + doctor_id + ", doctor_name=" + doctor_name + ", doctor_award="
				+ doctor_award + ", sub_id=" + sub_id + ", sub_name=" + sub_name + ", sec_id=" + sec_id + ", sec_name="
				+ sec_name + ", doctor_position_id=" + doctor_position_id + ", position_name=" + position_name
				+ ", medical_expenses=" + medical_expenses + ", rest=" + rest + ", startwork_time=" + startwork_time
				+ ", endwork_time=" + endwork_time + ", date_id=" + date_id + ", data_name=" + data_name
				+ ", sche_doc_id=" + sche_doc_id + "]";
	}
	

	
}
