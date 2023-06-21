<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*"%>
<%

//
//thread.sleep(3000);
ArrayList<String> movies = new ArrayList<String>();
movies.add("wFj7d_fnYTU");
movies.add("WdhMjzfg6-k");
movies.add("hTodxSPLcjQ");
movies.add("dFf4AgBNR1E");

//リクエストされたVIDEOID
String strMovie;
//リクエストされたVIDEOID (int型)
int intMovie;
//YOUTUBE動画を埋め込み表示するためのHTML
String strYoutubeHTML;

strMovie = (String) request.getParameter("movie");
if (strMovie == null || strMovie.equals("")) {
	return;
}
try {
	intMovie = Integer.parseInt(strMovie);
	String videoId = movies.get(intMovie);
	strYoutubeHTML = "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/" + videoId
	+ "?autoplay=1\" frameborder=\"0\"></iframe>";
} catch (NumberFormatException e) {
	return;
} catch (IndexOutOfBoundsException e) {
	return;
}
out.print(strYoutubeHTML);
%>