<%-- 
    Document   : Train
    Created on : Sep 23, 2017, 11:41:18 AM
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
                
                var regtrain=/^[A-Za-z ]{3,200}$/
                var trainname=document.getElementById('txttrainname').value;
                
                if((trainname.match(regtrain)))
                {
                    document.getElementById('valtrainname').innerHTML="";
                }else
                {
                    document.getElementById('valtrainname').innerHTML="Enter Train Name";
                    status="false";
                }
                
                var type=document.getElementById('traintype').value;
                if(type=="-1")
                {
                    document.getElementById('valtype').innerHTML="Select Train Type";
                    status="false";
                }else
                
                 {
                     document.getElementById('valtype').innerHTML="";

                    }
                            
            var regtrainno=/^[0-9 ]{1,9}$/
                var trainno=document.getElementById('txttrainno').value;
                
                if((trainno.match(regtrainno)))
                {
                    document.getElementById('valtrainno').innerHTML="";
                }else
                {
                    document.getElementById('valtrainno').innerHTML="Enter Train Number";
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
        <title>Train Details</title>
    </head>
    <body>
        <h2 style="font-family: cursive"><center>Train Details</center></h2>
        <%
                           String trainname="",traintype="",trainstatus="",trainno="",traintypeid="";
                            String Editid="";
                           
                           if(request.getParameter("eid")!=null)
                           {
                           String sel="select * from tbl_train where train_id='"+request.getParameter("eid")+"'";
                           ResultSet rs=obj.select(sel);
                          if(rs.next())
                          {
                              trainname=rs.getString("train_name");
                              traintype=rs.getString("train_type");
                              trainstatus=rs.getString("train_status");
                              trainno=rs.getString("train_no");
                             
                              Editid=request.getParameter("eid");
                          }
                           
                           }
                           
                          %>
                           
                            
                            
                            
                <%
                String submit=request.getParameter("save");
        if(submit!=null)
        {
            String train_name=request.getParameter("trainname");
            String train_type=request.getParameter("traintype");
            String train_status=request.getParameter("trainstatus");
            String train_no=request.getParameter("trainno");
             if(request.getParameter("hid")!="")
            {
                String up="update tbl_train set train_name='"+train_name+"',train_type='"+train_type+"',train_status='"+train_status+"',train_no='"+train_no+"' where train_id='"+request.getParameter("hid")+"'";
                boolean b=obj.insert(up);
                  if(b)
                {
                    response.sendRedirect("Train.jsp");
                }out.println(up);
            }else
            {
               
            String ins="insert into tbl_train(train_name,train_type,train_status,train_no)values('"+train_name+"','"+train_type+"','"+train_status+"','"+train_no+"')";
            boolean b=obj.insert(ins);
            if(b)
                {
                    response.sendRedirect("Train.jsp");
                }
                out.println(b);
        }  }
        %> 
     
         <%
            if(request.getParameter("did")!=null)
            {
                String del="delete from tbl_train where train_id='"+request.getParameter("did")+"'";
                
               boolean b= obj.insert(del);
                if(b)
                {
                response.sendRedirect("Train.jsp");
                }
            } 
         
            %>



                        <form name="f1">
                            <center>
                  
                
                                <table class="table table-hover">
                                     <input type="hidden" name="hid" value="<%=Editid%>" > 
                                     <tr><td>Train Number</td><td><input type="text" id="txttrainno" value="<%=trainno%>" name="trainno"><td><div style="color: red" id="valtrainno"></div></td></td></tr>
                                    <tr><td>Train Name</td><td><input type="text value="<%=trainname%> id="txttrainname" name="trainname"><td><div style="color: red" id="valtrainname"></div></td></td></tr>
                                   
                                            <tr><td>Train Type<div style="color: red" id="valtype"></div></td>
                                              <td>  
                                         <select name="traintype" id="traintype">
                                             <option value="-1" selected>Select Type</option>
                                              <% String sel1="select traintype_id,traintype_name from tbl_traintype";
                                                      ResultSet rs1=obj.select(sel1);
                                                      while (rs1.next())
                                                      {%>
                                                      <option value="<%=rs1.getString("traintype_name")%>"
                                                              <% if(rs1.getString("traintype_id").equals(traintypeid)){%> selected=""<%        } %>
                                                              ><%=rs1.getString("traintype_name")%>
                                         </option>
                                         
                                         <%}
                                           %>
                                          </select>         
                                                    
                                        </td>
                                            </tr>
                                             <tr><td>Train Status</td><td><input type="text" id="txtstatus" value="<%=trainstatus%>" name="trainstatus"><td><div style="color: red" id="valstatus"></div></td></td></tr>
                                      
                                    <tr><td></td><td><input type="submit" name="save" class="btn btn-primary" onclick="return validate()" value="Submit">
                                     <input type="reset" name="Cancel" class="btn btn-danger" value="Cancel"></td></tr>
                                    
                           </table>
                                       <table class="table table-hover">
                     
                     <tr><td><h3 style="font-family: cursive"><u>Train Details</u></h3></td></tr>
                     <tr> <td><h4><u>Train Number</u></h4></td>
                     <td><h4><u>Train Name</u></h4></td>
                     <td><h4><u>Train Type</u></h4></td>
                     <td><h4><u>Train Status</u></h4></td></tr>
                    
                     <%
                              
                     String sel="select * from tbl_train";
                     ResultSet rs=obj.select(sel);
                     while(rs.next())
                     {%>
                    
                     <tr><td><%=rs.getString("train_no")%></td>
                         <td><%=rs.getString("train_name")%></td>
                              
                              <td><%=rs.getString("train_type")%></td>
                              <td><%=rs.getString("train_status")%></td> <td>
                              
                           <a href="Train.jsp?eid=<%=rs.getString("train_id")%>">Edit</a> 
                             <a href="Train.jsp?did=<%=rs.getString("train_id")%>">Delete</a></td></tr>
                     
                     <%}
                     %>
                 </table>
               </center>
            </form>
    </body>
   
</html>
