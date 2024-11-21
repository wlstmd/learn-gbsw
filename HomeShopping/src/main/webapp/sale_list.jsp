<%@ page language="java" import="java.sql.*" import="java.util.*" import="DBPKG.Connect" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Sale List</title>
</head>
<body>
    <%@ include file="header.jsp" %>
    <h2 align="center">회원매출조회</h2>
  <%
    Connection con = Connect.getConnection();
    Statement stmt = con.createStatement();
    String sql = "SELECT m.custno, m.custname, m.grade, SUM(s.pcost * s.amount) AS total_sales " +
                 "FROM member_tbl_02 m " +
                 "JOIN money_tbl_02 s ON m.custno = s.custno " +
                 "GROUP BY m.custno, m.custname, m.grade " +
                 "ORDER BY m.custno";
    ResultSet rs = stmt.executeQuery(sql);
  %>
  <table style="width: 600px; margin: auto;" border="1">
    <tr>
      <th>회원번호</th>
      <th>회원성명</th>
      <th>고객등급</th>
      <th>매출</th>
    </tr>
    <% while (rs.next()) { 
        String grade = rs.getString("grade");
        String gradeDisplay = "";
        if ("A".equals(grade)) {
          gradeDisplay = "VIP";
        } else if ("B".equals(grade)) {
          gradeDisplay = "일반";
        } else if ("C".equals(grade)) {
          gradeDisplay = "직원";
        }
    %>
    <tr>
      <td align="center"><%= rs.getString("custno") %></td>
      <td align="center"><%= rs.getString("custname") %></td>
      <td align="center"><%= gradeDisplay %></td>
      <td align="center"><%= rs.getInt("total_sales") %></td>
    </tr>
    <% } %>
  </table>
<%
rs.close();
stmt.close();
con.close();
%>
</body>
</html>