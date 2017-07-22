package com.sainath.hospital.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sainath.hospital.bean.Employee;
import com.sainath.hospital.bean.patient;
import com.sainath.hospitals.daoimpl.LoginDaoimpl;
import com.sainath.hospitals.daoimpl.RegisterDaoImpl;
import com.sainath.hospitals.daoimpl.viewPatientDaoimpl;

@Controller

public class HomeController {
	
	 
	 @RequestMapping(value = "/") 
	 public String displayLogin(Model model) { 
	     model.addAttribute("Employee", new Employee()); 
	     return "login"; 
	 }
	 

	@RequestMapping(value = "/register")	
	public String gotoProfile(@ModelAttribute("Employee")Employee employee, Model model, HttpServletRequest request)  {	
		System.out.println(employee.getUserName());
		model.addAttribute("patient",new patient());
		LoginDaoimpl logindao = new LoginDaoimpl();
		List<Employee> loginlist = logindao.viewEmployees();
		
		for(Employee employeeitem : loginlist){
			if(employeeitem.getUserName().equals(employee.getUserName()) && employeeitem.getPassword().equals(employee.getPassword())){
				request.getSession().setAttribute("loggedInUser", employeeitem.getUserName());
				
				return "register";
			}
			
		}
		model.addAttribute("errorMessageLoginJsp", "User Name/Password is invalid");
		return "login";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)	
	public String gotoProfilefromNavbar(Model model)  {	
		
		model.addAttribute("patient",new patient());
		
		
		
		return "register";
	}
	
	@RequestMapping(value = "/search")	
	public String gotoSearchfromNavbar(@ModelAttribute("patient")patient patientmodel, Model model)  {	
		model.addAttribute("patient",new patient());
		
		
		
		return "search";
	}
	
	@RequestMapping(value = "/backfromsearch")	
	public String gotoedit(HttpServletRequest request, @ModelAttribute("patient")patient patientmodel, Model model
             )  {
		//patient patientSearch = new patient();
		List<patient> patientTop = new ArrayList<>();
		viewPatientDaoimpl viewpatientdao = new viewPatientDaoimpl();
		model.addAttribute("patient",new patient());
		String pageId = request.getParameter("someAttr");
		long id = Long.parseLong(pageId);
	 
	 patientTop = (List<patient>) viewpatientdao.viewPatientbyId(id);
	 /*for(patient patientvisiting : patientTop){
		 patientSearch = patientvisiting;
		 break;
	 }*/
	 model.addAttribute("patientVisitorEdit", patientTop);
		
		return "addvisitorEdit";
	}
	
	@RequestMapping(value = "/getSearchResults")
	@ResponseBody
	public List<patient> getSearchResults(@ModelAttribute("patient")patient patientmodel, Model model, @RequestParam("sernum") String serialNumber,
			@RequestParam("firstname") String firstName,
			@RequestParam("lastname") String lastName,
			@RequestParam("phone") String phone,
			@RequestParam("adhaar") String adhaar)  {	
		
		model.addAttribute("patient",new patient());
		
		viewPatientDaoimpl viewpatientdao = new viewPatientDaoimpl();
		List<patient> patientSearch100 = new ArrayList<>();
		model.addAttribute("patient",new patient());
		System.out.println("serial number search"+serialNumber);
		long Serialnumberconv = Long.parseLong(serialNumber);
		long phonenumberconv = Long.parseLong(phone);
		long adhaarnumberconv = Long.parseLong(adhaar);
		System.out.println(Serialnumberconv);
	     patientSearch100 = viewpatientdao.viewSearchPatients(Serialnumberconv,firstName,lastName,phonenumberconv,adhaarnumberconv);
	     System.out.println("got the list"+patientSearch100);
		
		
		return patientSearch100;
	}
	
	@RequestMapping(value = "/viewop", method = RequestMethod.POST)
	public String gotoViewPatient(@ModelAttribute("patient")patient patientmodel, Model model) {
		
		if(patientmodel.getFirstName().trim().length() < 4 || Long.toString(patientmodel.getPhone()).trim().length() < 10 || 
				Long.toString(patientmodel.getAdhaarNumber()).trim().length() < 12
				|| Integer.toString(patientmodel.getZipCode()).trim().length() < 6 || 
				patientmodel.getAddress().trim().length() < 8 || patientmodel.getLastName().trim().length() == 0
				|| patientmodel.getCity().trim().length() < 3
				|| patientmodel.getDoctor().trim().length() == 0 || patientmodel.getGender().trim().length() == 0){
			
			if(patientmodel.getFirstName().trim().length() == 0 || Long.toString(patientmodel.getPhone()).trim().length() == 0 || Long.toString(patientmodel.getAdhaarNumber()).trim().length() == 0
				|| Integer.toString(patientmodel.getZipCode()).trim().length() == 0 || patientmodel.getAddress().trim().length() == 0 || patientmodel.getLastName().trim().length() == 0
				|| patientmodel.getCity().trim().length() == 0
				|| patientmodel.getDoctor().trim().length() == 0 || patientmodel.getGender().trim().length() == 0)
			{model.addAttribute("errorMessageJsp", "No fileds should be empty.");}
			
			else if(patientmodel.getFirstName().trim().length() < 4){model.addAttribute("errorMessageJsp", "First Name Should be atleast 4 characters.");}
			
			else if(patientmodel.getAddress().trim().length() < 8){model.addAttribute("errorMessageJsp", "Address Should be atleast 8 characters.");}
			
			else if(patientmodel.getCity().trim().length() < 3){model.addAttribute("errorMessageJsp", "City Should be more than 3 characters.");}
			
			else if(Long.toString(patientmodel.getPhone()).trim().length() < 10 || 
				Long.toString(patientmodel.getAdhaarNumber()).trim().length() < 12
				|| Integer.toString(patientmodel.getZipCode()).trim().length() < 6)
			{model.addAttribute("errorMessageJsp", "Please make sure Phone# is 10 digits, Adhaar# is 12 digits and Pin Code is 6 digits.");}
			
			return "register";
		}
		
		else{

		Calendar calforSerialNumber = Calendar.getInstance();
		int millisec = calforSerialNumber.get(Calendar.MILLISECOND);
		int sec  = calforSerialNumber.get(Calendar.SECOND);
		int min  = calforSerialNumber.get(Calendar.MINUTE);
		
		String timeSerialNumber = Integer.toString(millisec)+Integer.toString(min)+Integer.toString(sec);
		int serialnumber = Integer.parseInt(timeSerialNumber);
		
		patientmodel.setSerialNumber(serialnumber);
		
		Date now = new Date();
		
		 DateFormat formatter = DateFormat.getInstance(); // Date and time
	      String dateStr = formatter.format(now);
	      patientmodel.setDate(dateStr);
	      formatter = DateFormat.getTimeInstance();        // time only
	      patientmodel.setTime(formatter.format(now));
		
		RegisterDaoImpl registerdao = new RegisterDaoImpl();
	
		model.addAttribute("firstname", patientmodel.getFirstName());
		registerdao.registerPatient(patientmodel);
	       System.out.println(patientmodel.getFirstName());
	       System.out.println(patientmodel.getPhone());
	       System.out.println(patientmodel.getGender());
	       List<patient> patientsTop100 = new ArrayList<>();
			model.addAttribute("patient",new patient());
			viewPatientDaoimpl viewpatientdao = new viewPatientDaoimpl();
			patientsTop100 =  viewpatientdao.viewTopPatients();
			 model.addAttribute("displayPatient",patientsTop100);
		
	return "viewPatient";
		}
	}
	
	@RequestMapping(value = "/updates", method = RequestMethod.GET)	
	public String gotoViewPatientfromNavbar(Model model)  {	
		List<patient> patientsTop100 = new ArrayList<>();
		model.addAttribute("patient",new patient());
		viewPatientDaoimpl viewpatientdao = new viewPatientDaoimpl();
		patientsTop100 =  viewpatientdao.viewTopPatients();
		 model.addAttribute("displayPatient",patientsTop100);
		
		return "viewPatient";
	}
	
	@RequestMapping(value = "/saveVisit")
	@ResponseBody
	public List<patient> savePatientVisit(@ModelAttribute("patient")patient patientmodel, Model model,
			@RequestParam("sernum") String serialNumber,
			@RequestParam("patid") String Id,
			@RequestParam("doc") String doctor,
			@RequestParam("diagnosis") String diagnosis
			) {

		
		Date now = new Date();
		
		 DateFormat formatter = DateFormat.getInstance(); // Date and time
	      String dateStr = formatter.format(now);
	      patientmodel.setDate(dateStr);
	      formatter = DateFormat.getTimeInstance();        // time only
	      patientmodel.setTime(formatter.format(now));
	      
	      List<patient> patientTop = new ArrayList<>();
			viewPatientDaoimpl viewpatientdao = new viewPatientDaoimpl();
			model.addAttribute("patient",new patient());

			long id = Long.parseLong(Id);
			System.out.println(Id);
		 
		 patientTop = (List<patient>) viewpatientdao.viewPatientbyId(id);
		for(patient patientvisiting : patientTop){
			patientmodel.setSerialNumber(patientvisiting.getSerialNumber());
			patientmodel.setFirstName(patientvisiting.getFirstName());
			patientmodel.setLastName(patientvisiting.getLastName());
			patientmodel.setPhone(patientvisiting.getPhone());
			patientmodel.setAddress(patientvisiting.getAddress());
			patientmodel.setZipCode(patientvisiting.getZipCode());
			patientmodel.setCity(patientvisiting.getCity());
			patientmodel.setAdhaarNumber(patientvisiting.getAdhaarNumber()); 
			patientmodel.setGender(patientvisiting.getGender());
		 }
	      
	      
		patientmodel.setDoctor(doctor);
		patientmodel.setDiagnosis(diagnosis);
	      
		
		RegisterDaoImpl registerdao = new RegisterDaoImpl();
	
		model.addAttribute("firstname", patientmodel.getFirstName());
		registerdao.registerPatient(patientmodel);
	       System.out.println(patientmodel.getFirstName());
	       System.out.println(patientmodel.getPhone());
	       System.out.println(patientmodel.getGender());
	  
		
	return patientTop;
		
	}
	
	@RequestMapping(value = "/savePatient")
	@ResponseBody
	public Integer PatientVisit(@ModelAttribute("patient")patient patientmodel, Model model,
			@RequestParam("sernum") String serialNumber,
			@RequestParam("patid") String Id,
			@RequestParam("firstName") String firstName,
			@RequestParam("diagnosis") String diagnosis,
			@RequestParam("lastName") String lastName,
			@RequestParam("phone") String phone,
			@RequestParam("adhaarnumber") String adhaarnumber,
			@RequestParam("city") String city,
			@RequestParam("zipcode") String zipcode,
			@RequestParam("address") String address,
			@RequestParam("doctor") String doctor,
			@RequestParam("gender") String gender
			) {
		viewPatientDaoimpl viewpatientdao = new viewPatientDaoimpl();
		long serialNumberconv = Long.parseLong(serialNumber);
		long phoneconv = Long.parseLong(phone);
		long adhaarnumberconv = Long.parseLong(adhaarnumber);
		long Idconv = Long.parseLong(Id);
		int zipcodeconv = Integer.parseInt(zipcode);
		System.out.println(gender+"in homecontroller");
		int result =  viewpatientdao.UpdatePatientbyId(Idconv, firstName, lastName, address, phoneconv, doctor, 
				diagnosis, serialNumberconv, adhaarnumberconv, zipcodeconv, city, gender);
		int result1 = viewpatientdao.updateall(firstName, lastName, address, phoneconv, serialNumberconv, adhaarnumberconv, zipcodeconv, city, gender);
		
	return result1;
		
	}


	
	
}
