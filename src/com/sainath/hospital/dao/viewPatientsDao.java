package com.sainath.hospital.dao;

import java.util.List;

import com.sainath.hospital.bean.patient;

public interface viewPatientsDao {

	public List<patient> viewTopPatients();
	public List<patient> viewSearchPatients(long serialNumber,String firstName, String lastName, long phone, long adhaarNumber);
	public List<patient> viewPatientbyId(long Id);
	public int UpdatePatientbyId(long Id, String firstName, String lastName, String address, long phone,
			String doctor, String diagnosis, long serialNumber, long adhaarNumber, int zipCode, String city, String gender);
	public int updateall(String firstName, String lastName, String address, long phone,long serialNumber, long adhaarNumber, int zipCode, 
			String city, String gender);

}
