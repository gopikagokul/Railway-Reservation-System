<%-- 
    Document   : AjaxLocal
    Created on : Aug 12, 2017, 3:32:33 PM
    Author     : student11
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>
<html>
    <head>
        
    </head>
    <body>
        <%
        String placeid=request.getParameter("locallid");
        %>
        
        <select id="localname" name="localname">
                        <option value="1" >...Select...</option>
                        <%
                            String sel2="select * from tbl_local where local_id='"+placeid+"'";
                            ResultSet rs2=obj.select(sel2);
                            while(rs2.next())
                            {
                                %>
                                <option value="<%=rs2.getString("local_id")%>">
                                    <%=rs2.getString("local_name")%></option>
                                    
                                <%}

    %>
                        
                         </select>
    </body>
</html>
