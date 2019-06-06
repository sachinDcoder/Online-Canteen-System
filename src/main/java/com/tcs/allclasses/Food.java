package com.tcs.allclasses;

public class Food 
{
	private String food_id;
	private String food_name;
	private String food_type;
	private boolean isAvailable;
	private boolean isVeg;
	private double price;
	private String path_photo;
	private String details;
	
	
	public boolean isAvailable()
	{
		return isAvailable;
	}
	public Food(String food_id, String food_name, String food_type, boolean isAvailabe, boolean isVeg, double price,
			String path_photo, String details) 
	{
		super();
		this.food_id = food_id;
		this.food_name = food_name;
		this.food_type = food_type;
		this.isAvailable = isAvailabe;
		this.isVeg = isVeg;
		this.price = price;
		this.path_photo = path_photo;
		this.details = details;
	}
	public String getFood_id() 
	{
		return food_id;
	}
	public void setFood_id(String food_id) 
	{
		this.food_id = food_id;
	}
	public String getFood_name() 
	{
		return food_name;
	}
	public void setFood_name(String food_name)
	{
		this.food_name = food_name;
	}
	public String getFood_type() 
	{
		return food_type;
	}
	public void setFood_type(String food_type)
	{
		this.food_type = food_type;
	}
	public boolean isAvailabe()
	{
		return isAvailable;
	}
	public void setAvailabe(boolean isAvailabe)
	{
		this.isAvailable = isAvailable;
	}
	public boolean isVeg()
	{
		return isVeg;
	}
	public void setVeg(boolean isVeg) 
	{
		this.isVeg = isVeg;
	}
	public double getPrice() 
	{
		return price;
	}
	public void setPrice(double price)
	{
		this.price = price;
	}
	public String getPath_photo() 
	{
		return path_photo;
	}
	public void setPath_photo(String path_photo)
	{
		this.path_photo = path_photo;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) 
	{
		this.details = details;
	}
	@Override
	public String toString() 
	{
		return "Food [food_id=" + food_id + ", food_name=" + food_name + ", food_type=" + food_type + ", isAvailable="
				+ isAvailable + ", isVeg=" + isVeg + ", price=" + price + ", path_photo=" + path_photo + ", details="
				+ details + "]";
	}
	
}
