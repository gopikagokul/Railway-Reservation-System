<%-- 
    Document   : search
    Created on : Oct 23, 2017, 5:00:56 AM
    Author     : student9
--%>

<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="UserHeader.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        
        
        <script>
            
            function getList(date,to,from)
            {
                 $.ajax({url: "SearchAjax.jsp?date="+date+"&to="+to+"&from="+from, success: function(result){
                         alert(result)
        $("#list").html(result);
       // alert(result)
    }});
            }
            </script>
              
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>
    </head>
    <body>
      
        <center><h2 style="font-family: cursive"><u>Search</u></h2></center>
        <%
            String stationname="",stationid="",date1="",comid="";
         
             if(request.getParameter("search")!=null)
                           {
                             
                         
                             
                          }
                          
            
            
            
            %>
       
          <form name="f1">
                            <center>
                  
                
                                <table class="table table-hover">
                                   
                                     
                                        
                                     
                                     <tr><td>From</td>
                                                <td>
                                         <select  id="stationid" name="stationfromname">
                                             <option value="-1" selected>From</option>
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
                                          
                                           <tr><td>To</td>
                                                <td>
                                         <select  id="stationid" name="stationtoname">
                                             <option value="-1" selected>To</option>
                                              <% String sel2="select station_id,station_name from tbl_station";
                                                      ResultSet rs2=obj.select(sel2);
                                                  
                                                      while (rs2.next())
                                                      {%>
                                                      <option value="<%=rs2.getString("station_id")%>"
                                                              <% if(rs2.getString("station_id").equals(stationid)){%> selected=""<%        } %>
                                                              ><%=rs2.getString("station_name")%>
                                         </option>
                                         <%}
                                           %>
                                          </select>   
                                            
                                          
                                   
                                    <tr><td>Date</td><td><input type="date" id="txtdate" name="txtdate"></td></tr>
                                    
                                              <tr><td>Class<div style="color: red" id="valtype1"></div></td>
                                                <td>
                                         <select name="compartmentname" id="compartmentname">
                                             <option value="-1" selected>Class Name</option>
                                              <% String sel3="select com_id,com_name from tbl_compartment";
                                                      ResultSet rs3=obj.select(sel3);
                                                      while (rs3.next())
                                                      {%>
                                                      <option value="<%=rs3.getString("com_id")%>"
                                                              <% if(rs3.getString("com_id").equals(comid)){%> selected=""<%        } %>
                                                              ><%=rs3.getString("com_name")%>
                                         </option>
                                         <%}
                                           %>
                                          </select>         
                                          
                                    
                                    <tr><td></td><td><input type="button" class="btn btn-primary" name="search" value="Search" onclick="getList(txtdate.value,stationtoname.value,stationfromname.value)"  >
                                            
                                            
                                    <input type="reset" class="btn btn-danger" name="Cancel" value="Cancel"></td></tr>
                                    
                                </table>
                            </center>
                                          
                                          
                                          <div id="list"></div>
                                          
                                          
        </form>
    </body>
</html>

