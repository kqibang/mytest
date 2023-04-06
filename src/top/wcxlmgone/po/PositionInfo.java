package top.wcxlmgone.po;

public class PositionInfo {
private Integer position_id;
private String position_name;
private Integer medical_expenses;
public Integer getPosition_id() {
	return position_id;
}
public void setPosition_id(Integer position_id) {
	this.position_id = position_id;
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
@Override
public String toString() {
	return "PositionInfo [position_id=" + position_id + ", position_name=" + position_name + ", medical_expenses="
			+ medical_expenses + "]";
}
}
