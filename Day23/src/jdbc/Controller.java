package jdbc;

import java.util.List;
import java.util.Scanner;

import dto.AccountVO;
import model.AccountDAO;

public class Controller {
	private Scanner sc = new Scanner(System.in);
	private List<AccountVO> list;

	public void run() {
		AccountDAO dao = new AccountDAO();
		int menu;
		
		// 연결 디버그)
		// System.out.println(dao.test());
		
		do {
			System.out.println("--------------- 메뉴 ---------------");
			System.out.println("\t 1. 테이블 전체 출력");
			System.out.println("\t 2. 테이블 검색");
			System.out.println("\t 3. 테이블 행 추가");
			System.out.println("\t 4. 테이블 행 제거");
			System.out.println("\t 5. 테이블 행 수정");
			System.out.println("\t 0. 프로그램 종료\n");
			
			System.out.print(">>> ");
			menu = sc.nextInt();
			
			int idx, row;
			
			switch (menu) {
			case 1: 	
				list = dao.selectAll();
				printList();
				break;
				
			case 2:
				idx = getInput();
				System.out.println(dao.selectOne(idx));
				break;
				
			case 3:
				row = dao.insert(getInstance());
				System.out.println(row != 0 ? "성공" : "실패");
				break;
				
			case 4:
				idx = getInput();
				row = dao.delete(idx);
				System.out.println(row != 0 ? "성공" : "실패");
				break;
				
			case 5: 
				idx = getInput();
				row = dao.update(getInstance(), idx);
				System.out.println(row != 0 ? "성공" : "실패");
				break;
				
			case 0:	
				
				
				break;
			default :
				System.out.println("없는 메뉴 입니다");
			}
			
		} while (menu != 0);
		
		System.out.println("\n프로그램이 종료 되었습니다");
		sc.close();
	}
	
	private void printList() {
		for (AccountVO row : list) {
			System.out.println(row);
		}
		System.out.println();
	}
	
	private int getInput() {
		System.out.print("idx 입력 : ");
		int idx = sc.nextInt();
		
		return idx;
	}

	private AccountVO getInstance() {
		AccountVO vo = new AccountVO();
		
		System.out.println("ID 입력 :");
		vo.setUserid(sc.next());
		
		System.out.println("PW 입력 :");
		vo.setUserpw(sc.next());
		
		System.out.println("닉네임 입력 :");
		vo.setNick(sc.next());
		
		System.out.println("이메일 입력 :");
		vo.setEmail(sc.next());
		
		return vo;
	}
	
	
	
	
	
}







