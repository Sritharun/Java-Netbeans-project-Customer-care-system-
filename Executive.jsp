<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <a href="http://localhost:8080/Cutomer_Project/Customer_Frontend.jsp" >
	<img src="D:\Studies\college\6th sem\Java\Project\java-logo-png.png" style="max-width: 100px; width: 50%" alt="">

	</a>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Executive Login</title>
    </head>
    <body>
        <h1><b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; WELCOME TO VIT-JAVA CUSTOMER CARE LOGIN </b></h1>
        <br/><br/>
        <h3>Dear Executive, kindly choose an option to continue.</h3><br/>
        
        <form  ACTION = PendingComplaints.jsp method="POST">

        <button name="exec_category" type="submit" >View registered and pending complaints </button>

        </form> <br/>

        <form  ACTION = RectifiedComplaints.jsp method="POST">

        <button name="exec_category" type="submit" >View resolved complaints</button>


        </form>
        
        
        
    </body>
</html>