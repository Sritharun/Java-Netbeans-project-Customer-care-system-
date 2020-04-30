

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import ="Customer.Cutomer_Backend"%>
<!DOCTYPE html>
<html>
    <head>
        <a href="http://localhost:8080/Cutomer_Project/Customer_Frontend.jsp" >
	<img src="D:\Studies\college\6th sem\Java\Project\java-logo-png.png" style="max-width: 100px; width: 50%" alt="">

	</a>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer login</title>
    </head>
    <body>
        
        <h2>Welcome Customer!</h2><br/><br/>
        <h3>Enter your login credentials.</h3><br/><br/>
        <form METHOD="get">
         Enter your mobile number: 
        <INPUT TYPE="TEXT" NAME="num" required > <br/><br/>
        Enter your password:
        <INPUT TYPE="PASSWORD" NAME="pwd" required><br/><br/>
        <button  type="submit">Submit</button>
        </form><br/>
        <form ACTION ="signup.jsp" METHOD="post">
            <button  type="submit">Sign up!!</button>
        </form>
        <br/><br/>
        <%
            int a;
            String u = request.getParameter("num");
            String p = request.getParameter("pwd");                            
            
            if(u!=null&&p!=null)
            {
                Cutomer_Backend c = new Cutomer_Backend();
                a = c.login(u,p,0);                
                if(a==1)
                {
                   session.setAttribute("u", u);                   
                   response.sendRedirect("Customer.jsp"); 
                }
                          else
                        { 
                            %>
                            
                            <script>
                            alert('Invalid credentials');
                            </script>
                        <%
                         }                                                                              
                }
                
            
            %>
           
        
    </body>
</html>