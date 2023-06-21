package biz.no1s.kenshu;

import java.io.IOException;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator

import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;;
import javax.servlet.http.HttpSession;

import org.apache.catalina.tribes.Member;

@WebServlet("/content3")
public class Content3 extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpResponse response) throws ServletException, IOException{
		//常にdoPostを呼び出す
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpResponse response) throws ServletException, IOException{
		//リクエスト文字コードの設定
		request.setCharacterEncoding("UTF-8");
		//セッション取得
		HttpSession session = request.getSession();
		String member = "";
		int index = 0;
		//メンバー情報の配列
		String[] data ＝｛
			"内田真礼", "水瀬いのり", "石見舞奈香", "下野紘", "上坂すみれ", "前田佳織里","花澤香菜",
		};
		//投票したメンバーの値を取得
		member = request.getParameter("member");
		if(member == null || member.equals("")) {
			//空なら空白を表示
			return;
		}else {
			try {
				index = Integer.parseInt(member);
			} catch (NumberFormatException e) {
				//数値でなければ空白を表示
				return;
			}
		}
		//Memberから投票情報を取得
		ArrayList<Member> members = (ArrayList<Member>)session.getAttribute("members");
		if(members == null) {
			//初回アクセスの場合メンバーのリストを作成
			members = new ArrayList<Member>();
			for(String name : data) {
				//メンバーオブジェクトを作成して、リストに代入
				Member m = new Member();
				m.name = name;
				m.vote = 0;
				members.add(m);
			}
		}
		//投票したメンバーの投票数をカウントアップ
		members.get(index).vote++;
		//セッションに投票情報を格納
		session.setAttribute("members", members);
		//表示するためのメンバーリストをコピーを作成
		ArrayList<Member> members4json = new ArrayList<Member>(members);
		//メンバーリストを投票順に並び替え
		Collections.sort(members4json, new Comparator<Member>() {
			@Override public int compare(Member m1, Member m2) {
				return m1.vote > m2.vote ? -1 : 1;
			}
		});
		//メンバーリストを利用したJSONデータ(String)の生成
		Gson gson = new Gson();
		//メンバーリストをJSON形式に変更
		String result = gson.toJson(members4json);
		System.out.println(result);
		request.setAttribute("result", result);
		//JSPに転送
		String forward = "/ajax-java/content3.jsp";
		request.getRequestDispatcher(forward).forward(request, response);
		
	}
}
