package jdbc;

import java.util.List;
import java.util.Scanner;

import dto.PersonVO;
import model.PersonDAO;

public class Ex04_Update {
	public static void main(String[] args) {
		
		PersonDAO dao = new PersonDAO();
		List<PersonVO> list = dao.selectAll();
		
		Ex02_Person.printList(list);
		
		Scanner sc = new Scanner(System.in);
		System.out.println("바꾸고자 하는 이름 입력>> ");
		String name = sc.next();
		
		PersonVO per = PersonVO.InputInstance(sc);
		
		
		int row = dao.update(per, name);
		System.out.println(row != 0 ? "성공" : "실패");
		
		Ex02_Person.printList(dao.selectAll());
		sc.close();
		
		
		
	}
}
