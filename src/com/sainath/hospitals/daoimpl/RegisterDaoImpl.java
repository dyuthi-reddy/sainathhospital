package com.sainath.hospitals.daoimpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.transaction.annotation.Transactional;

import com.sainath.hospital.bean.patient;
import com.sainath.hospital.dao.RegisterDao;


public class RegisterDaoImpl implements RegisterDao{
	
	SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(patient.class).
			buildSessionFactory();

	@Override
	@Transactional
	public void registerPatient(patient patientObject) {
		//create session object;
		Session session  = factory.openSession();
		
		try{
		//begin transaction
		session.beginTransaction();
		session.save(patientObject);
		System.out.println("saving patient");
		session.getTransaction().commit();
		System.out.println("patient saved!!");
		//end and comit transaction
		}
		
		finally{
		//close connection
			session.close();
		}
		
	}

}
