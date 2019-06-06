package com.tcs.allclasses;

import java.util.ArrayList;

public class Customer 
{
	private String email_id;
	private String first_name;
	private String middle_name;
	private String last_name;
	private ArrayList<CustomerAddress> addresses;
	private ArrayList<String> contacts;
	
	public String getEmail_id() 
	{
		return email_id;
	}
	public void setEmail_id(String email_id)
	{
		this.email_id = email_id;
	}
	public String getFirst_name()
	{
		return first_name;
	}
	public void setFirst_name(String first_name)
	{
		this.first_name = first_name;
	}
	public String getMiddle_name()
	{
		return middle_name;
	}
	public void setMiddle_name(String middle_name)
	{
		this.middle_name = middle_name;
	}
	public String getLast_name()
	{
		return last_name;
	}
	public void setLast_name(String last_name)
	{
		this.last_name = last_name;
	}
	public ArrayList<CustomerAddress> getAddresses()
	{
		return addresses;
	}
	public void addAddresses(CustomerAddress address)
	{
		this.addresses.add(address);
	}
	public ArrayList<String> getContacts()
	{
		return contacts;
	}
	public void addContacts(String contact)
	{
		this.contacts.add(contact);
	}
	
}
