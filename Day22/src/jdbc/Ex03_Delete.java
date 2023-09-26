package jdbc;

import java.util.List;
import java.util.Scanner;

import dto.PersonVO;
import model.PersonDAO;

public class Ex03_Delete {
	public static void main(String[] args) {
		// 1. Person 테이블을 모두 출력
		PersonDAO dao = new PersonDAO();
		List<PersonVO> list = dao.selectAll();

		Ex02_Person.printList(list);

		// 2. 사용자에게 입력 받은 내용을 Person에 추가
		Scanner sc = new Scanner(System.in);
		String name;

		System.out.println("삭제할 이름 : ");
		name = sc.next();

		String msg = "error!!!!!!!! error!!!!!!!!\n";
		int row = dao.delete(name);
		if (row == 0)
			System.err.println(msg+msg+msg+msg+msg+msg+msg+msg+msg+msg+msg+msg+msg+msg+msg+msg+msg+msg+msg+msg+msg);
		else
			System.out.println("success!!");

		Ex02_Person.printList(dao.selectAll());
		sc.close();
	}
}
