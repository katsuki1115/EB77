<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%
string api_url = "";
String result = "";

//URLの取得
api_url = (String)request.getParameter("url");
if(api_url == null || api_url.equals("")){
	return;
}
try {
	//受け取ったURLに対してHTTPリクエストの実行
	URL url = new URL(api_url);
	String line;
	BufferedReader reader = new BufferedReader(new InputStreamReader(url.openStream()));
	while((line = reader.readLine()) != null) {
		result += line;
	}
	reader.clase();
} catch (NumberFormatException e) {
	out.print("URLの形式が誤っています:" + e);
} catch (Exception e) {
	out.print("I/Oエラーです:" + e);
}
out.print(result);
%>