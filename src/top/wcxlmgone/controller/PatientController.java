package top.wcxlmgone.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.jsontype.impl.ClassNameIdResolver;

import top.wcxlmgone.po.AppointmentResult;
import top.wcxlmgone.po.AppointmentResult_Schedule;
import top.wcxlmgone.po.DateSubSecID;
import top.wcxlmgone.po.Doctor;
import top.wcxlmgone.po.DoctorAndAppointInfo;
import top.wcxlmgone.po.MedicalCategory;
import top.wcxlmgone.po.Patient;
import top.wcxlmgone.po.PatientBind;
import top.wcxlmgone.service.PatientService;

@Controller("patientController")
public class PatientController {
	@Autowired
	private PatientService patientService;

	// 病人登录
	@RequestMapping("/patientLogin")
	@ResponseBody
	public Patient patientLogin(@RequestBody Patient patient) {
		Integer patients_num = this.patientService.patientLogin_checkPhonenum(patient); // 查看是否有该账户
		if (patients_num != 0) { // 有
			Patient patient1 = this.patientService.patientLogin(patient); // 查看是否账号密码对的上
//			System.out.println(patient1);
			if (patient1 == null) { // 如果密码错误 即没有获取到账户
//				patient.setPatient_phonenum(patient.getPatient_phonenum());  //返回其电话号码
				return patient;
			}
			return patient1;
		} else { // 没有该账户
			patient.setPatient_phonenum(null);
			patient.setPatient_password(null);
			return patient;
		}
	}

	// 病人注册在线档案
	@RequestMapping("/patientRegister")
//	@ResponseBody
	public void pRegister(@RequestBody Patient patient,HttpServletResponse response) throws IOException {
		
		String phonenum = patient.getPatient_phonenum();
		String identityNum = patient.getPatient_identity_id();
		String result="添加失败";
		System.out.println(phonenum.charAt(0));
		 response.setContentType("text/json;charset=utf-8");
		 response.setCharacterEncoding("utf-8");
		 PrintWriter out = response.getWriter();
		if(phonenum.charAt(0)!='1') {//若是电话号码第一位不以1开头，则非中国号
			result="非中国大陆手机号，请重新输入";
			System.out.println(result);
			out.print(result);
			return;
		}else if(phonenum.charAt(1)=='0' ||
				phonenum.charAt(1)=='1'
				|| phonenum.charAt(1)=='2'){  //若电话号码第2位为 0 1 2则不行
			result="非中国大陆手机号，请重新输入";
			System.out.println(result);
//			return result;
			out.print(result);
			return;
		}else if(identityNum.charAt(0)=='0') {  //身份证号码第一位不为0
			result ="身份证格式非法";
			System.out.println(result);
			out.print(result);
			return;
		}
		for(int i=0;i<identityNum.length();i++) {
			if(i<=16) {   //如果在身份证号码前17为出现了其它字符，则不行
				if(identityNum.charAt(i)<'0'||identityNum.charAt(i)>'9') {
					result ="身份证格式非法";
					System.out.println(result);
					out.print(result);
					return;
				}
			}else {   //如果身份证号码第18为不是0-9或者X，则不行
				if(identityNum.charAt(i)<'0' ||identityNum.charAt(i)>'9') {
					if(identityNum.charAt(i) != 'X') {
						result ="身份证格式非法";
						System.out.println(result);
						out.print(result);
						return;
					}
				}
			}
		} 
		System.out.println(result);
		int num = 1;
		num = this.patientService.checkRepeatData(patient);  //判断数据库里面有没有重复的身份证号码，有没有注册过了
		System.out.println(patient.getPatient_identity_id());
		System.out.println(num);
		if (num == 0) {
			Integer num1 = this.patientService.addPatient(patient);  //添加该病人
			System.out.println("num1"+num1);
			if(num1==1) {
				result="ok";
				out.print(result);
				return;
			}
		} 
		System.out.println(result);
		out.print(result);
		return;
	}
	//绑定病人
	@RequestMapping("/bindPatient")
//	@ResponseBody
	public void BindPatient(@RequestBody Patient patient,HttpServletResponse response) throws IOException {
//		System.out.println(patient.getPatient_id());
		String phonenum = patient.getPatient_phonenum();
		String identityNum = patient.getPatient_identity_id();
		String result="已添加该就诊人，绑定失败";
		 response.setContentType("text/json;charset=utf-8");
		 response.setCharacterEncoding("utf-8");
		 PrintWriter out = response.getWriter();
		if(phonenum.charAt(0)!='1') {//若是电话号码第一位不以1开头，则非中国号
			result="非中国大陆手机号，请重新输入";
//			System.out.println(result);
			out.print(result);
			return;
		}else if(phonenum.charAt(1)=='0' ||
				phonenum.charAt(1)=='1'
				|| phonenum.charAt(1)=='2'){  //若电话号码第2位为 0 1 2则不行
			result="非中国大陆手机号，请重新输入";
//			System.out.println(result);
//			return result;
			out.print(result);
			return;
		}
		for(int i=0;i<phonenum.length();i++) {
			if(phonenum.charAt(i)<'0' || phonenum.charAt(i)>'9') {
				result ="电话号码格式不规范";
				out.print(result);
				return;
			}
		}
		if(identityNum.charAt(0)=='0') {  //身份证号码第一位不为0
			result ="身份证格式非法";
			out.print(result);
			return;
		}
		for(int i=0;i<identityNum.length();i++) {
			if(i<=16) {   //如果在身份证号码前17为出现了其它字符，则不行
				if(identityNum.charAt(i)<'0'||identityNum.charAt(i)>'9') {
					result ="身份证格式非法";
					out.print(result);
					return;
				}
			}else {   //如果身份证号码第18为不是0-9或者X，则不行
				if(identityNum.charAt(i)<'0' ||identityNum.charAt(i)>'9') {
					if(identityNum.charAt(i) != 'X') {
						result ="身份证格式非法";
						out.print(result);
						return;
					}
				}
			}
		} 
		Integer num1 = this.patientService.checkBindPatientOrnot(patient);  //如果存在绑定病人了，则绑定失败 即num1>0
		if(num1==0) {
			int patient_id = patient.getPatient_id();
			Integer p_id = this.patientService.getP_idByIdentiyId(patient.getPatient_identity_id());
			PatientBind patientBind=new PatientBind(patient_id,p_id);
//			System.out.println(patientBind);
			Integer num = this.patientService.BindPatient(patientBind);
			result="绑定成功";
			out.print(result);
			return;
		}
		else {
			out.print(result);
		    return;}
	}


	//	返回科室门诊
	@RequestMapping("/getDepartmentOutpatient")
	@ResponseBody
	public ArrayList<DoctorAndAppointInfo> getDepartmentOutpatient() {
//		System.out.println("访问我了");
		ArrayList<DoctorAndAppointInfo> medicalCategory1 = this.patientService.getDepartmentOutpatient();
		return medicalCategory1;
	}

//	选择科室显示门诊
	@RequestMapping("/chooseTypeDepartment")
	@ResponseBody
	public ArrayList<DoctorAndAppointInfo> chooseTypeDepartment(@RequestBody DoctorAndAppointInfo medicalCategory) {
//		System.out.println(medicalCategory);
		ArrayList<DoctorAndAppointInfo> medicalCategory1 = this.patientService
				.getMedicalCategoryDetail(medicalCategory);
//		System.out.println(medicalCategory1);
		return medicalCategory1;
	}

//  查询科室
	@RequestMapping("/getSubidAndName")
	@ResponseBody
	public ArrayList<DoctorAndAppointInfo> getSub_id_Name() {
		ArrayList<DoctorAndAppointInfo> medicalCategory1 = this.patientService.getSubIDAndSubName();
//		System.out.println(medicalCategory1);
		return medicalCategory1;
	}

//	返回当天值班医生信息  通过当天日期xxxx-xx-xx和选择的科室id 门诊id
	@RequestMapping("/getDoctorByDataNameAndTid")
	@ResponseBody
	public ArrayList<Doctor> getDoctorByDataNameAndTid(@RequestBody DoctorAndAppointInfo date_sub_sec_id) {
//		System.out.println(date_sub_sec_id);
		ArrayList<Doctor> doctor = this.patientService.getDoctorByDataNameAndTid(date_sub_sec_id);
		return doctor;
	}

//	返回医生值班详细信息以及可预约时间段
	@RequestMapping("/toChooseDoctor")
	@ResponseBody
	public ArrayList<DoctorAndAppointInfo> toChooseDoctor(@RequestBody DoctorAndAppointInfo doctorAndAppointInfo) {
		ArrayList<DoctorAndAppointInfo> doctorAndAppointInfo1 = this.patientService
				.getDocInfoAndSchedule(doctorAndAppointInfo);
		return doctorAndAppointInfo1;
	}

//	确定预约该医生
	@RequestMapping("/appointRegister")
	@ResponseBody
	public Integer AppointRegister(@RequestBody AppointmentResult_Schedule appointmentResult) {
		Integer appointedOrNot = this.patientService.checkAppointedOrNot(appointmentResult);
		if (appointedOrNot == 0) {//如果在该时间段已预约过该医生  即appointedOrNot>=1 则不可以预约；若appointedOrNot=0，即无预约，则可以
			Integer num = this.patientService.addAppointRegister(appointmentResult);
			return num;  //返回0挂号失败，返回1挂号成功  返回2已有挂号记录
		} else if(appointedOrNot ==1) {return 2;}
		else	return 0;
	}
	
//	取消预约
	@RequestMapping("/cancelAppointment")
	@ResponseBody
	public Integer cancelAppointment(@RequestBody AppointmentResult_Schedule appointment_id) {
		Integer num = this.patientService.cancelAppointment(appointment_id);
		return num;
	}

//	查看预约诊疗信息
	@RequestMapping("/getAllAppointmentResult")
	@ResponseBody
	public ArrayList<AppointmentResult_Schedule> getAllAppointmentResult(@RequestBody Patient patient) {
		ArrayList<AppointmentResult_Schedule> appointRecords = this.patientService.getAllAppointmentResult(patient);
//		System.out.println(appointmentResult1);
		return appointRecords;
	}

//	返回详细诊疗结果
	@RequestMapping("/getAppointmentResult")
	@ResponseBody
	public AppointmentResult_Schedule getAppointmentResult(@RequestBody AppointmentResult_Schedule appointmentResult) {
		AppointmentResult_Schedule appointmentResult1 = this.patientService.getAppointmentResult(appointmentResult);
		return appointmentResult1;
	}

//	得到已添加的病人
	@RequestMapping("/getAllPatients")
	@ResponseBody
	public ArrayList<Patient> getAllPatients(@RequestBody Patient patient) {
		ArrayList<Patient> patients = this.patientService.getAllPatients(patient);
		return patients;
	}

//	删除某个已添加的就诊人
	@RequestMapping("/deleteOnePatient")
	@ResponseBody
	public Integer deleteOnePatient(PatientBind patientBind){
		System.out.println("解绑"+patientBind);
		Integer num = this.patientService.deleteOnePatient(patientBind);
		System.out.println(num);
		if(num==null) return 0;
		else return 1;
	}
}
