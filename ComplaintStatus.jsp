

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import ="Customer.Cutomer_Backend"%>
<!DOCTYPE html>
<html>
    <head>
        <a href="http://localhost:8080/Cutomer_Project/Customer_Frontend.jsp" >
	<img src="D:\Studies\college\6th sem\Java\Project\java-logo-png.png" style="max-width: 100px; width: 50%" alt="">

	</a>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Complaint status</title>
    </head>
    <body>
        <br/>
        
        
       <form  method="GET">
            <h3>Enter the complaint ID to check the status of the complaint:</h3><br/>

       <INPUT TYPE="number" NAME="C_ID" required>
       <br/><br/>
        <INPUT TYPE="SUBMIT">
        </form>
        <br/><br/>
        <%
            int s=0;
            if(request.getParameter("C_ID")!=null)
            {    s = Integer.parseInt(request.getParameter("C_ID"));
            
            Cutomer_Backend c = new Cutomer_Backend();
            String z = session.getAttribute("u").toString();            
            String s1 = c.status_dev(s,z);
            out.println(s1);
            
            }
            
          %>
        
          <br/>
          <%
            if(request.getParameter("C_ID")!=null)
            {   
             Cutomer_Backend c = new Cutomer_Backend();
             String z = session.getAttribute("u").toString();   
             String s1 = c.status_cat(s,z);
                out.println(s1);
            
            }
            
          %>
          <br/>
           <%
            if(request.getParameter("C_ID")!=null)
            {   
             Cutomer_Backend c = new Cutomer_Backend();
             String z = session.getAttribute("u").toString();   
             String s1 = c.status_comp(s,z);
                out.println(s1);
            
            }
            
          %>
          <br/>
          <%
            if(request.getParameter("C_ID")!=null)
            {   
             Cutomer_Backend c = new Cutomer_Backend();
             String z = session.getAttribute("u").toString();   
             String s1 = c.status_status(s,z);
                out.println(s1);
            
            }
            
          %>
          <br/><br/>
    </body>
</html>