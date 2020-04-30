

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import ="Customer.Cutomer_Backend"%>
<!DOCTYPE html>
<html>
    <head>
        <a href="http://localhost:8080/Cutomer_Project/Customer_Frontend.jsp" >
	<img src="D:\Studies\college\6th sem\Java\Project\java-logo-png.png" style="max-width: 100px; width: 50%" alt="">

	</a>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create an account</title>
    </head>
    <body>
   
        <h2>Enter your details to create an account.</h2>
        
        <form  METHOD="get">
         Enter your name: 
        <INPUT TYPE="TEXT" NAME="cust_name" required> <br/><br/>
        Enter your mobile number:
        <INPUT TYPE="TEXT" NAME="cust_num" required><br/><br/>
        Enter your E-mail ID:        
        <INPUT TYPE="TEXT" NAME="cust_email" required=""><br/><br/>        
        Enter a password:
        <INPUT TYPE="password" NAME="cust_pwd" required=""><br/>
        <br/>
       <button >Submit</button> <br/><br/>
      
           <br/><br/>
        
        </form>
       <%
           
           
           String s1 = request.getParameter("cust_name");
           String s2 = request.getParameter("cust_num");
           String s3 = request.getParameter("cust_email");
           String s4 = request.getParameter("cust_pwd");
           int a=-1;
           if(s1!=null&&s2!=null&&s3!=null&&s4!=null)
           {
               
               Cutomer_Backend c = new Cutomer_Backend();
               a = c.create_login(s1,s2,s3,s4); 
               if(a==1)
               {
                   
                   response.sendRedirect("CustomerLoginAlert.jsp");
               }
               else
                {
                    %>
                    <script>    
                     
    
                    alert('Account already exists / Fill all the details');                    
                    
                    </script>
                    
                    <%
                        
           }
        }
               %>
              
               
        

    </body>
</html>