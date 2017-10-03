<%-- 
    Document   : Day
    Created on : Sep 23, 2017, 11:32:05 AM
    Author     : student11
--%>
<%@include file="AdminHeader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
  <script>
            function validate()
            {
                var status="true";
                
                var regday=/^[A-Za-z ]{3,9}$/
                var day=document.getElementById('txtday').value;
                
                if((day.match(regday)))
                {
                    document.getElementById('valday').innerHTML="";
                }else
                {
                    document.getElementById('valday').innerHTML="Enter day";
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
               <title>Train Day</title>
    </head>
    <body>
        <h2 style="font-family: cursive"><b><u><center>Train Day Details</center></u></b></h2>
         <%
                           String dayname="";
                            String Editid="";
                           
                           if(request.getParameter("eid")!=null)
                           {
                               String sel="select * from tbl_day where day_id='"+request.getParameter("eid")+"'";
                          ResultSet rs=obj.select(sel);
                          if(rs.next())
                          {
                             dayname =rs.getString("day_name");
                               
                              Editid=request.getParameter("eid");
                          }
                           
                           }
                           
                          %>
                           
                            
                            
                            
                <%
                String submit=request.getParameter("save");
        if(submit!=null)
        {
            String day_name=request.getParameter("txtdayname");
           
             if(request.getParameter("hid")!="")
            {
                String up="update tbl_day set day_name='"+day_name+"' where day_id='"+request.getParameter("hid")+"'";
                boolean b=obj.insert(up);
                  if(b)
                {
                    response.sendRedirect("Day.jsp");
                }out.println(up);
            }else
            {
            String ins="insert into tbl_day(day_name)values('"+day_name+"')";
            boolean b=obj.insert(ins);
            if(b)
                {
                    response.sendRedirect("Day.jsp");
                }
                out.println(b);
        }  }
        %> 
     
         <%
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_day where day_id='"+request.getParameter("did")+"'";
                
               boolean b= obj.insert(del);
                if(b)
                {
                response.sendRedirect("Day.jsp");
                }
            } 
         
            %>



                        <form name="f1">
                            <center>
                  
                
                                <table class="table table-hover">
                                     <input type="hidden" name="hid" value="<%=Editid%>" > 
                                    <tr><td>Day Name</td><td><input type="text" id="txtday" value="<%=dayname%>" name="txtdayname"><td><div style="color: red" id="valday"></div></td></td></tr>
                                 
                                    <tr><td></td><td><input type="submit" class="btn btn-primary" onclick="return validate()" name="save" value="Submit">
                                    <input type="reset" class="btn btn-danger" name="Cancel" value="Cancel"></td></tr>
                                    
                                    </table>
                           
                                       <table class="table table-hover">
                     
                     <tr><td><h3 style="font-family: cursive"><u>Train Day Details</u></h3></td></tr>
                     <tr><td><h4><u>Train Day Name</u></h4></td>
                  
                     <%
                              
                     String sel="select * from tbl_day";
                     ResultSet rs=obj.select(sel);
                     while(rs.next())
                     {%>
                    
                     <tr><td><%=rs.getString("day_name")%></td><td>
                              
                             
                           <a href="Day.jsp?eid=<%=rs.getString("day_id")%>">Edit</a> 
                             <a href="Day.jsp?did=<%=rs.getString("day_id")%>">Delete</a></td></tr>
                     
                     <%}
                     %>
              </table>
               </center>
            </form>
        
        
    </body>
</html>
