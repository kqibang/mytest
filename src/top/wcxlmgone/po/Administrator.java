package top.wcxlmgone.po;

public class Administrator {
private Integer a_id;
private String a_name;
private String a_password;
public Integer getA_id() {
	return a_id;
}
public void setA_id(Integer a_id) {
	this.a_id = a_id;
}
public String getA_name() {
	return a_name;
}
public void setA_name(String a_name) {
	this.a_name = a_name;
}
public String getA_password() {
	return a_password;
}
public void setA_password(String a_password) {
	this.a_password = a_password;
}
@Override
public String toString() {
	return "Administrator [a_id=" + a_id + ", a_name=" + a_name + ", a_password=" + a_password + "]";
}

}
