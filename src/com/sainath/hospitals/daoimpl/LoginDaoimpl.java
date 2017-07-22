package com.sainath.hospitals.daoimpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.transaction.annotation.Transactional;

import com.sainath.hospital.bean.Employee;
import com.sainath.hospital.bean.patient;
import com.sainath.hospital.dao.LoginDao;

public class LoginDaoimpl implements LoginDao {
	
	SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Employee.class).
			buildSessionFactory();

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<Employee> viewEmployees() {
		Session session  = factory.openSession();
		 
	
		//begin transaction
		session.beginTransaction();
		List<Employee> EmployeesList = (List<Employee>) session.createQuery("from Employee").list();
		System.out.println("getting Employees");
		System.out.println(EmployeesList);
		//close connection
			session.close();	
		
		
		return EmployeesList;
	
	}

}
