package top.wcxlmgone.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import top.wcxlmgone.po.Administrator;
import top.wcxlmgone.po.AppointmentResult;
import top.wcxlmgone.po.AppointmentResult_Schedule;
import top.wcxlmgone.po.Doctor;
import top.wcxlmgone.po.DoctorAndAppointInfo;
import top.wcxlmgone.po.ScheduleDoctor;
import top.wcxlmgone.service.DoctorAndAdminService;

@Controller("doctorController")
//@RequestMapping("/doctorAndAdmin")
public class DoctorAndAdminController {
//	注入依赖
	@Autowired
	private DoctorAndAdminService doctorService;

	@RequestMapping("/doctorSign")
	@ResponseBody
	public Doctor doctorSign(@RequestBody Doctor doctor, HttpSession session) {
		Doctor doctor1 = doctorService.checkDocIdAndPassword(doctor);
		if (doctor1 != null) { // 如果存在该账户id
			String doctorPassword=doctor.getDoctor_password();
			String doctor1Password=doctor1.getDoctor_password();
			if (doctorPassword.equals(doctor1Password)) // 且查询到的医生密码 与 输入的密码 相同
			{
				session.setAttribute("doctor_session", doctor1);
				return doctor1;   //若账号密码对的上，则返回当前查询的医生所有信息
			}
			else {
				return doctor;  //否则返回输入的账号和密码
			}
		} else {
//			System.out.println("账户id不存在");
//			System.out.println(doctor1);  不存在就是null
			return doctor1;  //如果不存在该账户id，则返回空
		}
	}

	@RequestMapping("/adminSign")
	@ResponseBody
	public Administrator adminSign(@RequestBody Administrator administrator, HttpSession session) {
		Administrator administrator1 = doctorService.checkAdminIdAndPassword(administrator);
		if (administrator1 != null) {  //如果该账户id存在
//			System.out.println("id 密码 正确");
//			System.out.println(administrator1);
//			session.removeAttribute(null);
//			session.invalidate();
			if(administrator.getA_password().equals(administrator1.getA_password())) {  //如果密码输入正确
			session.setAttribute("admin_session", administrator1);
			return administrator1;}//返回对应账户所有信息
			else {
//				System.out.println("密码错误");
			return administrator;//否则（密码输入错误，账户id存在）返回输入的信息
			}
		} else {
//			System.out.println("id不存在");
//			System.out.println(administrator1);
			return administrator1;  //若账户id不存在，则返回空对象
		}
	}
//  退出登录
	@RequestMapping("/logout")
	@ResponseBody
	public Integer logout(HttpSession session) {
		if(session.getAttribute("doctor_session")!=null) {
		session.removeAttribute("doctor_session");
//		System.out.println("我执行了");
		}
		if(session.getAttribute("admin_session")!=null) {
			session.removeAttribute("admin_session");
//			System.out.println("我执行了");
			}
		session.invalidate();
		return 1;
	}
//	医生上传诊疗信息
	@RequestMapping("/uploadMedicalRecord")
	@ResponseBody
	public Integer uploadMedicalRecord(@RequestBody AppointmentResult_Schedule appointmentResult) {
		Integer num = doctorService.uploadMedicalRecords(appointmentResult);
//		System.out.println(appointmentResult);
		if (num != 0) {
			return num;
		} else
			return num;
	}
	
//	医生获取其值班信息
	@RequestMapping("/doctorGetSchedule")
	@ResponseBody
	public ArrayList<DoctorAndAppointInfo> doctorGetSchedule(@RequestBody Doctor doctor) {
		ArrayList<DoctorAndAppointInfo> doctorScheduleInfos=this.doctorService.doctorGetSchedule(doctor);
		return doctorScheduleInfos;
	}
//	检查新密码
	@RequestMapping("/checkNewPassword")
	public String checkNewPassword(String oldpwd,String newpwd) {
		String msg="";
        if(newpwd!=null&&oldpwd==null){  //需要输入旧密码
        	msg="请输入旧密码";}
        else if(oldpwd.equals(newpwd)){  //新旧密码一致
                msg="新旧密码相同";
            }else if(newpwd.length()<=5){
                msg="密码长度小于6";
            }
            else {
            	msg="密码符合规范";
            }
        
        return msg;
	}

	
	

//  医生修改个人信息
	@RequestMapping("/doctorChangeInfo")
	@ResponseBody
	public Integer doctorChangeInfo(@RequestBody Doctor doctor, HttpSession session) {
//		System.out.println(doctor);
		Integer change_state = doctorService.doctorChangeInfo(doctor);
//		System.out.println(change_state);
		if (change_state != 0) {
			session.removeAttribute("doctor_session");
			session.invalidate();
			return change_state;
		} else
			return change_state;
	}

	
//	管理员注册医生账号
	@RequestMapping("/insertDoctor")
	@ResponseBody
	public Integer dRegister(@RequestBody Doctor doctor) {
//		System.out.println(doctor);
//		doctor.get
		String identityNum=doctor.getDoctor_identity_id();
		if(identityNum.charAt(0)=='0') {  //身份证号码第一位不为0
			return 0;
		}
		for(int i=0;i<identityNum.length();i++) {
			if(i<=16) {   //如果在身份证号码前17为出现了其它字符，则不行
				if(identityNum.charAt(i)<'0'||identityNum.charAt(i)>'9') {
					return 0;
				}
			}else {   //如果身份证号码第18为不是0-9或者X，则不行
				if(identityNum.charAt(i)<'0' ||identityNum.charAt(i)>'9') {
					if(identityNum.charAt(i) != 'X') {
						return 0;
					}
				}
			}
		} 
		
		ArrayList<Doctor> doctor1 = doctorService.checkDoctorByIdentityId(doctor);
//		System.out.println(doctor1.isEmpty());  //是空的返回true  不是返回flase
		if(doctor1.isEmpty()) {
			Integer num1 = doctorService.addDoctor(doctor);
			return num1;
		}else
			return 0;
	}

//	管理员删除医生账号
	@RequestMapping("/dCancel")
	@ResponseBody
	public Integer dCancel(@RequestBody Doctor doctor) {
		Integer num1 = doctorService.doctorCancel(doctor);
//		System.out.println(doctor);
//		System.out.println(num1);
		return num1;
	}

//	管理员上传排班表
	@RequestMapping("/setScheduleDoc")
	@ResponseBody
	public Integer setScheduleDoc(@RequestBody AppointmentResult_Schedule scheduleDoctor) {
		//插入排班数据之前，需要检查数据库是否有重复的排班时间段
		System.out.println(scheduleDoctor);
		Integer num =this.doctorService.checkScheduleRepeateOrNot(scheduleDoctor);
		System.out.println("重复数据条数："+num);
		if(num==0) {
			Integer num1 = this.doctorService.setSchedule(scheduleDoctor);
			System.out.println(scheduleDoctor);
			return num1;
		}
		return 0;
	}

//	  获得所有医生信息
//	修改个人信息时获取信息
	@RequestMapping("/getDoctorInfoWhenModify")
	@ResponseBody
	public Doctor getDoctorInfoWhenModify(@RequestBody Doctor doctor) {
		Doctor doctor1 = this.doctorService.checkDocIdAndPassword(doctor);
		return doctor1;
	}
//  9 管理員修改医生信息
	@RequestMapping("/adminModifydoctorInfo")
	@ResponseBody
public Integer adminModifydoctorInfo(@RequestBody Doctor doctor) {
//		System.out.println(doctor);
		String identityNum=doctor.getDoctor_identity_id();
		if(identityNum.charAt(0)=='0') {  //身份证号码第一位不为0
			return 0;
		}
		for(int i=0;i<identityNum.length();i++) {
			if(i<=16) {   //如果在身份证号码前17为出现了其它字符，则不行
				if(identityNum.charAt(i)<'0'||identityNum.charAt(i)>'9') {
					return 0;
				}
			}else {   //如果身份证号码第18为不是0-9或者X，则不行
				if(identityNum.charAt(i)<'0' ||identityNum.charAt(i)>'9') {
					if(identityNum.charAt(i) != 'X') {
						return 0;
					}
				}
			}
		} 
      Integer num =this.doctorService.adminModifydoctorInfo(doctor);
//      System.out.println(num);
		return num;
}
//	 获得所有预约该医生的病人
	@RequestMapping("/getAllAppointedPatient")
	@ResponseBody
	public ArrayList<AppointmentResult_Schedule> getAllAppointedPatient(@RequestBody Doctor doctor) {
		ArrayList<AppointmentResult_Schedule> allAppointedPatients = doctorService.getAllAppointedPatient(doctor);
		return allAppointedPatients;
	}
	

//  得到所有医生职位信息
	@RequestMapping("/getPositionInfo")
	@ResponseBody
	public ArrayList<DoctorAndAppointInfo> getPositionInfo() {
		ArrayList<DoctorAndAppointInfo> positionInfos=this.doctorService.getPositionInfo();
		return positionInfos;
	}
	
//  通过sub_id sec_id查询医生信息
	@RequestMapping("/selectDoctorBySubAndSec")
	@ResponseBody
	public ArrayList<Doctor> selectDoctorBySubAndSec(@RequestBody DoctorAndAppointInfo sub_sec_id) {
//		System.out.println(sub_sec_id);
		ArrayList<Doctor> doctors = this.doctorService.selectDoctorBySubAndSec(sub_sec_id);
//		System.out.println(doctors);
		return doctors;
	}
	
//  13 将所有医生返回
	@RequestMapping("/getAllDoctors")
	@ResponseBody
	public ArrayList<Doctor> getAllDoctors() {
		ArrayList<Doctor> allDoctors = this.doctorService.getAllDoctors();
		return allDoctors;
	}

//  14 通过名字查询医生
	@RequestMapping("/getDoctorsByDocName")
	@ResponseBody
	public ArrayList<Doctor> getDoctorsByDocName(@RequestBody Doctor doctor) {
		ArrayList<Doctor> docOfName = this.doctorService.getDoctorsByDocName(doctor);
		return docOfName;
	}
//  15 通过sub_id查询医生
	@RequestMapping("/selectDoctorBySub")
	@ResponseBody
	public ArrayList<Doctor> selectDoctorBySub(@RequestBody DoctorAndAppointInfo sub_id) {
		ArrayList<Doctor> doctors = this.doctorService.selectDoctorBySub(sub_id);
		return doctors;
	}
//  得到今日及今日之后的日期
	@RequestMapping("/getDateFromNowOn")
	@ResponseBody
	public ArrayList<AppointmentResult_Schedule> getDateFromNowOn() {
		ArrayList<AppointmentResult_Schedule> dateFromNowOn = this.doctorService.getDateFromNowOn();
		return dateFromNowOn;
	}
}
