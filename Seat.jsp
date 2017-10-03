<%-- 
    Document   : Seat.jsp
    Created on : Sep 25, 2017, 6:34:52 AM
    Author     : student9
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
               
              
                var type=document.getElementById('trainname').value;
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
                
                      var secount=/^[0-9]{1,9}$/;
                var stcount=document.getElementById('scount').value;
                alert(stcount);
                if((stcount.match(secount)))
                {
                    document.getElementById('seatcount').innerHTML="";
                }else
                {
                    document.getElementById('seatcount').innerHTML="Enter Seat Count" ;
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
    <body>
        <h2 style="font-family: cursive" ><center>Seat Details</center></h2>
       
            <%
                           String seatcount="",trainid="",compartmentid="";
                            String Editid="";
                           
                           if(request.getParameter("eid")!=null)
                           {
                               String sel="select * from tbl_seat where seat_id='"+request.getParameter("eid")+"'";
                          ResultSet rs=obj.select(sel);
                          if(rs.next())
                          {
                              seatcount=rs.getString("seat_count");
                             trainid=rs.getString("train_id");
                             compartmentid=rs.getString("com_id");
                               
                              Editid=request.getParameter("eid");
                          }
                           
                           }
                           
                          %>
                           
                            
                            
                            
                <%
                String submit=request.getParameter("save");
        if(submit!=null)
        {
            String seat_count=request.getParameter("scount");
            String train_id=request.getParameter("trainname");
            String com_id=request.getParameter("compartmentname");
           
             if(request.getParameter("hid")!="")
            {
                String up="update tbl_seat set seat_count='"+seat_count+"',train_id='"+train_id+"',com_id='"+com_id+"' where seat_id='"+request.getParameter("hid")+"'";
                boolean b=obj.insert(up);
                  if(b)
                {
                    response.sendRedirect("Seat.jsp");
                }out.println(up);
            }else
            {
            String ins="insert into tbl_seat(seat_count,train_id,com_id)values('"+seat_count+"','"+train_id+"','"+com_id+"')";
            boolean b=obj.insert(ins);
            if(b)
                {
                    response.sendRedirect("Seat.jsp");
                }
                out.println(b);
        }  }
        %> 
     
         <%
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_seat where seat_id='"+request.getParameter("did")+"'";
                
               boolean b= obj.insert(del);
                if(b)
                {
                response.sendRedirect("Seat.jsp");
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
                                         <select name="compartmentname" id="compartmentname">
                                             <option value="-1" selected>Select Compartment Name</option>
                                              <% String sel2="select com_id,com_name from tbl_compartment";
                                                      ResultSet rs2=obj.select(sel2);
                                                      while (rs2.next())
                                                      {%>
                                                      <option value="<%=rs2.getString("com_id")%>"
                                                              <% if(rs2.getString("com_id").equals(compartmentid)){%> selected=""<%        } %>
                                                              ><%=rs2.getString("com_name")%>
                                         </option>
                                         <%}
                                           %>
                                          </select>         
                                                    
                                        </td>
                                            </tr>
                                            
                                            <tr><td>Seat Count</td><td><input required="" type="text"  value="<%=seatcount%>" id="scount" name="scount"></td><td><div style="color: red" id="seatcount"></div></td></td></tr>
                                     
                                 
                                    <tr><td><input type="submit" name="save" class="btn btn-primary" onclick="return validate()" value="Submit"></td>
                                    <td><input type="reset" name="Cancel" class="btn btn-danger" value="Cancel"></td></tr>
                                           </table>
                                        <table class="table table-hover">
                     
                     <tr><td><h3 style="font-family: cursive"><u>Seat Details</u></h3></td></tr>
                     
                     <tr><td><h4><u>Train name</u></h4></td>
                         <td><h4><u>Compartment name</u></h4></td>
                         <td><h4><u>Seat Count</u></h4></td>
                         </tr>
                  
                     <%
                              
                     String sel="select * from tbl_seat s,tbl_compartment c ,tbl_train t where s.train_id=t.train_id and  s.com_id=c.com_id ";
                     ResultSet rs=obj.select(sel);
                     while(rs.next())
                     {%>
                     <tr><td><%=rs.getString("train_name")%></td>
                         <td><%=rs.getString("com_name")%></td>
                         <td><%=rs.getString("seat_count")%></td><td>
                         
                   
                              
                             
                           <a href="Seat.jsp?eid=<%=rs.getString("seat_id")%>">Edit</a> 
                             <a href="Seat.jsp?did=<%=rs.getString("seat_id")%>">Delete</a></td></tr>
                     
                     <%}
                     %>
              </table>
               </center>
            </form>
        
    </body>
</html>
