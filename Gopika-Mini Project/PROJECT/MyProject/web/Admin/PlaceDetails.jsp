<%-- 
    Document   : PlaceDetails
    Created on : Aug 7, 2017, 12:12:36 PM
    Author     : student11
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>
<html>
     <head>
         <center><h1><i><u>Place Details</u></i></h1></center>
    </head>
    <body>
        <form name="frmplacedetails">
            <center>
                <%
                           String placenamee="",districtid="";
                                String Editid="";
                           
                           if(request.getParameter("eid")!=null)
                           {
                               String sel="select * from tbl_place where place_id='"+request.getParameter("eid")+"'";
                          ResultSet rs=obj.select(sel);
                          if(rs.next())
                          {
                               Editid=request.getParameter("eid");
                              placenamee=rs.getString("place_name");
                              districtid=rs.getString("district_id");
                          }
                           
                           
                           }
                              %>
                            <input type="hidden" name="hid" value="<%=Editid%>"> 
                            <%
                
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_place where place_id='"+request.getParameter("did")+"'";
                
               boolean b= obj.insert(del);
                if(b)
                {
                response.sendRedirect("PlaceDetails.jsp");
                }
                
            }
                    
      
        String submit=request.getParameter("save");
        if(submit!=null)
        {
            String placename=request.getParameter("txtplacename");
            String districtname=request.getParameter("distname");
             if(request.getParameter("hid")!="")
            {
                String up="update tbl_place set place_name='"+placename+"',district_id='"+districtname+"' where place_id='"+request.getParameter("hid")+"'";
                boolean b=obj.insert(up);
                  if(b)
                {
                    response.sendRedirect("PlaceDetails.jsp");
                }out.println(up);
            }else
            {
            String ins="insert into tbl_place(place_name,district_id)values('"+placename+"','"+districtname+"')";
            boolean b=obj.insert(ins);
            if(b)
                {
                    response.sendRedirect("PlaceDetails.jsp");
                }
                out.println(b);
        }  }
        %>  
        <table>
           
                <tr><td>
	District</td><td>
		    <select id="distname" name="distname">
                        <option value="...select..." >...Select...</option>
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
            
                <tr><td>Place Name</td><td><input type="text" value="<%=placenamee%>" name="txtplacename"></td></tr>
                <tr><td><input type="submit" name="save" value="Save"></td>
                 <td><input type="reset" name="cancel" value="Cancel"></td></tr>       
            </table>
                        
                         <table>
                     <tr><td><h3><u>Place Name</u></h3></td>
                     <td><h3><u>District Name</u></h3></td></tr>
                         <%
                             
                    String sel1="select * from tbl_place p,tbl_district d where p.district_id=d.district_id";
                    ResultSet rs1=obj.select(sel1);
                    while(rs1.next())
                    {%>
                    <tr><td><%=rs1.getString("place_name")%></td><td><%=rs1.getString("district_name")%></td><td><a href="PlaceDetails.jsp?eid=<%=rs1.getString("place_id")%>">Edit</a>    <a href="PlaceDetails.jsp?did=<%=rs1.getString("place_id")%>">Delete</a></td></tr>
                    
                    
                    
                    <%} %>
                 </table>
          </center>            
        </form>
    </body>
</html>
