<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원검색</title>
</head>
<body>
    <%@ include file="header.jsp" %>
    <%
        String pre_svalue = request.getParameter("svalue");
        if(pre_svalue == null) pre_svalue = "";
    %>
    
    <h3 align="left">회원검색</h3>
    <form name="frm" action="guest_search.jsp" method="POST">
        <a>검색조건: </a><select name="sindex">
            <option value="userid">회원ID</option>
            <option value="usernm">회원이름</option>
        </select>
        <input type="text" name="svalue" size="10" value="<%=pre_svalue %>">
        <input type="submit" value="검색">
    </form>
    <table width="900" border="1" cellspacing="1">
        <tr style="background-color: silver">
            <td>회원ID</td>
            <td>회원명</td>
            <td>생년월일</td>
            <td>성별</td>
            <td>주소</td>
            <td>직업</td>
            <td width="400">자기소개</td>
        </tr>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;
            try {
                Class.forName("oracle.jdbc.OracleDriver");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
                stmt = conn.createStatement();
                String sindex = request.getParameter("sindex");
                String svalue = request.getParameter("svalue");
                String sql = "select * from MEMBER";
                
                if(svalue != null && !svalue.isEmpty()) {
                    sql += " where " + sindex + " like '%" + svalue + "%' order by " + sindex + " ASC";
                }
                
                rs = stmt.executeQuery(sql);
                
                while(rs.next()) {
                    String userid = rs.getString(1);
                    String username = rs.getString(2);
                    String jumin = rs.getString(4);
                    jumin = jumin.substring(0, 6);
                    String gender = rs.getString(5);
                    
                    if(gender.equals("1")) {
                        gender = "남";
                    } else {
                        gender = "여";
                    }
                    String address = rs.getString(6);
                    String job = rs.getString(7);
                    
                    switch (job) {
                    case "1":
                        job = "학생";
                        break;
                    case "2":
                        job = "회사원";
                        break;
                    case "3":
                        job = "공무원";
                        break;
                    case "4":
                        job = "군인";
                        break;
                    default:
                        job = "기타";
                    }
                    String intro = rs.getString(9);
        %>
                <tr>
                    <td><%=userid%></td>
                    <td><%=username%></td>
                    <td><%=jumin%></td>
                    <td><%=gender%></td>
                    <td><%=job%></td>
                    <td><%=address%></td>
                    <td><%=intro%></td>
                </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        %>
    </table>
    &emsp;&emsp;&emsp;
    <%@ include file="footer.jsp" %>
</body>
</html>