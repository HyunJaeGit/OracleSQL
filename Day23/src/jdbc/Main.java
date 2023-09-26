package jdbc;

public class Main {
	public static void main(String[] args) {
		// Controller : 실행할 메서드가 작성된 클래스
		// - run : Account테이블에 실행할 메뉴를 출력
		
		// AccountDAO : Account테이블을 조작할 클래스
		// - selectAll : 테이블 전체를 출력
		// - insert : 테이블에 행 추가
		// - delete : 지정 idx와 동일한 행을 제거
		// - update : 지정 idx와 동일한 행을 수정
		// - selectOne : 지정 idx와 동일한 행만 출력
		
		// AccountVO : Account테이블의 열정보를 가진 클래스
		
		new Controller().run();
	}
}
