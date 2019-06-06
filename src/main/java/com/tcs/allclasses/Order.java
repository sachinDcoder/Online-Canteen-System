package com.tcs.allclasses;

import java.util.Date;

public class Order
{
	private String order_id;
	private String customer_id;
	private String food_id;
	private Date date;
	private String contact_no;
	private CustomerAddress delivery_add;
	private double total_amount;
	public Order(String order_id, String customer_id, String food_id, Date date, CustomerAddress delivery_add, 
			double total_amount) 
	{
		super();
		this.order_id = order_id;
		this.customer_id = customer_id;
		this.food_id = food_id;
		this.date = date;
		this.delivery_add = delivery_add;
		this.total_amount = total_amount;
	}
	public String getContact_no()
	{
		return contact_no;
	}
	public void setContact_no(String contact_no)
	{
		this.contact_no = contact_no;
	}
	public String getOrder_id()
	{
		return order_id;
	}
	public void setOrder_id(String order_id) 
	{
		this.order_id = order_id;
	}
	public String getCustomer_id() 
	{
		return customer_id;
	}
	public void setCustomer_id(String customer_id) 
	{
		this.customer_id = customer_id;
	}
	public String getFood_id()
	{
		return food_id;
	}
	public void setFood_id(String food_id) 
	{
		this.food_id = food_id;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date)
	{
		this.date = date;
	}
	public CustomerAddress getDelivery_add()
	{
		return delivery_add;
	}
	public void setDelivery_add(CustomerAddress delivery_add)
	{
		this.delivery_add = delivery_add;
	}
	public double getTotal_amount()
	{
		return total_amount;
	}
	public void setTotal_amount(double total_amount) 
	{
		this.total_amount = total_amount;
	}
	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", customer_id=" + customer_id + ", food_id=" + food_id + ", date="
				+ date + ", contact_no=" + contact_no + ", delivery_add=" + delivery_add + ", total_amount="
				+ total_amount + "]";
	}
	
	

}
