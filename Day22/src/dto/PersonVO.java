package dto;

import java.sql.Date;
import java.util.Scanner;

/*
	NAME		VARCHAR2(20)
	HEIGHT		NUMBER
	BIRTH		DATE
*/

public class PersonVO {
	private String name;
	private double height;
	private Date birth;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getHeight() {
		return height;
	}
	public void setHeight(double height) {
		this.height = height;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public static PersonVO InputInstance(Scanner sc) {
		PersonVO per = new PersonVO();
		
		System.out.println("이름 신장 생년월일(YYYY-MM-DD) 입력 >> ");
		per.name 	= sc.next();
		per.height 	= sc.nextDouble();
		per.birth	= Date.valueOf(sc.next());
		
		return per;
		
	}

	
	
}
