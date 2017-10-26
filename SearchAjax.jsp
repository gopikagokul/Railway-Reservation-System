<%-- 
    Document   : SearchAjax
    Created on : Oct 23, 2017, 9:19:18 AM
    Author     : student9
--%>

<%@page import="java.sql.ResultSet"%>
<script sre="Jquery/jquery.min.js"></script>
<jsp:useBean id="obj" class="db.db_connection"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Ajax</title>
    </head>
    <body>
        <table class="table table-hover">
         <tr><td><h3 style="font-family: cursive"><u>Search Details</u></h3></td></tr>
                     <tr><td><h4><u>Train Name</u></h4></td><td><h4><u>Route Name</u></h4></td>
                         <td><h4><u>Arrival</u></h4></td><td><h4><u>Departure</u></h4></td>
                         <td><h4><u>Fare</u></h4></td></tr>
        <%

            String date1 = request.getParameter("date");
            String to = request.getParameter("to");
            String from = request.getParameter("from");
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String fare = request.getParameter("fare_rate");
            Date date = null;
            try {
                date = format.parse(date1);
            } catch (ParseException e) {
                e.printStackTrace();
            }
            Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT"));
            calendar.setTime(date);
            System.out.println("Day of the week = "
                    + (calendar.get(Calendar.DAY_OF_WEEK)));

            String sel = "select * from tbl_trainroute_details where station_id='" + from + "' and day_id='" + calendar.get(Calendar.DAY_OF_WEEK) + "'";
            ResultSet rs = obj.select(sel);
            while (rs.next()) {
                String selq = "select * from  tbl_trainroute_details td inner join tbl_trainroutehead th on td.trainroutehead_id=th.trainroutehead_id inner join tbl_route tr on tr.route_id=th.route_id inner join tbl_train t on t.train_id=th.train_id inner join tbl_fare f on f.fare_id=th.fare_id where th.trainroutehead_id = '" + rs.getString("trainroutehead_id") + "' and td.priority>=" + rs.getString("priority") + " and td.station_id='" + to + "' ";
                ResultSet rsq = obj.select(selq);
                if (rsq.next()) {%>
    <tr><td><%=rsq.getString("train_name")%></td>
        <td><%=rsq.getString("route_name")%></td>
        <td><%=rsq.getString("arrival_time")%></td>
        <td><%=rsq.getString("departuretime")%></td>
           <td><%=rsq.getString("fare_rate")%></td>
            
        <td><a href="TrainBookingOne.jsp?tid=<%=rsq.getString("train_id")%>&date=<%=date1%>&from=<%=from%>&to=<%=to%>&fare=<%=fare%>">Book Now</a></td>
    </tr>
    <%}

        }

    %>                           
        </table>
</body>
</html>
