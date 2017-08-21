<%-- 
    Document   : DistrictDetails
    Created on : Aug 7, 2017, 12:12:24 PM
    Author     : student11
--%>



<%@page import="java.lang.String"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>
<html>
    <head>
         <center><h1><i><u>District Details</u></i></h1></center>
    </head>
    <body>
         <form name="frmdistdetails">
             
                  <center>
                       <%
                           String distrctname="",districtid="";
                            String Editid="";
                           
                           if(request.getParameter("eid")!=null)
                           {
                               String sel="select * from tbl_district where district_id='"+request.getParameter("eid")+"'";
                          ResultSet rs=obj.select(sel);
                          if(rs.next())
                          {
                              distrctname=rs.getString("district_name");
                              Editid=request.getParameter("eid");
                          }
                           
                           }
                           
                          %>
                            <input type="hidden" name="hid" value="<%=Editid%>" > 
             
        <%
        String submit=request.getParameter("save");
        if(submit!=null)
        {
            String distname=request.getParameter("txtdistname");
             if(request.getParameter("hid")!="")
            {
                String up="update tbl_district set district_name='"+distname+"' where district_id='"+request.getParameter("hid")+"'";
                boolean b=obj.insert(up);
                  if(b)
                {
                 response.sendRedirect("DistrictDetails.jsp");
                }out.println(up);
            }else
            {
            String ins="insert into tbl_district(district_name)values('"+distname+"')";
                  boolean b=obj.insert(ins);
                  if(b)
                {
                   response.sendRedirect("DistrictDetails.jsp");
                }
            out.println(b);
        }  }
        %>    
       
        
                           
                         <%
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_district where district_id='"+request.getParameter("did")+"'";
                
               boolean b= obj.insert(del);
                if(b)
                {
                response.sendRedirect("DistrictDetails.jsp");
                }
            } 
            %>
            
            <table>
                <tr><td>District Name</td><td><input type="text" value="<%=distrctname%>" name="txtdistname"></td></tr>
                <tr><td><input type="submit" name="save" value="Save"></td>
                 <td><input type="reset" name="cancel" value="Cancel"></td></tr>                
            </table>
              
                 <table>
                     
                     <tr><td><h2><u>District</u></h2></td></tr>
                     <%
                             
                     String sel="select * from tbl_district";
                     ResultSet rs=obj.select(sel);
                     while(rs.next())
                     {%>
                     <tr><td><%=rs.getString("district_name")%></td><td>
                             <a href="DistrictDetails.jsp?eid=<%=rs.getString("district_id")%>">Edit</a> 
                             <a href="DistrictDetails.jsp?did=<%=rs.getString("district_id")%>">Delete</a></td></tr>
                     
                     <%}
                     %>
                 </table>
                 
                 
          </center>
        </form>
    </body>
</html>
