package top.wcxlmgone.dao;

import java.util.ArrayList;

import top.wcxlmgone.po.AppointmentResult;
import top.wcxlmgone.po.AppointmentResult_Schedule;
import top.wcxlmgone.po.DateSubSecID;
import top.wcxlmgone.po.Doctor;
import top.wcxlmgone.po.DoctorAndAppointInfo;
import top.wcxlmgone.po.MedicalCategory;
import top.wcxlmgone.po.Patient;
import top.wcxlmgone.po.PatientBind;

public interface PatientDao {
//病人登录
public Patient patientLogin(Patient patient);
//病人登录是检查是否存在该账号
public Integer patientLogin_checkPhonenum(Patient patient);
//检查是否有重复的病人账号
public Integer checkRepeatData(Patient patient);
//建立就诊档案
public Integer addPatient(Patient patient);
//绑定就诊人
public Integer BindPatient(PatientBind patientBind);
//检查是否已绑定该用户
public Integer checkBindPatientOrnot(Patient patient);
//得到当前要绑定的用户的id
public Integer getP_idByIdentiyId(String identity_id);
//查看所有已添加的就诊人
public ArrayList<Patient> getAllPatients(Patient patient);
//删除某已有的就诊人
public Integer deleteOnePatient(PatientBind patientBind);
//返回科室门诊
public ArrayList<DoctorAndAppointInfo> getDepartmentOutpatient();
//返回详细门诊
public ArrayList<DoctorAndAppointInfo> getMedicalCategoryDetail(DoctorAndAppointInfo medicalCategory);
//返回当天值班医生信息  通过当天日期xxxx-xx-xx和选择的科室id 门诊id
public ArrayList<Doctor> getDoctorByDataNameAndTid(DoctorAndAppointInfo date_sub_sec_id);
//返回医生值班详细信息以及可预约时间段
public ArrayList<DoctorAndAppointInfo> getDocInfoAndSchedule(DoctorAndAppointInfo doctorAndAppointInfo);
//确定预约该医生
public Integer addAppointRegister(AppointmentResult_Schedule appointmentResult);
//预约之前检查是否已有该预约记录  通过 医生 病人及排班时间来判断
public Integer checkAppointedOrNot(AppointmentResult_Schedule patient_doctor_sche_id);
//取消预约该医生
public Integer cancelAppointment(AppointmentResult_Schedule appointment);
//查看所有的诊疗记录
public ArrayList<AppointmentResult_Schedule> getAllAppointmentResult(Patient patient);
//查看预约诊疗结果
public AppointmentResult_Schedule getAppointmentResult(AppointmentResult_Schedule appointmentResult);
//查询科室
public ArrayList<DoctorAndAppointInfo> getSubIDAndSubName();
}
