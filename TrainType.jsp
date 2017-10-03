<%-- 
    Document   : TrainType
    Created on : Sep 16, 2017, 11:38:36 AM
    Author     : student11
--%>

<%@include file="AdminHeader.jsp" %>
<%@page import="java.sql.ResultSet"%>

<html>
    <head>
      <script>
          
          function validate()
          {
           var status="true";
                
                var regtype=/^[A-Za-z ]{3,15}$/;
                var typename=document.getElementById('txttype').value;
                
                if((typename.match(regtype)))
                {
                    document.getElementById('valtype').innerHTML="";
                }else
                {
                    document.getElementById('valtype').innerHTML="Enter Train Type";
                    status="false";
                }
                
             var regspeed=/^[0-9 ]{1,3}$/;
             var typespeed=document.getElementById('txtspeed').value;
                
               if((typespeed.match(regspeed)))
                {
                    document.getElementById('valspeed').innerHTML="";
                }else
               {
                document.getElementById('valspeed').innerHTML="Enter Train Speed";
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
        <title>Train Type</title>
    </head>
       
    <center><h2 style="font-family: cursive"><i><u><b>Train Type</b></u></i></h2></center>

    <body>
        
         <%
                           String traintypename="",traintypespeed="";
                            String Editid="";
                           
                           if(request.getParameter("eid")!=null)
                           {
                               String sel="select * from tbl_traintype where traintype_id='"+request.getParameter("eid")+"'";
                          ResultSet rs=obj.select(sel);
                          if(rs.next())
                          {
                              traintypename=rs.getString("traintype_name");
                               traintypespeed=rs.getString("traintype_speed");
                              Editid=request.getParameter("eid");
                          }
                           
                           }
                           
                          %>
                           
                            
                            
                            
                <%
                String submit=request.getParameter("save");
        if(submit!=null)
        {
            String traintype_name=request.getParameter("txttraintypename");
            String traintype_speed=request.getParameter("txttraintypespeed");
             if(request.getParameter("hid")!="")
            {
                String up="update tbl_traintype set traintype_name='"+traintype_name+"',traintype_speed='"+traintype_speed+"' where traintype_id='"+request.getParameter("hid")+"'";
                boolean b=obj.insert(up);
                  if(b)
                {
                    response.sendRedirect("TrainType.jsp");
                }out.println(up);
            }else
            {
            String ins="insert into tbl_traintype(traintype_name,traintype_speed)values('"+traintype_name+"','"+traintype_speed+"')";
            boolean b=obj.insert(ins);
            if(b)
                {
                    response.sendRedirect("TrainType.jsp");
                }
                out.println(b);
        }  }
        %> 
     
         <%
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_traintype where traintype_id='"+request.getParameter("did")+"'";
                
               boolean b= obj.insert(del);
                if(b)
                {
                response.sendRedirect("TrainType.jsp");
                }
            } 
         
            %>

                        <form name="f1">
                            <center>
                                <table class="table table-hover">
                                     <input type="hidden" name="hid" value="<%=Editid%>" > 
                                    <tr><td>Train Type Name</td><td><input type="text" id="txttype" required="" value="<%=traintypename%>" name="txttraintypename"><td><div style="color: red" id="valtype"></div></td></td></tr>
                                    <tr><td>Train Type Speed</td><td><input type="text" id="txtspeed" required="" value="<%=traintypespeed%>" name="txttraintypespeed">In Km<td><div style="color: red" id="valspeed"></div></td></td></tr>
                                    <tr><td></td><td><input type="submit" class="btn btn-primary" name="save" onclick="return validate()" value="Submit">
                                    <input type="reset" class="btn btn-danger" name="Cancel" value="Cancel"></td></tr>
                             </table>
                                    <table class="table table-hover">
                     <tr><td><h3 style="font-family: cursive"><u>Train Type Details</u></h3></td></tr>
                     <tr><td><h4><u>Train Type Name</u></h4></td>
                     <td><h4><u>Train Speed</u></4></td></tr>
                     <%
                              
                     String sel="select * from tbl_traintype";
                     ResultSet rs=obj.select(sel);
                     while(rs.next())
                     {%>
                    
                     <tr><td><%=rs.getString("traintype_name")%></td><td>
                              
                              <td><%=rs.getString("traintype_speed")%></td><td>
                           <a href="TrainType.jsp?eid=<%=rs.getString("traintype_id")%>">Edit</a> 
                             <a href="TrainType.jsp?did=<%=rs.getString("traintype_id")%>">Delete</a></td></tr>
                     
                     <%}
                     %>
                 </table>
               </center>
            </form>
    </body>
</html>
