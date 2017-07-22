package com.sainath.hospitals.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;
import org.springframework.transaction.annotation.Transactional;

import com.sainath.hospital.bean.patient;
import com.sainath.hospital.dao.viewPatientsDao;


public class viewPatientDaoimpl implements viewPatientsDao{
	
	SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(patient.class).
			buildSessionFactory();

	@Override
	public List<patient> viewTopPatients() {
		//create session object;
				Session session  = factory.openSession();

				@SuppressWarnings("unchecked")
				List<patient> patientsTop100 = (List<patient>) session.createQuery("from patient order by Id asc").setMaxResults(100).list();
					session.close();	
				
			
				return patientsTop100;
	}

	@Override
	public List<patient> viewSearchPatients(long serialNumber, String firstName, String lastName, long phone,
			long adhaarNumber) {
		Session session  = factory.openSession();
		
		@SuppressWarnings("unchecked")
		List<patient> results = session.createCriteria(patient.class)
		   .add(Restrictions.disjunction()
		      .add(Restrictions.eq("serialNumber",serialNumber ))
		      .add(Restrictions.like("firstName", firstName)) 
		      .add(Restrictions.like("lastName", lastName)) 
		      .add(Restrictions.eq("phone",phone))
		   .add(Restrictions.eq("adhaarNumber",adhaarNumber)))
		   .list();
		System.out.println(results);
		session.close();
		return results;
	}

	@Override
	public List<patient> viewPatientbyId(long Id) {
	
		Session session  = factory.openSession();

		@SuppressWarnings("unchecked")
		List<patient> patientsTop = (List<patient>) session.createQuery("FROM patient p WHERE p.Id = :Id").setParameter("Id", Id).list();
	
		session.close();	
		
		return patientsTop;
		
	}
	
	@Override
	public int UpdatePatientbyId(long Id, String firstName, String lastName, String address, long phone, String doctor, 
			String diagnosis, long serialNumber, long adhaarNumber, int zipCode, String city, String gender) {
	
		
		Session session  = factory.openSession();

		Query query = session.createQuery("update patient set firstName = :firstName,lastName = :lastName,address = :address,"+
		"phone = :phone,doctor = :doctor,diagnosis = :diagnosis,gender = :gender,serialNumber = :serialNumber,adhaarNumber = :adhaarNumber,zipCode = :zipCode,city = :city WHERE Id = :Id");
		query.setParameter("Id", Id);
		query.setParameter("firstName", firstName);
		query.setParameter("lastName", lastName);
		query.setParameter("address", address);
		query.setParameter("phone", phone);
		query.setParameter("doctor", doctor);
		query.setParameter("diagnosis", diagnosis);
		query.setParameter("gender", gender);
		query.setParameter("serialNumber", serialNumber);
		query.setParameter("adhaarNumber", adhaarNumber);
		query.setParameter("zipCode", zipCode);
		query.setParameter("city", city);
		
	    

		int result = query.executeUpdate();
		session.close();
		
		return result;
		
		
	}


public int updateall(String firstName, String lastName, String address, long phone,long serialNumber, long adhaarNumber, int zipCode, 
		String city, String gender){
	Session session  = factory.openSession();
	Query query1 = session.createQuery("update patient set firstName = :firstName,lastName = :lastName,address = :address,"+
			"phone = :phone,adhaarNumber = :adhaarNumber,zipCode = :zipCode,gender = :gender,city = :city WHERE serialNumber = :serialNumber");
	        query1.setParameter("serialNumber", serialNumber);
			query1.setParameter("firstName", firstName);
			query1.setParameter("lastName", lastName);
			query1.setParameter("address", address);
			query1.setParameter("phone", phone);
			query1.setParameter("adhaarNumber", adhaarNumber);
			query1.setParameter("zipCode", zipCode);
			query1.setParameter("gender", gender);
			query1.setParameter("city", city);
			
			int result1 = query1.executeUpdate();
	session.close();	
	
	return result1;
	
}

}