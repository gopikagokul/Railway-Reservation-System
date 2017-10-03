<%-- 
    Document   : Route Station
    Created on : Sep 23, 2017, 12:35:11 PM
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
               
              
                var type=document.getElementById('stationname').value;
                if(type=="-1")
                {
                    document.getElementById('valtype').innerHTML="Select Station Name";
                    status="false";
                }   
                else
                
                 {
                     document.getElementById('valtype').innerHTML="";

                    }
                    var typee=document.getElementById('routename').value;
                if(typee=="-1")
                {
                    document.getElementById('valtype1').innerHTML="Select Route Name";
                    status="false";
                }else
                
                 {
                     document.getElementById('valtype1').innerHTML="";

                    }
                
                      var regdist=/^[0-9]{1,9}$/;
                var rdist=document.getElementById('rsdist').value;
                alert(rdist);
                if((rdist.match(regdist)))
                {
                    document.getElementById('rdistance').innerHTML="";
                }else
                {
                    document.getElementById('rdistance').innerHTML="Enter Route Distance";
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
        <h2 style="font-family: cursive" ><center>Route Station Details</center></h2>
       
            <%
                           String rsdistance="",stationid="",routeid="";
                            String Editid="";
                           
                           if(request.getParameter("eid")!=null)
                           {
                               String sel="select * from tbl_route_station where rs_id='"+request.getParameter("eid")+"'";
                          ResultSet rs=obj.select(sel);
                          if(rs.next())
                          {
                              stationid =rs.getString("station_id");
                              routeid =rs.getString("route_id");
                             rsdistance =rs.getString("rs_distance");
                               
                              Editid=request.getParameter("eid");
                          }
                           
                           }
                           
                          %>
                           
                            
                            
                            
                <%
                String submit=request.getParameter("save");
        if(submit!=null)
        {
            String route_id=request.getParameter("routename");
            String station_id=request.getParameter("stationname");
            String rs_distance=request.getParameter("rsdist");
           
             if(request.getParameter("hid")!="")
            {
                String up="update tbl_route_station set route_id='"+route_id+"',station_id='"+station_id+"',rs_distance='"+rs_distance+"' where rs_id='"+request.getParameter("hid")+"'";
                boolean b=obj.insert(up);
                  if(b)
                {
                    response.sendRedirect("Route Station.jsp");
                }out.println(up);
            }else
            {
            String ins="insert into tbl_route_station(route_id,station_id,rs_distance)values('"+route_id+"','"+station_id+"','"+rs_distance+"')";
            boolean b=obj.insert(ins);
            if(b)
                {
                    response.sendRedirect("Route Station.jsp");
                }
                out.println(b);
        }  }
        %> 
     
         <%
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_route_station where rs_id='"+request.getParameter("did")+"'";
                
               boolean b= obj.insert(del);
                if(b)
                {
                response.sendRedirect("Route Station.jsp");
                }
            } 
         
            %>
                <form name="f1">
                            
                            <center>
                  
                
                      <table class="table table-hover">

                                
                                     <input type="hidden" name="hid" value="<%=Editid%>" > 
                                     <tr><td>Station Name<div style="color: red" id="valtype"></div></td>
                                                <td>
                                         <select name="stationname"  id="stationname">
                                             <option value="-1" selected>Select Station Name</option>
                                              <% String sel1="select station_id,station_name from tbl_station";
                                                      ResultSet rs1=obj.select(sel1);
                                                      while (rs1.next())
                                                      {%>
                                                      <option value="<%=rs1.getString("station_id")%>"
                                                              <% if(rs1.getString("station_id").equals(stationid)){%> selected=""<%        } %>
                                                              ><%=rs1.getString("station_name")%>
                                         </option>
                                         <%}
                                           %>
                                          </select>         
                                                    
                                        </td>
                                            </tr>
                                            
                                            <tr><td>Route Name<div style="color: red" id="valtype1"></div></td>
                                                <td>
                                         <select name="routename" id="routename">
                                             <option value="-1" selected>Select Route Name</option>
                                              <% String sel2="select route_id,route_name from tbl_route";
                                                      ResultSet rs2=obj.select(sel2);
                                                      while (rs2.next())
                                                      {%>
                                                      <option value="<%=rs2.getString("route_id")%>"
                                                              <% if(rs2.getString("route_id").equals(routeid)){%> selected=""<%        } %>
                                                              ><%=rs2.getString("route_name")%>
                                         </option>
                                         <%}
                                           %>
                                          </select>         
                                                    
                                        </td>
                                            </tr>
                                            
                                            <tr><td>Route Distance</td><td><input required="" type="text"  value="<%=rsdistance%>" id="rsdist" name="rsdist"></td><td><div style="color: red" id="rdistance"></div></td></td></tr>
                                     
                                 
                                    <tr><td><input type="submit" name="save" class="btn btn-primary" onclick="return validate()" value="Submit"></td>
                                    <td><input type="reset" name="Cancel" class="btn btn-danger" value="Cancel"></td></tr>
                                           </table>
                                        <table class="table table-hover">
                     
                     <tr><td><h3 style="font-family: cursive"><u>Route Station Details</u></h3></td></tr>
                     
                     <tr><td><h4><u>Station Name</u></h4></td>
                         <td><h4><u>Route Name</u></h4></td>
                         <td><h4><u>Route Distance</u></h4></td></tr>
                  
                     <%
                              
                     String sel="select * from tbl_route_station rs,tbl_route r,tbl_station s where rs.route_id=r.route_id and rs.station_id=s.station_id";
                     ResultSet rs=obj.select(sel);
                     while(rs.next())
                     {%>
                     <tr><td><%=rs.getString("route_name")%></td><td>
                         <td><%=rs.getString("station_name")%></td><td></td>
                     <td><%=rs.getString("rs_distance")%></td><td>
                              
                             
                           <a href="Route Station.jsp?eid=<%=rs.getString("rs_id")%>">Edit</a> 
                             <a href="Route Station.jsp?did=<%=rs.getString("rs_id")%>">Delete</a></td></tr>
                     
                     <%}
                     %>
              </table>
               </center>
            </form>
        
    </body>
</html>
