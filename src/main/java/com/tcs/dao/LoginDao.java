package com.tcs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import com.tcs.allclasses.CustomerAddress;
import com.tcs.allclasses.Food;
import com.tcs.allclasses.Order;

public class LoginDao
{
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	
	private Connection makeConnection()
	{
		Connection con = null;
		try
		{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url,"System","9939");
		}
		catch(Exception e)
		{
			System.out.println("Error");
			//e.printStackTrace();
		}
		return con;
	}
	public boolean check(String uname, String pass)
	{
		try
		{
			String sql = "select * from customer where email_id=? and password=?";
			Connection con = makeConnection();
			PreparedStatement st = con.prepareStatement(sql);
	        st.setString(1,uname);
	        st.setString(2,pass);
	        ResultSet rs = st.executeQuery();
	        if(rs.next())
	        	return true;
		}
		catch(Exception e)
		{
			System.out.println("Error");
			//e.printStackTrace();
		}
		return false;
	}
	
	public int insert(String uname,String pass,String fname,String mname,String lname,String Modile,int block,String Street,String City, int pincode) throws SQLException
	{
		/*String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		String fname = request.getParameter("fname");
		String mname = request.getParameter("mname");
		String lname = request.getParameter("lname");
		String Modile = request.getParameter("mob");
		int block = Integer.parseInt(request.getParameter("block"));
		String Street = request.getParameter("street");
		String City = request.getParameter("city");*/
		try
		{
			Connection con = makeConnection();
			String sql = "select * from customer where email_id=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,uname);
			ResultSet rs = st.executeQuery();
	        if(rs.next())
	        {
	        	return 0;
	        }
			//String sql1="insert into customer values("+uname+","+pass+","+fname+","+mname+","+lname+")";
			String sql1 = "insert into customer values(?,?,?,?,?)";
			PreparedStatement st1 = con.prepareStatement(sql1);
			st1.setString(1,uname);
	        st1.setString(2,pass);
	        st1.setString(3,fname);
	        st1.setString(4,mname);
	        st1.setString(5,lname);
	        st1.executeUpdate();
	        
	        String sql2 = "insert into cust_add values(?,?,?,?,?,?)";
	        PreparedStatement st2 = con.prepareStatement(sql2);
	        st2.setString(1,uname);
	        st2.setInt(2,block);
	        st2.setString(3,Street);
	        st2.setString(4,City);
	        st2.setString(5,Modile);
	        st2.setInt(6,pincode);
	        st2.executeUpdate();
		}
		catch(Exception e)
		{
			Connection con = makeConnection();
			String sql = "delete from customer where email_id=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,uname);
			st.executeQuery();
			System.out.println(e.getMessage());
			return 1;
		}
		return 2;
	}
	public HashMap<Integer, CustomerAddress>/*ArrayList<String>*/ getAddress(String uname)
	{
		HashMap<Integer, CustomerAddress> hm = new HashMap<Integer, CustomerAddress>();
		try
		{
			//ArrayList al = new ArrayList<String>();
			Connection con = makeConnection();
			String sql = "select * from cust_add where cid=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,uname);
			ResultSet rs = st.executeQuery();
			int c=1;
	        while(rs.next())
	        {
	        	int block_no = rs.getInt("block_no");
	        	String street = rs.getString("street");
	        	String city = rs.getString("city");
	        	int pincode = rs.getInt("pincode");
	        	CustomerAddress ca = new CustomerAddress(block_no, street, city, pincode);
	        	String add = block_no +" "+street+ " " + city + " " + pincode;
	        	//String s = "<b>Block no.</b> : <em>" + block_no + "</em> <b>Street</b> : <em>" + street + "</em> <b>City</b> : <em>" + city + "</em>";
	        	//al.add(add);
	        	hm.put(new Integer(c), ca);
	        	c++;
	        }
	        //return al;
		}
		catch(Exception e)
		{
			System.out.println("Error"+ e.getMessage());
		}
		return hm;
	}
	public ArrayList<String> getFoodtype()
	{
		try
		{
			ArrayList al = new ArrayList<String>();
			Connection con = makeConnection();
			String sql = "select distinct food_type from food";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
	        while(rs.next())
	        {
	        	String food_type = rs.getString("food_type");
	        	//System.out.println(food_type);
	        	al.add(food_type);
	        }
	        //System.out.println(al.size());
	        return al;
		}
		catch(Exception e)
		{
			System.out.println("Error "+ e.getMessage());
		}
		return null;
	}
	private boolean convertInt(int a)
	{
		return (a==1 ? true : false);
	}
	public ArrayList<Food> getFoodDetails(String meal,int isveg,String mealtype)
	{
		ArrayList<Food> al = new ArrayList<Food>();
		try
		{
			Connection con = makeConnection();
			String sql = "select * from food where FOOD_TYPE=? and ISVEG=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, mealtype);
			st.setInt(2, isveg);
			//System.out.println(isveg);
			ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				String food_id=rs.getString("food_id");
				//System.out.println(food_id);
				String food_name=rs.getString("food_name");
				String food_type=rs.getString("food_type");
				boolean isAvailable=convertInt(rs.getInt("isAvailable"));
				boolean isVeg=convertInt(rs.getInt("isVeg"));
				double price=rs.getDouble("price");
				String path_photo=rs.getString("path_photo");
				String details=rs.getString("details");
				Food fd = new Food(food_id,food_name,food_type,isAvailable,isVeg,price,path_photo,details);
				al.add(fd);
			}
			//System.out.println(al.size());
		}
		catch(Exception e)
		{
			System.out.println("Error "+ e.getMessage());
		}
		return al;
	}
	
	public ArrayList<String> getModeOfPayment()
	{
		ArrayList al = new ArrayList<String>();
		try
		{
			Connection con = makeConnection();
			String sql = "select distinct mode_name from payment_modes";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
	        while(rs.next())
	        {
	        	String food_type = rs.getString("mode_name");
	        	//System.out.println(food_type);
	        	al.add(food_type);
	        }
	        //System.out.println(al.size());
	        
		}
		catch(Exception e)
		{
			System.out.println("Error "+ e.getMessage());
		}
		return al;
	}
	
	public void insertOrder(Order order)
	{
		java.sql.Date sqlDate=new java.sql.Date(order.getDate().getTime());
		java.sql.Timestamp sqlTime=new java.sql.Timestamp(order.getDate().getTime());
		try
		{
			Connection con = makeConnection();
			String sql = "insert into food_order values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,order.getOrder_id());
			st.setString(2, order.getCustomer_id());
			st.setString(3, order.getFood_id());
			st.setDate(4, sqlDate);
			st.setTimestamp(5, sqlTime);
			//System.out.println(order);
			st.setInt(6, order.getDelivery_add().getBlock_no());
			st.setString(7, order.getDelivery_add().getStreet());
			st.setString(8, order.getDelivery_add().getCity());
			st.setInt(9, order.getDelivery_add().getPincode());
			st.setString(10, order.getContact_no());
			st.setDouble(11, order.getTotal_amount());
			
			ResultSet rs = st.executeQuery();
	        
		}
		catch(Exception e)
		{
			//e.printStackTrace();
			System.out.println("Error"+ e.getMessage());
		}
	}
	public void insertPayment(String order_id, String payment_by)
	{
		try
		{
			Connection con = makeConnection();
			String sql = "insert into payment values(?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,order_id);
			st.setString(2,payment_by);
			
			ResultSet rs = st.executeQuery();
	        
		}
		catch(Exception e)
		{
			//e.printStackTrace();
			System.out.println("Error"+ e.getMessage());
		}
	}
	public boolean insertAddress(CustomerAddress ca,String user)
	{
		try
		{
			Connection con = makeConnection();
			String sql = "insert into cust_add values(?,?,?,?,null,?)";
			PreparedStatement st = con.prepareStatement(sql);
			
			st.setString(1,user);
			st.setInt(2,ca.getBlock_no());
			st.setString(3,ca.getStreet());
			st.setString(4,ca.getCity());
			//st.setInt(5,);
			st.setInt(5,ca.getPincode());
			
			ResultSet rs = st.executeQuery();
			System.out.println(ca);
			con.close();
	        return true;
		}
		catch(Exception e)
		{
			//e.printStackTrace();
			System.out.println("Error"+ e.getMessage());
			return false;
		}
	}
}
