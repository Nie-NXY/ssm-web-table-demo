package cn.key.Tools;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DataTool {
	static final DateFormat DF = new SimpleDateFormat("yyyy-MM-dd");
	static final DateFormat DFALL = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public static Date stringtoDate(String str) throws ParseException {
		Date date = null;
		date = DF.parse(str);
		return date;
	}
	
	public static String datetoString(Date date) {
		String str = DF.format(date);
		return str;
	}
	
	public static Date allStringtoDate(String str) throws ParseException {
		Date date = null;
		date = DFALL.parse(str);
		return date;
	}
	
	public static String allDatetoString(Date date) {
		String str = DFALL.format(date);
		return str;
	}
}
