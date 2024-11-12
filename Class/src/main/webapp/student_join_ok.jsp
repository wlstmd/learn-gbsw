<%@ page language="java" import="java.sql.*" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
	try {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		String sql = "insert into student values(?, ?, ?, ? ,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		String jinseungstucode = request.getParameter("jinseungstucode");
		String jinseungstuname = request.getParameter("jinseungstuname");
		String jinseungstuaddress = request.getParameter("jinseungstuaddress");
		String jinseungstubir = request.getParameter("jinseungstubir");
		String jinseungclasscode = request.getParameter("jinseungclasscode");
		
		pstmt.setString(1, jinseungstucode);
		pstmt.setString(2, jinseungstuname);
		pstmt.setString(3, jinseungstuaddress);
		pstmt.setString(4, jinseungstubir);
		pstmt.setString(5, jinseungclasscode);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	%>
	<script type="text/javascript">
		alert("학생 등록이 완료되습니다!");
		self.location.href="student_list.jsp";
	</script>
	<%
	} catch(Exception e) {
		%>
		<script type="text/javascript">
			alert("학생 등록이 실패했습니다. 다시 시도해주세요.");
			self.location.href="student_join.jsp";
		</script>
		<%
	}
	%>
