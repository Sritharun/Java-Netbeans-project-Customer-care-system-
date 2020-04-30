/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Customer;
import java.sql.*;


/**
 *
 * @author THARUN
 */


public class Cutomer_Backend {
    public static int create_login(String name,String num, String email, String pwd)
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_1","root","Sbbsbpbv@123");
              Statement st = con.createStatement();                            
              boolean z;
                                         
              z = st.execute("insert into login (cust_name,cust_num,cust_email,cust_pwd) values('"+name+"','"+num+"','"+email+"','"+pwd+"')");
                            
               st.close();
               con.close();
               
             return (1) ;
             
    }
         catch (Exception ex) {
             //return (ex.getMessage());
            
        }
         return (0);                          
        
    }
    
    public static int login(String num, String pwd, int o)
    {
        int a=0;
        if(o==0)
        {
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
           
            
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_1","root","Sbbsbpbv@123");
              Statement st = con.createStatement();
              
              String z = null;
              
                            
              ResultSet rs = st.executeQuery("select * from login where cust_num = '"+num+"'");
              
              if(rs.next())
              {
                z=rs.getString("cust_pwd");
                  if(z.equals(pwd))
                  {               
                      a=1;
                  }
              }
              st.close();
              con.close();
                      
        }
         catch (Exception ex) 
         {
            
         }
        
        }
        if(o==1)
        {
            try {
            
            Class.forName("com.mysql.jdbc.Driver");
           
            
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_1","root","Sbbsbpbv@123");
              Statement st = con.createStatement();
              
              String z = null;
              
                            
              ResultSet rs = st.executeQuery("select * from execlogin where exec_id = '"+num+"'");
              
              if(rs.next())
              {
                z=rs.getString("exec_pwd");
                  if(z.equals(pwd))
                  {               
                      a=1;
                  }
              }
              st.close();
              con.close();
              
        
            }
         catch (Exception ex) 
         {
            
         }
        
        }
        
      return a;  
    }
    
    public static String pending()
    {
        
        
        
        
        return "";
    }
    
        public static int new_complaint(String num, String dev,String cat, String comp)
        {
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_1","root","Sbbsbpbv@123");
              Statement st = con.createStatement();                            
              boolean z;
                                         
              z = st.execute("insert into complaints (cust_num,comp_dev,comp_cat,comp,comp_status) values('"+num+"','"+dev+"','"+cat+"','"+comp+"','Registered & Pending')");
                            
              ResultSet rs = st.executeQuery("select * from complaints");
              while(rs.next())
              {
              }
              rs.previous();
             
              int  a = (rs.getInt("comp_id"));
               st.close();
               con.close();
               
             return (a);  
             
        }
         catch (Exception ex) {
             
            return(0);
        }
           
        
        }
    
    public static String status_dev(int a, String c)
    {
//        
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
           
            
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_1","root","Sbbsbpbv@123");
              Statement st = con.createStatement();
              
              int z=0; 
                            
              ResultSet rs = st.executeQuery("select * from complaints where cust_num = '"+c+"'");
              
              while(rs.next())
              {
                z=rs.getInt("comp_id");
                
                  if(z==a)
                  {               
                      String name = rs.getString("comp_dev");                    
                      return ("Complaint device: "+name);     
                  }
              }
              st.close();
              con.close();
        
    }
         catch (Exception ex) 
         {
            return (ex.getMessage());
        }
        return "Please check the customer ID entered";
    }
    
     public static String status_cat(int a, String c)
    {
//        
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
           
            
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_1","root","Sbbsbpbv@123");
              Statement st = con.createStatement();
              
              int z=0; 
                            
              ResultSet rs = st.executeQuery("select * from complaints where cust_num = '"+c+"'");
              
              while(rs.next())
              {
                z=rs.getInt("comp_id");
                
                  if(z==a)
                  {               
                      String name = rs.getString("comp_cat");                    
                      return ("Complaint device: "+name);     
                  }
              }
              st.close();
              con.close();
        
    }
         catch (Exception ex) 
         {
            return (ex.getMessage());
        }
        return "";
    }

public static String status_comp(int a, String c)
    {
//        
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
           
            
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_1","root","Sbbsbpbv@123");
              Statement st = con.createStatement();
              
              int z=0; 
                            
              ResultSet rs = st.executeQuery("select * from complaints where cust_num = '"+c+"'");
              
              while(rs.next())
              {
                z = rs.getInt("comp_id");
                  if(z==a)
                  {                      
                      String comp = rs.getString("comp");
                      return ("Complaint: "+comp);                      
                  }
              }
              st.close();
              con.close();
        
    }
         catch (Exception ex)
         {                          
            
        }
        return "";
    }
    

public static String status_status(int a, String c)
    {
//        
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
           
            
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_1","root","Sbbsbpbv@123");
              Statement st = con.createStatement();
              
              int z=0; 
                            
              ResultSet rs = st.executeQuery("select * from complaints where cust_num = '"+c+"'");
              
              while(rs.next())
              {
                z = rs.getInt("comp_id");
                  if(z==a)
                  {                      
                      String status = rs.getString("comp_status");
                      return ("Complaint Status: "+status);                      
                  }
              }
              st.close();
              con.close();
        
    }
         catch (Exception ex)
         {                          
            
        }
        return "";
    }
    
    
    public static void executive()
    {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_1","root","Sbbsbpbv@123");
              Statement st = con.createStatement();
              
              int z=0; 
                            
              ResultSet rs = st.executeQuery("select * from complaints where comp_status = 'Registered & Pending'");
              while(rs.next())
              {
                System.out.println("Customer ID: "+rs.getInt("cust_id")+"\nCustomer name: "+rs.getString("cust_name")+"\nComplaint category: "+rs.getInt("comp_cat")+"\nComplaint Description: "+rs.getString("comp")+"\nComplaint status: "+rs.getString("comp_status"));
                System.out.println("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
                System.out.println("");
              }
              
              
              
              st.close();
              con.close();
        
    }
        catch (Exception ex) {
             //System.out.println(ex.getMessage());
            
        }
        System.out.println();System.out.println();System.out.println();
    }
    
}