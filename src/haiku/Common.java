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
		String baseDate = new SimpleDateFormat("yyyy年M月d日").format(composeDate);
		
		//西暦を年号表記に変更
		String date = nengouChange(baseDate);
		
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
	//西暦を年号表記に変更
	private static String nengouChange(String date) {
		String changedDate = "";
		
		int toshi = date.indexOf("年");
		int tsuki = date.indexOf("月");
		int hi = date.indexOf("日");
		
		String strYear = date.substring(0, toshi);
		int year = Integer.parseInt(strYear);
		String strMonth = date.substring(toshi + 1, tsuki);
		int month = Integer.parseInt(strMonth);
		String strDay = date.substring(tsuki + 1, hi);
		int day = Integer.parseInt(strDay);
		
		//令和の場合
		if((year >= 2020) || (year == 2019 && month >= 5)) {
			if(year - 2018 == 1) {
				changedDate = "令和" + "元年" + strMonth + "月"+ strDay + "日";
			}else {
				changedDate = "令和" + (year - 2018) + "年" + strMonth + "月"+ strDay + "日";
			}
		//平成の場合
		}else if((year >= 1990) || (year == 1989 && month >= 2) || (year == 1989 && month == 1 && day >= 7)) {
			if(year - 1988 == 1) {
				changedDate = "平成" + "元年" + strMonth + "月" + strDay + "日";
			}else {
				changedDate = "平成" + (year - 1988) + "年" + strMonth + "月"+ strDay + "日";
			}
		//昭和の場合
		}else if((year >= 1927) || (year == 1926 && month == 12 && day >= 25)) {
			if(year - 1925 == 1) {
				changedDate = "昭和" + "元年" + strMonth + "月" + strDay + "日";
			}else {
				changedDate = "昭和" + (year - 1925) + "年" + strMonth + "月"+ strDay + "日";
			}
		//大正の場合
		}else if((year >= 1913) || (year == 1912 && month >= 8) || year == 1912 && month == 7 && day >= 30) {
			if(year - 1911 == 1) {
				changedDate = "大正" + "元年" + strMonth + "月" + strDay + "日";
			}else {
				changedDate = "大正" + (year - 1911) + "年" + strMonth + "月"+ strDay + "日";
			}
		//明治の場合
		}else if((year >= 1869) || (year == 1868 && month >= 2) || (year == 1868 && month == 1 && day >= 25)) {
			if(year - 1867 == 1) {
				changedDate = "明治" + "元年" + strMonth + "月" + strDay + "日";
			}else {
				changedDate = "明治" + (year - 1867) + "年" + strMonth + "月"+ strDay + "日";
			}
		//慶應以前の場合
		}else {
			changedDate = strYear + "年" + strMonth + "月" + strDay + "日";
		}
		return changedDate;
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