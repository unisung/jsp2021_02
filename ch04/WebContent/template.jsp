<%@ page contentType="text/html; charset=UTF-8" %>
<%
		 String pageTitle =(String)request.getAttribute("PAGETITLE");
         String contentPage=request.getParameter("CONTENTPAGE");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=pageTitle %></title>
</head>
<body>
<table width="600" border="1" cellpadding="2" cellspacing="0">
	<tr>
	    <td colspan=2><jsp:include page="./module/top.jsp" flush="false"/></td>
	</tr>
	<tr height="400">
	   <td width="150" valign="top"><jsp:include page="./module/left.jsp" flush="false"/></td>
	   <td width="450" valign="top">
	          <jsp:include page="<%=contentPage%>" flush="false"/>
	   </td>
	</tr>
	<tr>
	   <td colspan=2><jsp:include page="./module/bottom.jsp" flush="false"/>
	</tr>

</table>
</body>
</html>