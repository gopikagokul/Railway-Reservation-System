<%-- 
    Document   : Registration
    Created on : Sep 23, 2017, 10:32:10 AM
    Author     : student11
--%>

<%@page import="java.sql.ResultSet"%>
<%@include file="GuestHeader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <title>Registration Page</title>
        
         <script>
          
          function validate()
          {
              
//           var status="true";
//                
//                var regfname=/^[A-Za-z ]{3,10}$/;
//                var fname=document.getElementById('txtfirstname').value;
//                
//                if((fname.match(regfname)))
//                {
//                    document.getElementById('valfirstname').innerHTML="";
//                }else
//                {
//                    document.getElementById('valfirstname').innerHTML="Enter First Name";
//                    status="false";
//                }
//                
//                 var regmname=/^[A-Za-z ]{0,6}$/;
//                var mname=document.getElementById('txtmidname').value;
//                
//                if((mname.match(regmname)))
//                {
//                    document.getElementById('valmidname').innerHTML="";
//                }else
//                {
//                    document.getElementById('valmidname').innerHTML="Enter Middle Name";
//                    status="false";
//                }
//                
//                
//                 var reglname=/^[A-Za-z ]{3,10}$/;
//                var lname=document.getElementById('txtlastname').value;
//                
//                if((lname.match(reglname)))
//                {
//                    document.getElementById('vallastname').innerHTML="";
//                }else
//                {
//                    document.getElementById('vallastname').innerHTML="Enter Last Name";
//                    status="false";
//                }
//                
//                 
//                 var regaddress=/^[A-Za-z ]{3,10}$/;
//                var address=document.getElementById('address').value;
//                
//                if((address.match(regaddress)))
//                {
//                    document.getElementById('valaddress').innerHTML="";
//                }else
//                {
//                    document.getElementById('valaddress').innerHTML="Enter Address";
//                    status="false";
//                }
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                
//                   var regph=/^[0-9 ]{0,9}$/;
//                var ph=document.getElementById('ph').value;
//                
//                if((ph.match(regph)))
//                {
//                    document.getElementById('valph').innerHTML="";
//                }else
//                {
//                    document.getElementById('valph').innerHTML="Enter Phone Number";
//                    status="false";
//                }
//                
//                 var regemail=/^[A-Za-z0-9@. ]{0,9}$/;
//                var email=document.getElementById('email').value;
//                
//                if((email.match(regemail)))
//                {
//                    document.getElementById('valemail').innerHTML="";
//                }else
//                {
//                    document.getElementById('valemail').innerHTML="Enter Email";
//                    status="false";
//                }
//                
//                 var reuname=/^[0-9 ]{0,9}$/;
//                var uname=document.getElementById('uname').value;
//                
//                if((uname.match(reuname)))
//                {
//                    document.getElementById('valuname').innerHTML="";
//                }else
//                {
//                    document.getElementById('valuname').innerHTML="Enter User Name";
//                    status="false";
//                }
//                
//                 var regpwd=/^[0-9 ]{0,9}$/;
//                var pwd=document.getElementById('pwd').value;
//                
//                if((pwd.match(regpwd)))
//                {
//                    document.getElementById('valpwd').innerHTML="";
//                }else
//                {
//                    document.getElementById('valpwd').innerHTML="Enter Password";
//                    status="false";
//                }
//     if(status=="true")
//            {
//                return true;
//            }else
//            {
//                return false;
//           }
//           
    }
    
    </script>
    </head>
    
        
    <center><b><h2 style="font-family: cursive" ><i><u>Registration</u></i></h2></b></center></head>
    <body>
         
                           
      <%
                String submit=request.getParameter("save");
        if(submit!=null)
        {
            String f_name=request.getParameter("txtfirstname");
            String m_name=request.getParameter("txtmidname");
            String l_name=request.getParameter("txtlastname");
            String r_address=request.getParameter("txtaddress");
            String r_gender=request.getParameter("txtgender");
            String r_dob=request.getParameter("txtdob");
            String r_ph=request.getParameter("txtph");
            String r_email=request.getParameter("txtemail");
            String r_uname=request.getParameter("txtusername");
            String r_pwd=request.getParameter("txtpwd");
             if(request.getParameter("hid")!="")
            {
            String ins="insert into tbl_registration(reg_fname,reg_mname,reg_lname,address,gender,dob,mob,email,uname,pwd)values('"+f_name+"','"+m_name+"','"+l_name+"','"+r_address+"','"+r_gender+"','"+r_dob+"','"+r_ph+"','"+r_email+"','"+r_uname+"','"+r_pwd+"')";
            boolean b=obj.insert(ins);
            if(b)
                {
                    response.sendRedirect("Registration.jsp");
                }
                out.println(b);
        
            }  
        }
        %> 
 
      <body>
        <form name="f1">
                            <center>
                  
                
                                <table class="table table-hover">
                                    
                                     <tr><td>First Name</td><td><input type="text" id="txtfirstname" name="txtfirstname"><td>
                                             <div style="color: red" id="valfirstname" ></div></td></td></tr>
                                     <tr><td>Middle Name</td><td><input type="text" id="txtmidname" name="txtmidname"><td>
                                             <div style="color: red" id="valmidname" ></div></td></td></tr>
                                     <tr><td>Last Name</td><td><input type="text" id="txtlastname"  name="txtlastname"><td>
                                             <div style="color: red" id="vallastname" ></div></td></td></tr>
                                     
<tr><td>
Address	</td><td>
<textarea id="address" name="txtaddress" ></textarea><td><div style="color: red" id="valaddress" ></div></td>
</td></tr>

<tr><td>
	Gender</td><td><input type="radio" id="gender" value="Male" name="txtgender">Male
 		          <input type="radio" id="gender" value="Female" name="txtgender">Female<td><div style="color: red" id="valgender" ></div></td>
</td></tr>
<tr><td>
	Date Of Birth</td><td><input type="date" id="dob" name="txtdob" ><td><div style="color: red" id="valdob" ></div></td>
</td></tr>
<tr><td>
	Phone Number</td><td><input type="text" id="ph" name="txtph" ><td><div style="color: red" id="valph" ></div></td>
</td></tr>

<tr><td>
	E-mail</td><td><input type="email" id="email" name="txtemail" ><td><div style="color: red" id="valemail" ></div></td>
</td></tr>

<tr><td>
	User Name</td><td> <input type="text" id="uname" name="txtusername"><td><div style="color: red" id="valuname" ></div></td>
</td></tr>

<tr><td>
	Password</td><td> <input type="password" id="pwd" name="txtpwd"><td><div style="color: red" id="valpwd" ></div></td>
</td></tr><br>

                                    <tr><td></td><td><input type="submit" class="btn btn-primary" name="save" onclick="return validate()" value="Submit">
                                    <input type="reset" class="btn btn-danger" name="Cancel" value="Cancel"></td></tr>
                                    
                                    
                                </table>
                                      
                    </center>
    </body>
</html>
