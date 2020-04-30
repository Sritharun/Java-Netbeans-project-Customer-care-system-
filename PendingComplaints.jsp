
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
        <title>Pending complaints </title>
    </head>
    <body>
        <br/><br/><br/>
             
            <h3>The pending complaints are: </h3><br/><br/>

       
        <%            
            
            int s=0;
            try {
            
            Class.forName("com.mysql.jdbc.Driver");
           
            
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_1","root","Sbbsbpbv@123");
              
              Statement st = con.createStatement();
              
              
              
              int z=0; String name="",device,category,complaint,number;
              
              ResultSet rs = st.executeQuery(" select * from complaints where comp_status = 'Registered & Pending' ");
                                                          
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
if(s==0)
{
out.print("Congratulations!!! All the complaints have been resolved. There are no pending complaints.");
session.setAttribute("s", s);                   
}
              st.close();
              con.close();
        
    }
         catch (Exception ex) 
         {
            //out.print(ex.getMessage());
        }
if(s!=0)
{
           %> 
           
           
            <form  method="GET">
            <h3>Enter the complaint ID of the complaint which is/are resolved: </h3><br/>

            <INPUT TYPE="number" NAME="res_id" required>
            <br/><br/>
            <INPUT TYPE="SUBMIT">
            
         
                <%
                    
                   
                   if(request.getParameter("res_id")!=null)
                   {
                       int a = Integer.parseInt(request.getParameter("res_id"));
                       int p=0;
                       boolean b;                       
                       
        try {
            
            Class.forName("com.mysql.jdbc.Driver");
           
            
              Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_1","root","Sbbsbpbv@123");
              //Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/demo_1","root","Sbbsbpbv@123");
              Statement st = con.createStatement();
              Statement st1 = con.createStatement();
              
              String z="Resolved";
              
              ResultSet rs = st1.executeQuery(" select * from complaints where comp_id = "+a+"  ");
              while(rs.next())
              {
                  p=-1;
                  //out.print(rs.getString("comp_id"));
                  if(rs.getString("comp_status").equals("Registered & Pending"))
                  {                     
                        b = st.execute(" update complaints set comp_status = 'Resolved' where comp_id = "+a+" ");
                        p=1;                        
                  }
              }              
              st1.close();
              //con1.close();
              st.close();
              con.close();
              
              
        
        }
        
         catch (Exception ex) 
         {
            //out.print(ex.getMessage());
        }
        if(p==1)
        {
            %>
            
            <script>
                alert('Complaint status updated successfully');
                </script>
                <%
                    }
else if(p==-1)
{
%>

<script>
                alert('Complaint already resolved');
                </script>
                <%
                    }
else
{
%>
<script>
                alert('Complaint does not exist');
                </script>
   <%                 
}
p=0;
}
}
                       
            %>
   
               
               
            
                
          <br/><br/>
    </body>
</html>