<%-- 
    Document   : Station
    Created on : Sep 23, 2017, 10:12:00 AM
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
                
                var regstation=/^[A-Za-z ]{3,15}$/;
                var stationname=document.getElementById('txtname').value;
                
                if((stationname.match(regstation)))
                {
                    document.getElementById('valname').innerHTML="";
                }else
                {
                    document.getElementById('valname').innerHTML="Enter Station Name";
                    status="false";
                }
                
             var regmaster=/^[A-Za-z ]{3,15}$/;
             var stationmaster=document.getElementById('txtmaster').value;
                
               if((stationmaster.match(regmaster)))
                {
                    document.getElementById('valmaster').innerHTML="";
                }else
               {
                document.getElementById('valmaster').innerHTML="Enter Station Master";
                   status="false";
                }
                
             var regno=/^[0-9 ]{3,15}$/;
             var stationno=document.getElementById('txtno').value;
                
               if((stationno.match(regno)))
                {
                    document.getElementById('valno').innerHTML="";
                }else
               {
                document.getElementById('valno').innerHTML="Enter Station Number";
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
        <title>Train Station</title>
    </head>
    
     <center><h2 style="font-family: cursive"><b><i><u>Station Details</u></i></b></h2></center>
    
    <body>
       
        <%
                           String stationname="",stationmaster="",stationphno="";
                            String Editid="";
                           
                           if(request.getParameter("eid")!=null)
                           {
                               String sel="select * from tbl_station where station_id='"+request.getParameter("eid")+"'";
                          ResultSet rs=obj.select(sel);
                          if(rs.next())
                          {
                              stationname=rs.getString("station_name");
                             stationmaster=rs.getString("station_master");
                              stationphno=rs.getString("station_phno");
                             
                              Editid=request.getParameter("eid");
                          }
                           
                           }
                           
                          %>
                           
                            
                            
                            
                <%
                String submit=request.getParameter("save");
        if(submit!=null)
        {
            String station_name=request.getParameter("txtstationname");
            String station_master=request.getParameter("txtstationmaster");
              String station_phno=request.getParameter("txtstationphno");
            
             if(request.getParameter("hid")!="")
            {
                String up="update tbl_station set station_name='"+ station_name+"',station_master='"+station_master+"',station_phno='"+ station_phno+"' where station_id='"+request.getParameter("hid")+"'";
                boolean b=obj.insert(up);
                  if(b)
                {
                    response.sendRedirect("Station.jsp");
                }out.println(up);
            }else
            {
            String ins="insert into tbl_station(station_name,station_master,station_phno)values('"+station_name+"','"+station_master+"','"+station_phno+"')";
            boolean b=obj.insert(ins);
            if(b)
                {
                    response.sendRedirect("Station.jsp");
                }
                out.println(b);
        }  }
        %> 
     
         <%
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_station where station_id='"+request.getParameter("did")+"'";
                
               boolean b= obj.insert(del);
                if(b)
                {
                response.sendRedirect("Station.jsp");
                }
            } 
         
            %>



                        <form name="f1">
                            <center>
                  
                
                                <table class="table table-hover">
                                     <input type="hidden" name="hid" value="<%=Editid%>" > 
                                    <tr><td>Station Name</td><td><input type="text" id="txtname" value="<%=stationname%>" name="txtstationname"><td><div style="color: red" id="valname"></div></td></td></tr>
                                    <tr><td>Station Master</td><td><input type="text" id="txtmaster" value="<%=stationmaster%>" name="txtstationmaster"><td><div style="color: red" id="valmaster"></div></td></td></tr>
                                       <tr><td>Station Phone Number</td><td><input type="text" id="txtno" value="<%=stationphno%>" name="txtstationphno"><td><div style="color: red" id="valno"></div></td></td></tr>
                                    <tr><td></td><td><input type="submit" onclick="return validate()" class="btn btn-primary" name="save" value="Submit">
                                    <input type="reset" class="btn btn-danger" name="Cancel" value="Cancel"></td></tr>
                                    
                                    </table>
                           
                                       <table class="table table-hover">
                     
                     <tr><td><h3 style="font-family: cursive"><u>Station Details</u></h3></td></tr>
                     <tr><td><h4><u>Station Name</u></h4></td>
                     <td><h4><u>Station Master</u></h4></td>
                     <td><h4><u>Station Phone Number</u></h4></td></tr>
                     <%
                              
                     String sel="select * from tbl_station";
                     ResultSet rs=obj.select(sel);
                     while(rs.next())
                     {%>
                    
                     <tr><td><%=rs.getString("station_name")%></td><td>
                              
                              <td><%=rs.getString("station_master")%></td><td>
                                   <td><%=rs.getString("station_phno")%></td><td>
                           <a href="Station.jsp?eid=<%=rs.getString("station_id")%>">Edit</a> 
                             <a href="Station.jsp?did=<%=rs.getString("station_id")%>">Delete</a></td></tr>
                     
                     <%}
                     %>
                 </table>
               </center>
            </form>
    </body>
</html>
