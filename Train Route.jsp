<%-- 
    Document   : Train Route
    Created on : Sep 23, 2017, 3:54:56 PM
    Author     : student11
--%>
<%@include file="AdminHeader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script>
            
            function selRoute(routid)
            {
                 $.ajax({url: "AjaxStation.jsp?routId="+routid, success: function(result){
        $("#stationid").html(result);
       // alert(result)
    }});
            }
              function timeCalc(trainid,time,stid,routeid)
            {
                 $.ajax({url: "AjaxTime.jsp?trainid="+trainid+"&time="+time+"&stid="+stid+"&routeid="+routeid, success: function(result){
        $("#time").html(result);
       // alert(result)
    }});
            }
            
            
            
            </script>
  
    </head>
    <body>
         <center><h2><i><u>Train Route Details</u></i></h2></center>
         <%
                           String tr_arrivaltime="",tr_departuretime="",stationname="",routename="",routeid="",stationid="",dayid="",trainid="";
                            String Editid="";
                           
                           if(request.getParameter("eid")!=null)
                           {
                               String sel="select * from tbl_train_route where tr_id='"+request.getParameter("eid")+"'";
                           ResultSet rs=obj.select(sel);
                          if(rs.next())
                          {
                              stationname=rs.getString("station_name");
                              routename=rs.getString("route_name");
                              tr_arrivaltime=rs.getString("tr_arrivaltime");
                               tr_departuretime=rs.getString("tr_departuretime");
                               dayid=rs.getString("day_id");
                              Editid=request.getParameter("eid");
                          }
                           
                           }
                           
                          %>
                           
                            
                            
                            
                <%
                String submit=request.getParameter("save");
        if(submit!=null)
        {
            String train_name=request.getParameter("train_name");
            String station_name=request.getParameter("station_name");
            String route_name=request.getParameter("route_name");
            String trarrivaltime=request.getParameter("tr_arrivaltime");
            String trdeparturetime=request.getParameter("tr_departuretime");
            String day_id=request.getParameter("day_id");
             if(request.getParameter("hid")!="")
            {
                String up="update tbl_train_route  set train_name='"+train_name+"',station_name='"+station_name+"',route_name='"+route_name+"',tr_arrivaltime='"+tr_arrivaltime+"',tr_departuretime='"+tr_departuretime+"',day_id='"+day_id+"' where tr_id='"+request.getParameter("hid")+"'";
                boolean b=obj.insert(up);
                  if(b)
                {
                    response.sendRedirect("Train Route.jsp");
                }out.println(up);
            }else
            {
            String ins="insert into tbl_train_route(train_name,station_name,route_name,tr_arrivaltime,tr_departuretime,day_id,)values('"+train_name+"','"+station_name+"','"+route_name+"','"+tr_arrivaltime+"','"+tr_departuretime+"','"+day_id+"')";
            boolean b=obj.insert(ins);
            if(b)
                {
                    response.sendRedirect("Train Route.jsp");
                }
                out.println(ins);
        }  }
        %> 
     
         <%
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_train_route where tr_id='"+request.getParameter("did")+"'";
                
               boolean b= obj.insert(del);
                if(b)
                {
                response.sendRedirect("Train Route.jsp");
                }
            } 
         
            %>



                        <form name="f1">
                            <center>
                  
                
                                <table>
                                     <input type="hidden" name="hid" value="<%=Editid%>" > 
                                     
                                     <tr><td>Train Name</td>
                                                <td>
                                         <select name="train_name">
                                             <option value="-1" >Select Train Name</option>
                                              <% String seltrain="select * from tbl_train";
                                                      ResultSet rstarin=obj.select(seltrain);
                                                      while (rstarin.next())
                                                      {%>
                                                      <option value="<%=rstarin.getString("train_id")%>"
                                                              <% if(rstarin.getString("train_id").equals(trainid)){%> selected=""<%        } %>
                                                              ><%=rstarin.getString("train_name")%>
                                         </option>
                                         <%}
                                           %>
                                          </select>         
                                                    
                                        </td>
                                            </tr>
                                        <tr><td>Route Name</td>
                                                <td>
                                                    <select name="route_name" onchange="selRoute(this.value)" >
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
                                                    
                                            </tr>
                                     
                                     <tr><td>Station Name</td>
                                                <td>
                                         <select  id="stationid" name="stationname">
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
                                             <tr><td>Day Name</td>
                                                <td>
                                         <select name="day_id">
                                             <option value="-1" selected>Select Day</option>
                                              <% String seld="select day_id,day_name from tbl_day";
                                                      ResultSet rsd=obj.select(seld);
                                                  
                                                      while (rsd.next())
                                                      {%>
                                                      <option value="<%=rsd.getString("day_id")%>"
                                                              <% if(rsd.getString("day_id").equals(dayid)){%> selected=""<%        } %>
                                                              ><%=rsd.getString("day_name")%>
                                         </option>
                                         <%}
                                           %>
                                          </select>         
                                                    
                                        </td>
                                        <td><input type="button" name="Add" onclick="timeCalc(train_name.value,tr_arrivaltime.value,stationname.value,route_name.value)" value="Calculate">
                                            </tr>
                                            
                                         
                                            
                                            <tr><td>
                                                </td><td><div id="time">Train Arrival Time<input type="time" value="<%=tr_arrivaltime%>" name="tr_arrivaltime"><br>
                                                    Train Departure Time<input type="time" value="<%=tr_departuretime%>" name="tr_departuretime"></div></td></tr>
                                    
                                        <td><input type="submit" name="save" value="Submit"></td>
                                        
                                    <td><input type="reset" name="Cancel" value="Cancel"></td></tr>
                                    
                           
                                       <table>
                     
                     <tr><td><h3><u>TRAIN ROUTE DETAILS</u></h3></td></tr>
                     <tr><td><h4><u>Train Name</u></h4></td>
                         <td><h4><u>Station Name</u></h4></td>
                         <td><h4><u>Route Name</u></h4></td>
                     <td><h4><u>Train Arrival Time</u></h4></td>
                     <td><h4><u>Train Departure Time</u></h4></td></tr>
                     <%
                              
                    String sel="select * from tbl_train_route tr ,tbl_route_station rs,tbl_train t,tbl_day d where tr.rs_id=rs.rs_id and tr.train_id=t.train_id and tr.day_id=d.day_id";  
                     ResultSet rs=obj.select(sel);
                     while(rs.next())
                     {%>
                     
                    
                     <tr>
                          <td><%=rs.getString("station_name")%></td><td>
                              
                              <td><%=rs.getString("route_name")%></td><td>
                         
                         <td><%=rs.getString("tr_arrivaltime")%></td><td>
                              
                              <td><%=rs.getString("tr_departuretime")%></td><td>
                                  
                                  <td><%=rs.getString("day_name")%></td><td>
                           <a href="Train Route.jsp?eid=<%=rs.getString("tr_id")%>">Edit</a> 
                             <a href="Train Route.jsp?did=<%=rs.getString("tr_id")%>">Delete</a></td></tr>
                     
                     <%}
                     %> 
                     </center>
                     </table>
                     </form>
    </body>
</html>
