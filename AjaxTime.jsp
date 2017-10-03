<%-- 
    Document   : AjaxTime
    Created on : Sep 25, 2017, 2:11:12 PM
    Author     : student11
--%>
  <%@page import="java.sql.ResultSet"%>

<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>


      <%
     String trainid= request.getParameter("trainid");
      String time= request.getParameter("time");
      System.out.println(time+"Time ");
      String getTime[]=time.split(":");
      
      int gettimeHrs=Integer.parseInt(getTime[0]);
      int gettimrmins=Integer.parseInt(getTime[1]);
      String timeres="";
      String stid= request.getParameter("stid");
      String routeid= request.getParameter("routeid");
      double speed=0,dist=0,timecalc=0,totime=0;
      int modhrs=0,modmins=0;
      String sel="select * from tbl_train t,tbl_traintype tt where t.train_type=tt.traintype_id and t.train_id='"+request.getParameter("trainid") +"'";
     System.out.println(sel);
      ResultSet rs=obj.select(sel);
      if(rs.next())
      {
          speed=rs.getInt("traintype_speed");
      }
      String selq="select * from tbl_route_station where route_id='"+routeid+"' and station_id='"+stid+"'";
      System.out.println(selq);
      ResultSet rsq=obj.select(selq);
      if(rsq.next())
      {
          dist=rsq.getDouble("rs_distance");
      }
      if(dist==0)
      {
          timeres=time;
      }else{
//timecalc=dist/speed;

timecalc=120.0;
String test=timecalc+"";
totime=60*timecalc;
//modhrs=(totime) %(60);
double val=(totime) %(60);
modmins=(int)totime-modhrs*60;


String setTime[]=(test).split(".");
int settimeHrs=(int)timecalc;
      int settimrmins=(int)totime;
      timeres=(gettimeHrs+settimeHrs+modhrs)+":"+(gettimrmins+settimrmins+modmins);
      }
      System.out.println(dist);
System.out.println(speed);
System.out.println(timecalc=dist/speed);


      %>
 <div id="time">Train Arrival Time<input type="text" value="<%=timeres%>" name="tr_arrivaltime"><br>
                                                    Train Departure Time<input type="text" value="" name="tr_departuretime"></div>