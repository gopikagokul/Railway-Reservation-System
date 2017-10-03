<%-- 
    Document   : Route
    Created on : Sep 16, 2017, 3:11:38 PM
    Author     : student11
--%>
<%@include file="AdminHeader.jsp" %>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
      
    </head>
     <title>Route Details</title>
        <center><h2 style="font-family: cursive"><i><u>Route Details</u></i></h2></center>
    </head>
    <body>
        
         <%
                           String routename="",routedistance="";
                            String Editid="";
                           
                           if(request.getParameter("eid")!=null)
                           {
                               String sel="select * from tbl_route where route_id='"+request.getParameter("eid")+"'";
                           ResultSet rs=obj.select(sel);
                          if(rs.next())
                          {
                              routename=rs.getString("route_name");
                               routedistance=rs.getString("route_distance");
                              Editid=request.getParameter("eid");
                          }
                           
                           }
                           
                          %>
                           
                            
                            
                            
                <%
                String submit=request.getParameter("save");
        if(submit!=null)
        {String route_name1=request.getParameter("txtfrom")+"-"+request.getParameter("txtto");
           String route_name=request.getParameter("txtto")+"-"+request.getParameter("txtfrom");
            String route_distance=request.getParameter("routedistance");
             if(request.getParameter("hid")!="")
            {
                String up="update tbl_route set route_name='"+route_name+"',route_distance='"+route_distance+"' where route_id='"+request.getParameter("hid")+"'";
                boolean b=obj.insert(up);
                  if(b)
                {
                    response.sendRedirect("Route.jsp");
                }out.println(up);
            }else
            {
            String ins="insert into tbl_route(route_name,route_distance)values('"+route_name+"','"+route_distance+"')";
            String insq="insert into tbl_route(route_name,route_distance)values('"+route_name1+"','"+route_distance+"')";
            boolean b=obj.insert(ins);
            boolean b2=obj.insert(insq);
            if(b)
                {
                    response.sendRedirect("Route.jsp");
                }
                out.println(b);
        }  }
        %> 
     
         <%
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_route where route_id='"+request.getParameter("did")+"'";
                
               boolean b= obj.insert(del);
                if(b)
                {
                response.sendRedirect("Route.jsp");
                }
            } 
         
            %>



                        <form name="f1">
                            <center>
                  
                
                                <table class="table table-hover">
                                     <input type="hidden" name="hid" value="<%=Editid%>" > 
                                     <tr><td>From</td><td><input type="text" name="txtfrom" ><td><div style="color: red" id="valday"></div></td>
                                     <tr> <td> To</td><td><input type="text" name="txtto" ><td><div style="color: red" id="valday"></div></td>
                                         <td><input style="visibility: hidden" type="text" value="<%=routename%>" name="routename"></td></tr>
                                    <tr><td>Route Distance<div style="color: red" id="valtype"></div></td><td><input type="text" value="<%=routedistance%>" name="routedistance"></td></tr>
                                    <tr><td><input type="submit" name="save" value="Submit" class="btn btn-primary"></td>
                                     <td><input type="reset" name="Cancel" value="Cancel" class="btn btn-danger"></td></tr>
                                     </table>
                           
                                       <table class="table table-hover">
                     
                     <tr><td><h3 style="font-family: cursive"><u>Route Details</u></h3></td></tr>
                     <tr><td><h4><u>Route Name</u></h4></td>
                     <td><h4><u>Route Distance</u></h4></td></tr>
                     <%
                              
                     String sel="select * from tbl_route";
                     ResultSet rs=obj.select(sel);
                     while(rs.next())
                     {%>
                    
                     <tr><td><%=rs.getString("route_name")%></td><td>
                              
                              <td><%=rs.getString("route_distance")%></td><td>
                           <a href="Route.jsp?eid=<%=rs.getString("route_id")%>">Edit</a> 
                             <a href="Route.jsp?did=<%=rs.getString("route_id")%>">Delete</a></td></tr>
                     
                     <%}
                     %>
                 </table>
               </center>
            </form>
    </body>
</html>
        
        
        
        
       