<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import ="Customer.Cutomer_Backend"%>
<!DOCTYPE html>
<html>
    <head>
        <a href="http://localhost:8080/Cutomer_Project/Customer_Frontend.jsp" >
	<img src="D:\Studies\college\6th sem\Java\Project\java-logo-png.png" style="max-width: 100px; width: 50%" alt="">

	</a>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register a new complaint</title>
    </head>
    <br/><br/><br/>
    <body>
        <h2>Enter the details in order to register a new complaint.</h2>
        <form METHOD="get">
         <select NAME="comp_dev">
        <option  value= "Smartphone"> Smartphone </option>
        <option  value= "Desktop"> Desktop </option>
        <option  value= "Laptop"> Laptop </option>
        <option  value= "Printer"> Printer </option>
        <option  value= "Wearables"> Wearable device </option>
        </select> <br/><br/>        
        Choose complaint category:
        <select NAME="comp_cat">
        <option  value= "Hardware issues"> Hardware issues </option>
        <option  value= "Software issues"> Software issues </option>
        <option  value= "Connectivity issues"> Connectivity issues </option>
        </select> <br/><br/>
        Enter your complaint:
        <INPUT TYPE="TEXT" NAME="comp" required>
       <br/><br/>
        <INPUT TYPE="SUBMIT">
        <br/><br/>
        </form>
          <%
            
                int a=-1;
//               String a;
                String s1 = session.getAttribute("u").toString();
                String s2 = request.getParameter("comp_dev");
                String s3 = request.getParameter("comp");
                String s4 = request.getParameter("comp_cat");
//                out.print(s1+" "+s2+" "+s4+" "+s3);
                
                if(s1!=null&&s2!=null&&s3!=null&&s4!=null)
                {
                    Cutomer_Backend c = new Cutomer_Backend();
                    a = c.new_complaint(s1,s2,s4,s3);
//                    out.print(a);
                    if(a!=0&&a!=-1)
                    {
                    
                   %>
                   
                    <script>
                    
                    alert('Complaint registered successfully');
                    
                    </script>

                   <% 
                    
                    }                 
                                                                                         
            %>
            <br/>
            
             <%
                if(a!=0&&a!=-1)
                {
                out.print("Your complaint ID is "+a);
                }
             }
                %>

                                   
    </body>
</html>