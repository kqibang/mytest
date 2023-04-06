package top.wcxlmgone.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import top.wcxlmgone.dao.DoctorAndAdminDao;
import top.wcxlmgone.po.Administrator;
import top.wcxlmgone.po.AppointmentResult;
import top.wcxlmgone.po.AppointmentResult_Schedule;
import top.wcxlmgone.po.Doctor;
import top.wcxlmgone.po.DoctorAndAppointInfo;
import top.wcxlmgone.po.ScheduleDoctor;
import top.wcxlmgone.service.DoctorAndAdminService;

@Service("doctorService")
@Transactional
public class DoctorAndAdminServiceImpl implements DoctorAndAdminService {

	// 注入DoctorDao
	@Autowired
	private DoctorAndAdminDao doctorAndAdminDao;

//       医生登录
	public Doctor checkDocIdAndPassword(Doctor doctor) {
		Doctor doctor1 = this.doctorAndAdminDao.checkDocIdAndPassword(doctor);
		return doctor1;
	}

//         管理员登录
	public Administrator checkAdminIdAndPassword(Administrator administrator) {
		Administrator administrator1 = this.doctorAndAdminDao.checkAdminIdAndPassword(administrator);
		return administrator1;
	}

//        医生上传诊疗信息
	public Integer uploadMedicalRecords(AppointmentResult_Schedule appointmentResult) {
		Integer num = this.doctorAndAdminDao.uploadMedicalRecords(appointmentResult);
		return num;
	}

//	注册医生账号
	public Integer addDoctor(Doctor doctor) {
		Integer num = this.doctorAndAdminDao.addDoctor(doctor);
		return num;
	}

//       管理员删除医生
	public Integer doctorCancel(Doctor doctor) {
		Integer num = this.doctorAndAdminDao.doctorCancel(doctor);
		return num;
	}

//	管理员安排排班
	public Integer setSchedule(AppointmentResult_Schedule scheduleDoctor) {
		Integer num = this.doctorAndAdminDao.setSchedule(scheduleDoctor);
		return num;
	}

//   管理員修改医生信息
	public Integer adminModifydoctorInfo(Doctor doctor) {
		int num = this.doctorAndAdminDao.adminModifydoctorInfo(doctor);
		return num;
	}

//  医生修改个人信息
	public Integer doctorChangeInfo(Doctor doctor) {
		Integer num = this.doctorAndAdminDao.doctorChangeInfo(doctor);
		return num;
	}

//  获得所有预约该医生的病人
	public ArrayList<AppointmentResult_Schedule> getAllAppointedPatient(Doctor doctor) {
		ArrayList<AppointmentResult_Schedule> appointmentPatients=this.doctorAndAdminDao.getAllAppointedPatient(doctor);
		return appointmentPatients;
	}

//	医生获取其值班信息
	public ArrayList<DoctorAndAppointInfo> doctorGetSchedule(Doctor doctor) {
		ArrayList<DoctorAndAppointInfo> doctorScheduleInfos=this.doctorAndAdminDao.doctorGetSchedule(doctor);
		return doctorScheduleInfos;
	}

//   得到所有医生职位信息
	public ArrayList<DoctorAndAppointInfo> getPositionInfo() {
		ArrayList<DoctorAndAppointInfo> positionInfos=this.doctorAndAdminDao.getPositionInfo();
		return positionInfos;
	}

//   通过sub_id sec_id查询医生信息
	public ArrayList<Doctor> selectDoctorBySubAndSec(DoctorAndAppointInfo sub_sec_id) {
		ArrayList<Doctor> doctors = this.doctorAndAdminDao.selectDoctorBySubAndSec(sub_sec_id);
		return doctors;
	}

//  13 将所有医生返回
	public ArrayList<Doctor> getAllDoctors() {
		ArrayList<Doctor> allDoctors = this.doctorAndAdminDao.getAllDoctors();
		return allDoctors;
	}

//  14 通过名字查询医生
	public ArrayList<Doctor> getDoctorsByDocName(Doctor doctor) {
		ArrayList<Doctor> docOfName = this.doctorAndAdminDao.getDoctorsByDocName(doctor);
		return docOfName;
	}

//  15 通过sub_id查询医生
	public ArrayList<Doctor> selectDoctorBySub(DoctorAndAppointInfo sub_id) {
		ArrayList<Doctor> doctors = this.doctorAndAdminDao.selectDoctorBySub(sub_id);
		return doctors;
	}

//  6-1 注册时检查身份证是否已存在
	public ArrayList<Doctor> checkDoctorByIdentityId(Doctor doctor) {
		ArrayList<Doctor> doctor1 = this.doctorAndAdminDao.checkDoctorByIdentityId(doctor);
		return doctor1;
	}

//   得到今日及今日之后的日期
	public ArrayList<AppointmentResult_Schedule> getDateFromNowOn() {
		ArrayList<AppointmentResult_Schedule> dateFromNowOn = this.doctorAndAdminDao.getDateFromNowOn();
		return dateFromNowOn;
	}

//   管理员排版之前检查是否由重复的排班数据
	public Integer checkScheduleRepeateOrNot(AppointmentResult_Schedule scheduleDoctor) {
		Integer num = this.doctorAndAdminDao.checkScheduleRepeateOrNot(scheduleDoctor);
		return num;
	}
}
