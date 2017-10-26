<%-- 
    Document   : LogIn
    Created on : Sep 25, 2017, 2:17:29 PM
    Author     : student13
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="GuestHeader.jsp" %>
<html>
    <head>
         <script>
          
          function validate()
          {
           var status="true";
                
                var reguname=/^[A-Za-z ]{0,5}$/;
                var uname=document.getElementById('txtuname').value;
                
                if((uname.match(reguname)))
                {
                    document.getElementById('valusername').innerHTML="";
                }else
                {
                    document.getElementById('valusername').innerHTML="Enter User Name";
                    status="false";
                }
                
                  var regpwd=/^[A-Za-z0-9 ]{0,9}$/;
                var pwd=document.getElementById('txtpwd').value;
                
                if((pwd.match(regpwd)))
                {
                    document.getElementById('valpassword').innerHTML="";
                }else
                {
                    document.getElementById('valpassword').innerHTML="Enter Password";
                    status="false";
                }
                
     if(status=="true")
            {
                return true;
            }else
            {
                return false;
            }
            
    }
          </script>
      
       </head>
        <title>LogIn Page</title>
       
        
    
    <body>
          <center><b><h2 style="font-family: cursive" ><i><u>LogIn</u></i></h2></b></center>
       
       
        <%
                String submit=request.getParameter("save");
        if(submit!=null)
        {
               String username=request.getParameter("txtuname");
               String password=request.getParameter("txtpwd");

             
            String sel="select * from tbl_registration where uname='"+username+"' and pwd='"+password+"' ";
                 
            String sel1="select * from tbl_admin where adminuname='"+username+"' and adminpwd='"+password+"' ";
          
             ResultSet rs=obj.select(sel);
             ResultSet rs1=obj.select(sel1);
            
           if(rs.next())
            {
            response.sendRedirect("../User/HomePage.jsp");
            }
           else if(rs1.next())
            {
            response.sendRedirect("../Admin/AdminHome.jsp");
            }
        else
            {
             response.sendRedirect("Registration.jsp");
            }
        }
        
        
           
          
        
                 %> 
        <form name="f1">
                            <center>
                  
                
                                <table class="table table-hover">
                             
                                     <tr><td>User Name</td><td><input type="text" id="txtuname" name="txtuname"><td><div style="color: red" id="valusername" ></div></td></td></tr>
                                     <tr><td>Password</td><td><input type="password" id="txtpwd" name="txtpwd"><td><div style="color: red" id="valpassword" ></div></td></td></tr>
                                    <tr><td></td><td><input type="submit" class="btn btn-primary" onclick="return validate()" name="save" value="Submit">
                                    <input type="reset" class="btn btn-danger" name="Cancel" value="Cancel"></td></tr></table>
                                     <table> 
                                    
                                  <tr> <td><a href="Registration.jsp">NewAccount</a></td></tr> </table>
                                    
                       
               </center> 
            </form>
    </body>
</html>
