package cl.usach.ms_reportes;

import java.util.Calendar;
import java.util.Date;

public class TestClass {
	public static void main(String[] args) {
		Integer anio = 2024;
		Integer mes = 4;
		Integer minus = 3;
		Calendar calendar = Calendar.getInstance();
		calendar.set(anio,mes,1,0,0);//month is 0 based
		calendar.add(Calendar.MONTH, -minus);
		Date date1 = calendar.getTime();
		
		
		
		Calendar calendar2 = Calendar.getInstance();
		
		calendar2.set(anio,mes,1,0,0);//month is 0 based
		calendar2.set(Calendar.DATE, calendar2.getActualMaximum(Calendar.DATE));
		calendar2.add(Calendar.MONTH, -minus);
		
		
		
		Date date2 = calendar2.getTime();
		
//		calendar.add(Calendar.MONTH, -1);
//		Date date2 = calendar.getTime();
		
		
		
        
        System.out.println(date1.toString());
        System.out.println(date2.toString());
	}
}
