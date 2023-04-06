package top.wcxlmgone.service;


import java.util.ArrayList;

import top.wcxlmgone.dao.DoctorAndAdminDao;
import top.wcxlmgone.po.Administrator;
import top.wcxlmgone.po.AppointmentResult;
import top.wcxlmgone.po.AppointmentResult_Schedule;
import top.wcxlmgone.po.Doctor;
import top.wcxlmgone.po.DoctorAndAppointInfo;
import top.wcxlmgone.po.ScheduleDoctor;

public interface DoctorAndAdminService extends DoctorAndAdminDao{
//  医生登录检查数据
public Doctor checkDocIdAndPassword(Doctor doctor);
// 管理员登录检查数据
public Administrator checkAdminIdAndPassword(Administrator administrator);
//  医生上传诊疗结果
public Integer uploadMedicalRecords(AppointmentResult_Schedule appointmentResult);
//医生修改个人信息
public Integer doctorChangeInfo(Doctor doctor);
//医生获取值班信息
public ArrayList<DoctorAndAppointInfo> doctorGetSchedule(Doctor doctor);
//获取所有预约当前医生的病人
public ArrayList<AppointmentResult_Schedule> getAllAppointedPatient(Doctor doctor);
//  管理员注册医生账号
public Integer addDoctor(Doctor doctor);
//6-1 注册时检查身份证是否已存在
public ArrayList<Doctor> checkDoctorByIdentityId(Doctor doctor);
//  管理员删除医生账号
public Integer doctorCancel(Doctor doctor);
//  管理员安排排班
public Integer setSchedule(AppointmentResult_Schedule scheduleDoctor);
//8-1 管理员安排排班检查是否由重复的排班数据
public Integer checkScheduleRepeateOrNot(AppointmentResult_Schedule scheduleDoctor);
//管理員修改医生信息
public Integer adminModifydoctorInfo(Doctor doctor);
//得到全部医生职位信息
public ArrayList<DoctorAndAppointInfo> getPositionInfo();
//通过sub_id sec_id查询医生信息
public ArrayList<Doctor> selectDoctorBySubAndSec(DoctorAndAppointInfo sub_sec_id);
//15 通过sub_id查询医生
public ArrayList<Doctor> selectDoctorBySub(DoctorAndAppointInfo sub_id);
//16 得到今日之后的日期
public ArrayList<AppointmentResult_Schedule> getDateFromNowOn();
}
