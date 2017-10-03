<%-- 
    Document   : fare.jsp
    Created on : Sep 25, 2017, 9:13:06 AM
    Author     : student9
--%>
<%@include file="AdminHeader.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
     <head>
         
    <head>
         <script>
            function validate()
            {
                var status="true";
               
              
                var type=document.getElementById('trainnname').value;
                if(type=="-1")
                {
                    document.getElementById('valtype').innerHTML="Select Train Name";
                    status="false";
                }   
                else
                
                 {
                     document.getElementById('valtype').innerHTML="";

                    }
                    var typee=document.getElementById('compartmentname').value;
                if(typee=="-1")
                {
                    document.getElementById('valtype1').innerHTML="Select Compartment Name";
                    status="false";
                }else
                
                 {
                     document.getElementById('valtype1').innerHTML="";

                    }
                
                      var frrate=/^[0-9]{1,9}$/;
                var frate=document.getElementById('rfare').value;
                alert(frate);
                if((frate.match(frrate)))
                {
                    document.getElementById('rtfare').innerHTML="";
                }else
                {
                    document.getElementById('rtfare').innerHTML="Enter Route Distance";
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
      <title>Fare Details</title>
      
    <body>
        <h2 style="font-family: cursive" ><center>Fare Details</center></h2>
       
            <%
                           String trainid="",comid="",farerate="",stationid="";
                            String Editid="";
                           
                           if(request.getParameter("eid")!=null)
                           {
                               String sel="select * from tbl_fare where fare_id='"+request.getParameter("eid")+"'";
                          ResultSet rs=obj.select(sel);
                          if(rs.next())
                          {
                              trainid =rs.getString("train_id");
                              comid =rs.getString("com_id");
                             farerate =rs.getString("rfare");
                               
                              Editid=request.getParameter("eid");
                          }
                           
                           }
                           
                          %>
                           
                            
                            
                            
                <%
                String submit=request.getParameter("save");
        if(submit!=null)
        {
           String train_id=request.getParameter("trainname");
            String com_id=request.getParameter("comname");
            String rfare=request.getParameter("farerate");
           
             if(request.getParameter("hid")!="")
            {
                String up="update tbl_fare set train_id='"+train_id+"',com_id='"+com_id+"',fare_rate='"+farerate+"' where fare_id='"+request.getParameter("hid")+"'";
                boolean b=obj.insert(up);
                  if(b)
                {
                    response.sendRedirect("fare.jsp");
                }out.println(up);
            }else
            {
            String ins="insert into tbl_fare(train_id,com_id,fare_rate)values('"+train_id+"','"+com_id+"','"+rfare+"')";
            boolean b=obj.insert(ins);
            if(b)
                {
                    response.sendRedirect("fare.jsp");
                }
                out.println(b);
        }  }
        %> 
     
         <%
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_fare where fare_id='"+request.getParameter("did")+"'";
                
               boolean b= obj.insert(del);
                if(b)
                {
                response.sendRedirect("fare.jsp");
                }
            } 
         
            %>
                <form name="f1">
                            
                            <center>
                  
                
                      <table class="table table-hover">

                                
                                     <input type="hidden" name="hid" value="<%=Editid%>" > 
                                     <tr><td>Train Name<div style="color: red" id="valtype"></div></td>
                                                <td>
                                         <select name="trainname"  id="trainname">
                                             <option value="-1" selected>Select Train Name</option>
                                              <% String sel1="select train_id,train_name from tbl_train";
                                                      ResultSet rs1=obj.select(sel1);
                                                      while (rs1.next())
                                                      {%>
                                                      <option value="<%=rs1.getString("train_id")%>"
                                                              <% if(rs1.getString("train_id").equals(trainid)){%> selected=""<%        } %>
                                                              ><%=rs1.getString("train_name")%>
                                         </option>
                                         <%}
                                           %>
                                          </select>         
                                                    
                                        </td>
                                            </tr>
                                            
                                            <tr><td>Compartment Name<div style="color: red" id="valtype1"></div></td>
                                                <td>
                                         <select name="compname" id="compname">
                                             <option value="-1" selected>Select Compartment Name</option>
                                              <% String sel2="select com_id,com_name from tbl_compartment";
                                                      ResultSet rs2=obj.select(sel2);
                                                      while (rs2.next())
                                                      {%>
                                                      <option value="<%=rs2.getString("com_id")%>"
                                                              <% if(rs2.getString("com_id").equals(comid)){%> selected=""<%        } %>
                                                              ><%=rs2.getString("com_name")%>
                                         </option>
                                         <%}
                                           %>
                                          </select>         
                                                    
                                        </td>
                                            </tr>
                                            
                                            <tr><td>Fare</td><td><input required="" type="text"  value="<%=farerate%>" id="fare" name="fare"></td><td><div style="color: red" id="rtfare"></div></td></td></tr>
                                     
                                 
                                    <tr><td><input type="submit" name="save" class="btn btn-primary" onclick="return validate()" value="Submit"></td>
                                    <td><input type="reset" name="Cancel" class="btn btn-danger" value="Cancel"></td></tr>
                                           </table>
                                        <table class="table table-hover">
                     
                     <tr><td><h3 style="font-family: cursive"><u>Route Station Details</u></h3></td></tr>
                     
                     <tr><td><h4><u>Train Name</u></h4></td>
                         <td><h4><u>Compartment Name</u></h4></td>
                         <td><h4><u>Fare</u></h4></td></tr>
                  
                     <%
                              
                     String sel="select * from tbl_fare";
                     ResultSet rs=obj.select(sel);
                     while(rs.next())
                     {%>
                     <tr><td><%=rs.getString("train_name")%></td><td>
                         <td><%=rs.getString("compartment_name")%></td><td></td>
                     <td><%=rs.getString("fare_rate")%></td><td>
                              
                             
                           <a href="fare.jsp?eid=<%=rs.getString("fare_id")%>">Edit</a> 
                             <a href="fare.jsp?did=<%=rs.getString("fare_id")%>">Delete</a></td></tr>
                     
                     <%}
                     %>
              </table>
               </center>
            </form>
        
    </body>
</html>
