<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Information</title>
<style>
	table, th, td {
  		border: 1px solid green;
  		border-collapse: collapse;
  		text-align:center;
	}
	th {
		height:30px;
		background-color:DodgerBlue;
	}
</style>
</head>
<body style="background-color:#FFFDD0;">
	<%
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");
		Statement st = con.createStatement();
	%>
	<table align="center" style="width:70%">
	
		<tr>
		<th><b><% out.println("Roll No."); %></b></th>
		<th><b><% out.println("Name of Student"); %></b></th>
		<th><b><% out.println("City"); %></b></th>
		</tr>
		<%
			String sql = "Select * From stud where rn between "+request.getParameter("rn1")+" and "+request.getParameter("rn2");
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			int rn = rs.getInt(1);
			String name = rs.getString(2);
			String city = rs.getString(3);
		%>
		<tr>
			<td><% out.println("" + rn); %></td>
			<td><% out.println("" + name);%></td>
			<td><% out.println("" + city); 
			}//end of while%> </td>
		</tr>
	</table>

	<%
		
		} 
	catch (Exception e) {
		out.print(e);
	}
	%>
</body>
</html>