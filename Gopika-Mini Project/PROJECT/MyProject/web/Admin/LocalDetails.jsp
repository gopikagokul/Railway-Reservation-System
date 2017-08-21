<%-- 
    Document   : LocalDetails
    Created on : Aug 12, 2017, 10:47:14 AM
    Author     : student11
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>
<html>
    <head>
        <script src="../Jquery/jquery.min.js"></script>
        
        <script>
        function selplace(distid)
        {
            alert(distid);
            
            $.ajax({url: "AjaxPlace.jsp?districtid="+distid, success: function(result){
        $("#placename").html(result);
    }});
        }
        
        
        
        </script>
         <center><h1><i><u>Locality Details</u></i></h1></center>
    </head>
    
    <body>
        
        <form name="frmlocaldetails">
             
         <center>
                 <%
                     
                           String localnamee="",districtid="",placeid="";
                           String Editid="";
                           if(request.getParameter("eid")!=null)
                           {
                               String sel="select * from tbl_local where local_id='"+request.getParameter("eid")+"'";
                          ResultSet rs=obj.select(sel);
                          if(rs.next())
                          {
                              Editid=request.getParameter("eid");
                              localnamee=rs.getString("local_name");
                              districtid=rs.getString("district_id");
                              placeid=rs.getString("place_id");
                          }
                           
                           
                           }
                         %>
                         
                       <input type="hidden" name="hid" value="<%=Editid%>">  
                
              <%
        String submit=request.getParameter("save");
        if(submit!=null)
        {
            String localname=request.getParameter("txtlocalname");
            String districtname=request.getParameter("distname");
            String placename=request.getParameter("placename");
            if(request.getParameter("hid")!="")
            {
                String up="update tbl_local set local_name='"+localname+"',place_id='"+placename+"' where local_id='"+request.getParameter("hid")+"'";
            boolean b=obj.insert(up);
            
                if(b)
                {
                    response.sendRedirect("LocalDetails.jsp");
                }out.println(up);
            }else
            {
            String ins="insert into tbl_local(local_name,district_id,place_id)values('"+localname+"','"+districtname+"','"+placename+"')";
            boolean b=obj.insert(ins);
            
             if(b)
                {
                    response.sendRedirect("LocalDetails.jsp");
                }
                out.println(b);
        }  }
        %>
        
            
           
        <%
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_local where local_id='"+request.getParameter("did")+"'";
                
               boolean b= obj.insert(del);
                if(b)
                {
                response.sendRedirect("LocalDetails.jsp");
                }
                
            }
            
             %> 
            
            
            
         
        <table>
           
                <tr><td>
	District</td><td>
		    <select id="distname" onchange="selplace(this.value)" name="distname">
                        <option value="1">...Select...</option>
                        <%
                            String sel="select * from tbl_district";
                            ResultSet rs=obj.select(sel);
                            while(rs.next())
                            {
                                %>
                                <option value="<%=rs.getString("district_id")%>"
                                    <% if(rs.getString("district_id").equals(districtid)) {%> selected=""  <%   } %>
                                    ><%=rs.getString("district_name")%></option>
                                    
                                <%}

    %>
                        </select></td></tr><br>
                    <tr><td>
	Place</td><td>
		    <select id="placename" name="placename">
                        <option value="...select..." >...Select...</option>
                        <%
                            String sell="select * from tbl_place";
                            ResultSet rss=obj.select(sell);
                            while(rss.next())
                            {
                                %>
                                <option value="<%=rss.getString("place_id")%>"
                                    <% if(rss.getString("place_id").equals(placeid)) {%> selected=""  <%   } %>
                                   > <%=rss.getString("place_name")%></option>
                                    
                                <%}

    %>
                        
                         </select>
                        </td></tr><br>
    
            
                <tr><td>Local Name</td><td><input type="text" value="<%=localnamee%>" name="txtlocalname"></td></tr>
                <tr><td><input type="submit" name="save" value="Save"></td>
                 <td><input type="reset" name="cancel" value="Cancel"></td></tr>       
            </table>
    
               
                         <table>
                     <tr>
                         <td><h3><u>District Name</u></h3></td>
                         <td><h3><u>Place Name</u></h3></td>
                         <td><h3><u>Locality Name</u></h3></td></tr>
                         <%
                             
                    String sel2="select * from  tbl_local l,tbl_place p,tbl_district d where l.place_id=p.place_id and p.district_id=d.district_id ";
                    ResultSet rs2=obj.select(sel2);
                    while(rs2.next())
                    {%>
                     <tr><td><%=rs2.getString("district_name")%></td>
                         <td><%=rs2.getString("place_name")%></td>
                         <td><%=rs2.getString("local_name")%></td>
                         <td><a href="LocalDetails.jsp?eid=<%=rs2.getString("local_id")%>">Edit</a> 
                         <a href="LocalDetails.jsp?did=<%=rs2.getString("local_id")%>">Delete</a></td></tr>
                    
                    
                    
                    <%} %>
                 </table>
          </center>            
        </form>
    </body>
</html>
