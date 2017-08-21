<%-- 
    Document   : AjaxPlace
    Created on : Aug 12, 2017, 12:03:28 PM
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
        String distid=request.getParameter("districtid");
        %>
        
         <select id="placename" name="placename">
                        <option value="1" >...Select...</option>
                        <%
                            String sell="select * from tbl_place where district_id='"+distid+"'";
                            ResultSet rss=obj.select(sell);
                            while(rss.next())
                            {
                                %>
                                <option value="<%=rss.getString("place_id")%>">
                                    <%=rss.getString("place_name")%></option>
                                    
                                <%}

    %>
                        
                         </select>
    </body>
</html>
