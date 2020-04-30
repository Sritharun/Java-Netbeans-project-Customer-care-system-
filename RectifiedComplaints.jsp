<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import ="Customer.Cutomer_Backend"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <a href="http://localhost:8080/Cutomer_Project/Customer_Frontend.jsp" >
	<img src="D:\Studies\college\6th sem\Java\Project\java-logo-png.png" style="max-width: 100px; width: 50%" alt="">

	</a>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rectified complaints </title>
    </head>
    <body>
        <br/><br/><br/>
             
            <h3>The rectified complaints are: </h3><br/><br/>

       
        <%            
            
            int s=0;
            try {
            
            Class.forName("com.mysql.jdbc.Driver");
                       
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_1","root","Sbbsbpbv@123");
              
              Statement st = con.createStatement();
              
              
              
              int z=0; String name="",device,category,complaint,number;
              
              ResultSet rs = st.executeQuery(" select * from complaints where comp_status = 'Resolved' ");
                                                          
              while(rs.next())
              {
                  s++;
                z=rs.getInt("comp_id");
                number = rs.getString("cust_num");
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_1","root","Sbbsbpbv@123");
                Statement st1 = con.createStatement();
                ResultSet rs1 = st1.executeQuery("select * from login");
                while(rs1.next())
                {
                    if(number.equals(rs1.getString("cust_num")))
                    {
                        name = rs1.getString("cust_name");
                        break;
                    }                                      
                }
                st1.close();
                con1.close();
                device = rs.getString("comp_dev");
                category = rs.getString("comp_cat");
                complaint = rs.getString("comp");
                
                out.println("Complaint ID: "+z);
                %>
                <br/>
                <%
                out.println("Customer name: "+name);
                %>
                <br/>
                <%
                out.println("Customer number: "+number);
                %>
                <br/>
                <%
                out.println("Device type: "+device);
                %>
                <br/>
                <%
                out.println("Complaint category: "+category);
                %>
                <br/>
                <%
                out.println("Complaint: "+complaint);
                
                %>
                <br/><br/>
                -------------------------------------------------------------------------------
                <br/><br/>
                <%                                                                                                                                                                         
              }
              st.close();
              con.close();
        
    }
         catch (Exception ex) 
         {
            //out.print(ex.getMessage());
        }
%>
               
            
                
          <br/><br/>
    </body>
</html>