package com.tcs.allclasses;

public class CustomerAddress
{
	private int block_no;
	private String Street;
	private String city;
	private int pincode;
	
	public CustomerAddress()
	{
		super();
	}
	
	public CustomerAddress(int block_no, String street, String city, int pincode)
	{
		super();
		this.block_no = block_no;
		Street = street;
		this.city = city;
		this.pincode = pincode;
	}

	public int getPincode() 
	{
		return pincode;
	}

	public void setPincode(int pincode)
	{
		this.pincode = pincode;
	}

	public int getBlock_no()
	{
		return block_no;
	}
	public void setBlock_no(int block_no)
	{
		this.block_no = block_no;
	}
	public String getStreet() 
	{
		return Street;
	}
	public void setStreet(String street) 
	{
		Street = street;
	}
	public String getCity() 
	{
		return city;
	}
	public void setCity(String city)
	{
		this.city = city;
	}
	
	@Override
	public String toString() 
	{
		return block_no + ", " + Street + ", " + city + ", " + pincode;
	}
}
