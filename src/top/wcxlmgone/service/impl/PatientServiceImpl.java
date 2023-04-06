package top.wcxlmgone.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import top.wcxlmgone.dao.PatientDao;
import top.wcxlmgone.po.AppointmentResult;
import top.wcxlmgone.po.AppointmentResult_Schedule;
import top.wcxlmgone.po.DateSubSecID;
import top.wcxlmgone.po.Doctor;
import top.wcxlmgone.po.DoctorAndAppointInfo;
import top.wcxlmgone.po.MedicalCategory;
import top.wcxlmgone.po.Patient;
import top.wcxlmgone.po.PatientBind;
import top.wcxlmgone.service.PatientService;

@Service("patientService")
@Transactional
public class PatientServiceImpl implements PatientService {
	// 注入PatientRegisterDao
	@Autowired
	private PatientDao patientDao;

	public Integer checkRepeatData(Patient patient) {
		Integer num = this.patientDao.checkRepeatData(patient);
//		System.out.println(num);
		return num;
	}

	public Integer addPatient(Patient patient) {
//		System.out.println(patient);
		Integer num = this.patientDao.addPatient(patient);
		return num;
	}

//	返回详细门诊
	public ArrayList<DoctorAndAppointInfo> getMedicalCategoryDetail(DoctorAndAppointInfo medicalCategory) {
		ArrayList<DoctorAndAppointInfo> medicalCategory1 = this.patientDao.getMedicalCategoryDetail(medicalCategory);
		return medicalCategory1;
	}

//	返回当天值班医生信息  通过当天日期id和选择的科室门诊id
	public ArrayList<Doctor> getDoctorByDataNameAndTid(DoctorAndAppointInfo date_sub_sec_id) {
//		System.out.println(date_sub_sec_id);
		ArrayList<Doctor> doctors = this.patientDao.getDoctorByDataNameAndTid(date_sub_sec_id);
		return doctors;
	}

//	返回医生值班详细信息以及可预约时间段
	public ArrayList<DoctorAndAppointInfo> getDocInfoAndSchedule(DoctorAndAppointInfo doctorAndAppointInfo) {
		ArrayList<DoctorAndAppointInfo> doctorAndAppointInfo1 = this.patientDao
				.getDocInfoAndSchedule(doctorAndAppointInfo);
		return doctorAndAppointInfo1;
	}

//	确定预约该医生
	public Integer addAppointRegister(AppointmentResult_Schedule appointmentResult) {
		Integer num = this.patientDao.addAppointRegister(appointmentResult);
		return num;
	}

//	返回科室门诊
	public ArrayList<DoctorAndAppointInfo> getDepartmentOutpatient() {
		ArrayList<DoctorAndAppointInfo> medicaCategory = this.patientDao.getDepartmentOutpatient();
		return medicaCategory;
	}

//	返回详细诊疗结果
	public AppointmentResult_Schedule getAppointmentResult(AppointmentResult_Schedule appointmentResult) {
		AppointmentResult_Schedule appointmentResult1 = this.patientDao.getAppointmentResult(appointmentResult);
		return appointmentResult1;
	}

	// 查看所有的诊疗记录
	public ArrayList<AppointmentResult_Schedule> getAllAppointmentResult(Patient patient) {
		ArrayList<AppointmentResult_Schedule> appointRecords = this.patientDao.getAllAppointmentResult(patient);
		return appointRecords;
	}

	// 查询科室
	public ArrayList<DoctorAndAppointInfo> getSubIDAndSubName() {
		ArrayList<DoctorAndAppointInfo> sub_id_and_name = this.patientDao.getSubIDAndSubName();
		return sub_id_and_name;
	}

	// 病人登录
	public Patient patientLogin(Patient patient) {
		Patient patient1 = this.patientDao.patientLogin(patient);
		return patient1;
	}
//	检查登录时是否有该账号
	public Integer patientLogin_checkPhonenum(Patient patient) {
		Integer p_num=this.patientDao.patientLogin_checkPhonenum(patient);
		return p_num;
	}
//	得到已添加的病人
	public ArrayList<Patient> getAllPatients(Patient patient) {
		ArrayList<Patient> patients= this.patientDao.getAllPatients(patient);
		return patients;
	}

//	删除某个已添加的就诊人
	public Integer deleteOnePatient(PatientBind patientBind) {
		Integer num = this.patientDao.deleteOnePatient(patientBind);
		return num;
	}

	//预约之前检查是否已有该预约记录  通过 医生 病人及排班时间来判断
	public Integer checkAppointedOrNot(AppointmentResult_Schedule patient_doctor_sche_id) {
		Integer num=this.patientDao.checkAppointedOrNot(patient_doctor_sche_id);
		return num;
	}

	//绑定病人
	public Integer BindPatient(PatientBind patientBind) {
		Integer num = this.patientDao.BindPatient(patientBind);
		return num;
	}

	//检查是否已绑定
	public Integer checkBindPatientOrnot(Patient patient) {
		Integer num = this.patientDao.checkBindPatientOrnot(patient);
		return num;
	}


	//得到要绑定的用户的id
	public Integer getP_idByIdentiyId(String identity_id) {
		Integer p_id = this.patientDao.getP_idByIdentiyId(identity_id);
		return p_id;
	}

	//取消预约该医生
	public Integer cancelAppointment(AppointmentResult_Schedule appointment) {
		Integer num = this.patientDao.cancelAppointment(appointment);
		return num;
	}


}
