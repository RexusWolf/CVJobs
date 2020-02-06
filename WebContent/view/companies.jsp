<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="model.Company"%>
<% ArrayList<Company> companies = (ArrayList<Company>) request.getAttribute("companies"); %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Companies</title>
	</head>
		<body>
			<%if (companies.size() != 0) {%>
				<%for(int i=0; i < companies.size() ;i++) { %>
				        <%=companies.get(i).name%> ; <%=companies.get(i).activity%>
				<%}%>
			<%}%>
		</body>
</html>