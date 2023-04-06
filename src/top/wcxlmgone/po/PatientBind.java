package top.wcxlmgone.po;

public class PatientBind {
private Integer patient_id;
private Integer p_id;
public Integer getPatient_id() {
	return patient_id;
}
public void setPatient_id(Integer patient_id) {
	this.patient_id = patient_id;
}
public Integer getP_id() {
	return p_id;
}
public void setP_id(Integer p_id) {
	this.p_id = p_id;
}
@Override
public String toString() {
	return "PatientBind [patient_id=" + patient_id + ", p_id=" + p_id + "]";
}
public PatientBind(Integer patient_id, Integer p_id) {
	super();
	this.patient_id = patient_id;
	this.p_id = p_id;
}
public PatientBind() {
	super();
	// TODO Auto-generated constructor stub
}

}
