<%@ page contentType="text/html; charset=UTF-8" %>
<%
int year = 0;
String[] data = new String[7];
if (request.getParameter("year") != null && !request.getParameter("year").equals("")) {
	year = Integer.parseInt(request.getParameter("year"));
}
switch (year) {
case (2009):
	data[0] = "内田真礼";
	data[1] = "水瀬いのり";
	data[2] = "石見舞奈香";
	data[3] = "下野紘";
	data[4] = "上坂すみれ";
	data[5] = "内田雄馬";
	data[6] = "前田佳織里";
	break;
case (2010):
	data[2] = "内田真礼";
	data[1] = "水瀬いのり";
	data[0] = "石見舞奈香";
	data[3] = "下野紘";
	data[4] = "上坂すみれ";
	data[5] = "内田雄馬";
	data[6] = "前田佳織里";
	break;
case (2011):
	data[5] = "内田真礼";
	data[6] = "水瀬いのり";
	data[2] = "石見舞奈香";
	data[3] = "下野紘";
	data[4] = "上坂すみれ";
	data[1] = "内田雄馬";
	data[0] = "前田佳織里";
	break;
default:
	data = null;
	break;
}
%>
<ol>
	<%
	if (data != null) {
		for (String name : data)
			out.print("<li>" + name + "</li>");
	}
	%>
</ol>