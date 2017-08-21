<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>

<html>
    <head>
     <script src="../Jquery/jquery.min.js"></script>
     
      <script>
        function selplace(distid)
        {
            alert(distid);
            
            $.ajax({url: "AjaxPlace.jsp?districtid="+distid, success: function(result){
        $("#placename").html(result);
    }});
        }
        
        
        
        
        </script>
     
        <script>
       
        function sellocal(placeid)
        {
            alert(placeid);
            
            $.ajax({url: "AjaxLocal.jsp?locallid="+placeid, success: function(result){
        $("#localname").html(result);
    }});
        }
        
        
        
        
        </script>
        
        
        
        
     
     
     
        <center><h1><i><u>Registration Form</u></i></h1></center>
<script>
 function validation()
	{
 var n=document.getElementById("txtname").value;
 var a=document.getElementById("txtaddress").value;

 var e=document.getElementById("txtemail").value;
 var p1=document.getElementById("txtpwd1").value;
 var p2=document.getElementById("txtpwd2").value;
	if(n=="")
		{
		alert("Enter the name");
		return false;
		}
	else if(a=="")
		{
		alert("Enter the Address");
		return false;
		}
	else if((frm.gender[0].checked==false)&&(frm.gender[1].checked==false))
 
		{
		alert("Select Gender");
		return false;
		}
	else if(e=="")
		{
		alert("Enter the Email");
		return false;
		}
  	else if(document.frm.q.value=="1")
		{
		alert("Select Qualification");
		return false;
		}
	else
                   {
		if(p1==p2)
		{
		alert("Success");
		return true;
		}
		else
		{
		alert("Do not match");
		return false;
		}
	}
           }

</script>
    </head>
    
    <body>
        <%
        String submit=request.getParameter("sub");
        if(submit!=null)
        {
            String name=request.getParameter("txtname");
            String address=request.getParameter("txtaddress");
            String gender=request.getParameter("txtgender");
            String email=request.getParameter("txtemail");
            String quli=request.getParameter("txtsel");
            String pwd1=request.getParameter("txtpwd1");
            String pwd2=request.getParameter("txtpwd2");
            String local=request.getParameter("localname");
            String ins="insert into tbl_registration(reg_name,reg_address,reg_gender,reg_email,reg_quli,reg_pwd1,reg_pwd2,local_id)values('"+name+"','"+address+"','"+gender+"','"+email+"','"+quli+"','"+pwd1+"','"+pwd2+"','"+local+"')";
            boolean b=obj.insert(ins);
            out.println(b);
        }
        
        %>

       
        <form name="frm">
	<center>
		<table>

<tr><td>
	Name</td><td> <input type="text" id="name" name="txtname">
</td></tr><br>

<tr><td>
Address	</td><td>
<textarea id="address" name="txtaddress"></textarea>
</td></tr><br>

<tr><td>
	Gender</td><td> <input type="radio" id="gender" value="male" name="txtgender">Male
 		          <input type="radio" id="gender" value="female" name="txtgender">Female
</td></tr><br>
    <tr><td>
	District</td><td>
		    <select id="distname" onchange="selplace(this.value)" name="distname">
                        <option value="1">...Select...</option>
                        <%
                            String sel="select * from tbl_district";
                            ResultSet rs=obj.select(sel);
                            while(rs.next())
                            {
                                %>
                                <option value="<%=rs.getString("district_id")%>">
                                    <%=rs.getString("district_name")%></option>
                                    
                                <%}

    %>
                        </select></td></tr><br>
                    <tr><td>
	Place</td><td>
		    <select id="placename" onchange="sellocal(this.value)" name="placename">
                        <option value="...select..." >...Select...</option>
                        <%
                            String sell="select * from tbl_place";
                            ResultSet rss=obj.select(sell);
                            while(rss.next())
                            {
                                %>
                                <option value="<%=rss.getString("place_id")%>">
                                    <%=rss.getString("place_name")%></option>
                                    
                                <%}

    %>
                        
                         </select>
                        </td></tr><br>
                    
                     <tr><td>
	Locality</td><td>
		    <select id="localname"  name="localname">
                        <option value="1" >...Select...</option>
                        <%
                            String sel2="select * from tbl_local";
                            ResultSet rs2=obj.select(sel2);
                            while(rs2.next())
                            {
                                %>
                                <option value="<%=rs2.getString("local_id")%>">
                                    <%=rs2.getString("local_name")%></option>
                                    
                                <%}

    %>
                        
                         </select>
                        </td></tr><br>
    
<tr><td>
	E-mail</td><td><input type="email" id="email" name="txtemail" >
</td></tr><br>

<tr><td>
	Qualification</td><td>
		    <select name="txtsel" id="q">
			<option value="1" selected>Select</option>
			<option value="BCA" >BCA</option>
			<option value="BSc IT">BSc IT</option>
			<option value="BSc Computer Science">BSc Computer Science</option>
			<option value="MCA">MCA</option>
			
 		    </select></td></tr><br>
<tr><td>
	Password</td><td> <input type="password" id="pwd1" name="txtpwd1">
</td></tr><br>

<tr><td>
	Re-enter Password </td><td><input type="password" id="pwd2" name="txtpwd2">
</td></tr><br>

 <tr>
	<td><input type="submit" value="Submit" name="sub" onClick="return validation()"></td>

	<td><input type="reset" value="Reset"></td>
</tr>
	</center>
</table>
</form>
    </body>
</html>

