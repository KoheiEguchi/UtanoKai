package haiku;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Common {
	//認証無しでの閲覧禁止
	public static boolean loginCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		boolean check = false;
		if(session.getAttribute("name") == null) {
			response.sendRedirect("Login");
		}else {
			check = true;
		}
		return check;
	}
	
	//管理人以外の閲覧禁止
	public static boolean adminCheck(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		HttpSession session = request.getSession();
		boolean check = false;
		if(!(session.getAttribute("name").equals("admin"))) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("Top");
			dispatcher.forward(request,response);
		}else {
			check = true;
		}
		return check;
	}
	
	//合言葉に英数字以外が使われていないか確認
	public static boolean passwordJpCheck(String password) {
		boolean check = Pattern.matches("^[0-9a-zA-Z]+$", password);
		return check;
	}
	
	//歌を詠んだ日付を漢数字化
	public static String composeDateChange(ResultSet rs) throws SQLException {
		Date composeDate = rs.getDate("compose_date");
		String date = new SimpleDateFormat("yyyy年M月d日").format(composeDate);
		for(int i = 0; i < date.length(); i++) {
			String num = date.substring(i, i + 1);
			switch(num) {
			case "0":
				date = date.replace("0", "〇");
				break;
			case "1":
				date = date.replace("1", "一");
				break;
			case "2":
				date = date.replace("2", "二");
				break;
			case "3":
				date = date.replace("3", "三");
				break;
			case "4":
				date = date.replace("4", "四");
				break;
			case "5":
				date = date.replace("5", "五");
				break;
			case "6":
				date = date.replace("6", "六");
				break;
			case "7":
				date = date.replace("7", "七");
				break;
			case "8":
				date = date.replace("8", "八");
				break;
			case "9":
				date = date.replace("9", "九");
				break;
			default:
				break;
			}
		}
		return date;
	}
	//歌を詠んだ時刻を漢数字化
	public static String composeTimeChange(ResultSet rs) throws SQLException{
		Time composeTime = rs.getTime("compose_time");
		String time = new SimpleDateFormat("k時m分").format(composeTime);
		for(int i = 0; i < time.length(); i++) {
			String num = time.substring(i, i + 1);
			switch(num) {
			case "0":
				time = time.replace("0", "〇");
				break;
			case "1":
				time = time.replace("1", "一");
				break;
			case "2":
				time = time.replace("2", "二");
				break;
			case "3":
				time = time.replace("3", "三");
				break;
			case "4":
				time = time.replace("4", "四");
				break;
			case "5":
				time = time.replace("5", "五");
				break;
			case "6":
				time = time.replace("6", "六");
				break;
			case "7":
				time = time.replace("7", "七");
				break;
			case "8":
				time = time.replace("8", "八");
				break;
			case "9":
				time = time.replace("9", "九");
				break;
			default:
				break;
			}
		}
		return time;
	}
	
	//genreからgenreNameを取得
	public static String genreName(int genre) {
		String genreName = "";
		switch(genre) {
		case 1:
			genreName = "俳句・川柳";
			break;
		case 2:
			genreName = "短歌";
			break;
		case 3:
			genreName = "長歌";
			break;
		case 4:
			genreName = "都々逸";
			break;
		}
		return genreName;
	}
	
}