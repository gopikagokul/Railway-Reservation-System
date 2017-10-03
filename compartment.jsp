<%-- 
    Document   : compartment
    Created on : Sep 20, 2017, 2:38:16 PM
    Author     : student11
--%>

<%@include file="AdminHeader.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        
         <head>
      <script>
          
          function validate()
          {
           var status="true";
                
                var regcompartment=/^[A-Za-z ]{3,15}$/;
                var compartment=document.getElementById('txtcompartment').value;
                
                if((compartment.match(regcompartment)))
                {
                    document.getElementById('valcompartment').innerHTML="";
                }else
                {
                    document.getElementById('valcompartment').innerHTML="Enter Compartment";
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
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Train Compartment</title>
    </head>
       
        
    <center><b><h2 style="font-family: cursive" ><i><u>Compartment Details</u></i></h2></b></center></head>
    <body>
         
                             <%
                           String compartmentname="";
                            String Editid="";
                           
                           if(request.getParameter("eid")!=null)
                           {
                               String sel="select * from tbl_compartment where com_id='"+request.getParameter("eid")+"'";
                          ResultSet rs=obj.select(sel);
                          if(rs.next())
                          {
                             compartmentname =rs.getString("com_name");
                               
                              Editid=request.getParameter("eid");
                          }
                           
                           }
                           
                          %>
                           
                            
                            
                            
                <%
                String submit=request.getParameter("save");
        if(submit!=null)
        {
            String com_name=request.getParameter("txtcompartmentname");
           
             if(request.getParameter("hid")!="")
            {
                String up="update tbl_compartment set com_name='"+com_name+"' where com_id='"+request.getParameter("hid")+"'";
                boolean b=obj.insert(up);
                  if(b)
                {
                    response.sendRedirect("compartment.jsp");
                }out.println(up);
            }else
            {
            String ins="insert into tbl_compartment(com_name)values('"+com_name+"')";
            boolean b=obj.insert(ins);
            if(b)
                {
                    response.sendRedirect("compartment.jsp");
                }
                out.println(b);
        }  }
        %> 
     
         <%
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_compartment where com_id='"+request.getParameter("did")+"'";
                
               boolean b= obj.insert(del);
                if(b)
                {
                response.sendRedirect("compartment.jsp");
                }
            } 
         
            %>



                        <form name="f1">
                            <center>
                  
                
                                <table class="table table-hover">
                                     <input type="hidden" name="hid" value="<%=Editid%>" > 
                                    <tr><td>Compartment Name</td><td><input type="text" id="txtcompartment" value="<%=compartmentname%>" name="txtcompartmentname"><td><div style="color: red" id="valcompartment" ></div></td></td></tr>
                                 
                                    <tr><td></td><td><input type="submit" class="btn btn-primary" name="save" onclick="return validate()" value="Submit">
                                    <input type="reset" class="btn btn-danger" name="Cancel" value="Cancel"></td></tr>
                                    
                                    
                                </table>
                                       <table class="table table-hover">
                     
                     <tr><td><h3 style="font-family: cursive"><u>Compartment Details</u></h3></td></tr>
                     <tr><td><h4><u>Compartment Name</u></h4></td>
                  
                     <%
                              
                     String sel="select * from tbl_compartment";
                     ResultSet rs=obj.select(sel);
                     while(rs.next())
                     {%>
                    
                     <tr><td><%=rs.getString("com_name")%></td><td>
                              
                             
                           <a href="compartment.jsp?eid=<%=rs.getString("com_id")%>">Edit</a> 
                             <a href="compartment.jsp?did=<%=rs.getString("com_id")%>">Delete</a></td></tr>
                     
                     <%}
                     %>
              </table>
               </center>
            </form>
    </body>
</html>

                                    
                           
                                
                                
                                
                                
                                
                                
                    