  <%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>


<select  id="stationid" name="stationname">
                                             <option value="-1" selected>Select Station Name</option>
<% String sel1="select * from tbl_station s,tbl_route_station rs where s.station_id=rs.station_id and rs.route_id='"+request.getParameter("routId")+"' ";
System.out.println(sel1);                                                     
ResultSet rs1=obj.select(sel1);
                                                  
                                                      while (rs1.next())
                                                      {%>
                                                      <option value="<%=rs1.getString("station_id")%>">
                                                              
                                                              <%=rs1.getString("station_name")%>
                                         </option>
                                         <%}
                                           %>
                                          </select>         