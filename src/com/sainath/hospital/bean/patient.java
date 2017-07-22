package com.sainath.hospital.bean;

import java.sql.Date;
import java.util.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "opregistration")
public class patient {
	@Id
	@Column(name = "Id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long Id;
	@Column(name = "SerialNumber")
	private long serialNumber;
	@Column(name = "FirstName")
	private String firstName;
	@Column(name = "LastName")
	private String lastName;
	@Column(name = "AdhaarNumber")
	private long adhaarNumber;
	@Column(name = "Address")
	private String address;
	@Column(name = "City")
	private String city;
	@Column(name = "ZipCode")
	private int zipCode;
	@Column(name = "Phone")
	private long phone;
	@Column(name = "ConsultingDoctor")
	private String doctor;
	@Column(name = "Dates")
	private String date;
	@Column(name = "Times")
	private String time;
	@Column(name = "Diagnosis")
	private String diagnosis;
	@Column(name = "Gender")
	private String gender;
	@Column(name = "ErrorMessage")
	private String errorMessage;
	public patient() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public patient(long serialNumber, String firstName, String lastName, long adhaarNumber, String address, String city,
			int zipCode, long phone, String doctor, String diagnosis, String gender) {
		super();
		this.serialNumber = serialNumber;
		this.firstName = firstName;
		this.lastName = lastName;
		this.adhaarNumber = adhaarNumber;
		this.address = address;
		this.city = city;
		this.zipCode = zipCode;
		this.phone = phone;
		this.doctor = doctor;
		this.diagnosis = diagnosis;
		this.gender = gender;
	}

	public long getId() {
		return Id;
	}

	public void setId(long id) {
		this.Id = id;
	}

	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public patient(long id, long serialNumber, String firstName, String lastName, long adhaarNumber, String address,
			long phone) {
		super();
		Id = id;
		this.serialNumber = serialNumber;
		this.firstName = firstName;
		this.lastName = lastName;
		this.adhaarNumber = adhaarNumber;
		this.address = address;
		this.phone = phone;
	}

	public long getSerialNumber() {
		return serialNumber;
	}
	public void setSerialNumber(long serialNumber) {
		this.serialNumber = serialNumber;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public long getAdhaarNumber() {
		return adhaarNumber;
	}
	public void setAdhaarNumber(long adhaarNumber) {
		this.adhaarNumber = adhaarNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getZipCode() {
		return zipCode;
	}
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getDoctor() {
		return doctor;
	}
	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getDiagnosis() {
		return diagnosis;
	}
	public void setDiagnosis(String diagnosis) {
		this.diagnosis = diagnosis;
	}

}
