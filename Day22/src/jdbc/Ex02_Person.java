package jdbc;

import java.util.List;
import java.util.Scanner;

import dto.PersonVO;
import model.PersonDAO;

public class Ex02_Person {
	static void printList(List<PersonVO> list) {
		for (PersonVO row : list) {
			String msg = row.getName() + "\t"
						+ row.getHeight() + "\t"
						+ row.getBirth();
						
			System.out.println(msg);
		}
		System.out.println();
	}
	
	
	public static void main(String[] args) {
		// 1. Person 테이블을 모두 출력
		PersonDAO dao = new PersonDAO();
		List<PersonVO> list = dao.selectAll();
		
		printList(list);
		
		
		// 2. 사용자에게 입력 받은 내용을 Person에 추가
		Scanner sc = new Scanner(System.in);
		PersonVO per = PersonVO.InputInstance(sc);
		
		int row = dao.insert(per);
		System.out.println(row != 0 ? "성공" : "실패");
		System.out.println();
		
		
		// 3. 추가 후 다시 테이블 출력
		printList(dao.selectAll());
		sc.close();
		
	}
}
