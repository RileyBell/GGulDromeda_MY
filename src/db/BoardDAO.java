package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import bean.BoardBean;

public class BoardDAO {
	// 글 목록 데이터를 가져오는 메소드
	// 메인에 게시글 뿌린다. > main.jsp
	public static ArrayList<BoardBean> get_board_all_info(int page_num, String local_code) throws Exception{
		
		System.out.println("get_board_all_info 들어왔다요");
		
		// DB 연결!
		Connection conn = DBConnector.getConnection();
		
		// USER_INFO 테이블과 BOARD 테이블의 user_id를 통해 조인하여 USER_INFO에서 USER_NICK을 가져온다.
		// 게시글의 상태 > 삭제된글인지 아닌지 판단하여 가지고 오기 
		// ROWNUM 설명
		String sql = "select * from "
				   + "(select ROWNUM as rnum, a1.* from "
				   + "(select b.BOARD_SUBJECT, b.BOARD_IMG_MAIN, b.BOARD_LIKE, u.USER_NICK, b.BOARD_IDX "
				   + "from USER_INFO u, BOARD b "
				   + "where u.USER_ID = b.BOARD_USER_ID and b.LOCAL_CODE = ? and b.BOARD_STATUS = 0 "
				   + "order by b.BOARD_IDX desc) a1) a2 "
				   + "where a2.rnum >= ? and a2.rnum <= ?";
		
		// 한 번에 게시물을 20개씩 가져오기 위해서.
		// 1 ~ 20, 21 ~ 40, 41 ~ 60 요렇게
		int min = 1 + ((page_num - 1) * 20);
		int max = min + 19;
		
		// SQL문에 ?가 있으므로 PreparedStatement로
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// ?에 값 바인딩
		pstmt.setString(1, local_code);
		pstmt.setInt(2, min);
		pstmt.setInt(3, max);
		
		// SQL 실행
		ResultSet rs = pstmt.executeQuery();
		
		// 빈객체를 담을 ArrayList 생성
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		
		while(rs.next()){
			String board_subject = rs.getString("BOARD_SUBJECT");
			String board_img_main = rs.getString("BOARD_IMG_MAIN");
			int board_like = rs.getInt("BOARD_LIKE");
			String user_nick = rs.getString("USER_NICK");
			int board_idx = rs.getInt("BOARD_IDX");
			
			System.out.println("main.jsp에서 가져온 글의 BOARD_LIKE : " + board_like);
		
			// 해시태그를 가져오는 SQL문 작성
			String sql2 = "select h.BOARD_HASH "
					    + "from BOARD_HASHTAG h "
					    + "where h.BOARD_IDX = ? ";
			
			// ?없있으므로 PreparedStatement
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			
			// ? 에 값 바인딩
						pstmt2.setInt(1, board_idx);
			
			// 쿼리 결과 저장하는 rs_hash
			ResultSet rs_hash = pstmt2.executeQuery();
			
			// while문 안에서 증가시킬 변수
			int i = 0;
			
			String [] board_hash = null;
			
			while(rs_hash.next()){
				// 가져온 해시태그를 담을 String 배열 생성
				board_hash = null;
				
				// rs_hash값
				board_hash[i] = rs_hash.getString("BOARD_HASH");
				
				i++;
				
			}
			
			// 댓글 가져오는 SQL문 작성
			String sql3 = "select COUNT(*) as COMMENT_CNT "
					    + "from BOARD_COMMENT c "
					    + "where c.BOARD_IDX = ?";
			
			// ? 있으니까 PreparedStatement
			PreparedStatement pstmt3 = conn.prepareStatement(sql3);
			
			// ?에 값 바인딩
			pstmt3.setInt(1, board_idx);
			
			ResultSet rs_comment = pstmt3.executeQuery();
			
			rs_comment.next();
			
			// sql에서 select로 count한걸 가져옴
			// 그래서 컬럼이름을 쓸 수 없으므로 그냥 가져온 첫번째
			int comment_cnt = rs_comment.getInt("COMMENT_CNT");
			
			// 데이터를 담을 빈객체 생성
			BoardBean bean = new BoardBean();
			
			// 임시로 board_like comment_cnt 주기
			board_like = 12;
			comment_cnt = 17;
			
			// 빈에 데이터 넣기
			bean.setBoard_subject(board_subject);
			bean.setBoard_img_main(board_img_main);
			bean.setBoard_like(board_like);
			bean.setUser_nick(user_nick);
			bean.setBoard_hash(board_hash);
			bean.setComment_cnt(comment_cnt);
			
			// ArrayList 에 bean 객체 넣어주기
			list.add(bean);
		}
	
		// Connection 종료
		conn.close();
		
		// SQL의 결과로 게시글 정보가 담겨있는 bean을 가진 ArrayList 반환
		return list;
	}
	
	// 카테고리별 메인 화면의 게시글을 가지고 오는 메소드
	public static ArrayList<BoardBean> get_baord_category_info(int page_num, String local_code, String board_main) throws Exception{
		
		System.out.println("get_board_category_info 들어왔다요");
		
		// DB 연결
		Connection conn = DBConnector.getConnection();
		
		// 위 get_board_all_info()의 sql문과 비슷함
		// BOARD_INFO 테이블의 조인하여 BOARD_MAIN 컬럼으로 카테고리를 구분한다.
		// BOARD_CATEGORY로 b 와 i를 연결
		// i.BOARD_MAIN = ? >> ?에는 매개변수의 board_main으로 카테고리 값 줌!!
		String sql = "select * from "
				   + "(select ROWNUM as rnum, a1.* from "
				   + "(select b.BOARD_SUBJECT, b.BOARD_IMG_MAIN, b.BOARD_LIKE, u.USER_NICK, b.BOARD_IDX, b.BOARD_CONTENT "
				   + "from USER_INFO u, BOARD b, BOARD_INFO i "
				   + "where u.USER_ID = b.BOARD_USER_ID and b.BOARD_CATEGORY = i.BOARD_CATEGORY "
				   + "and b.LOCAL_CODE = ? and i.BOARD_MAIN = ? and b.BOARD_STATUS = 0 "
				   + "order by b.BOARD_IDX desc) a1) a2 "
				   + "where a2.rnum >= ? and a2.rnum <= ?";
		
		// 한 번에 게시물을 20개씩 가져오기 위해서.
				// 1 ~ 20, 21 ~ 40, 41 ~ 60 요렇게
				int min = 1 + ((page_num - 1) * 20);
				int max = min + 19;
				
				// SQL문에 ?가 있으므로 PreparedStatement로
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				// ?에 값 바인딩
				pstmt.setString(1, local_code);
				pstmt.setString(2, board_main);
				pstmt.setInt(3, min);
				pstmt.setInt(4, max);
				
				// SQL문 실행
				ResultSet rs = pstmt.executeQuery();
				
				// 빈객체를 담을 ArrayList 생성
				ArrayList<BoardBean> list = new ArrayList<BoardBean>();
				
				while(rs.next()){
					String board_subject = rs.getString("BOARD_SUBJECT");
					String board_img_main = rs.getString("BOARD_IMG_MAIN");
					int board_like = rs.getInt("BOARD_LIKE");
					String user_nick = rs.getString("USER_NICK");
					int board_idx = rs.getInt("BOARD_IDX");
					String board_content = rs.getString("BOARD_CONTENT");
					
					// board_content substring으로 자른값으로 다시 저장! > 이건 jsp에서 처리할까? 흠
					// 이문제는 물어보기 board_content를 원래 내용이아닌 자른 내용으로
					// bean에 다시 저장했을때 이 빈이 다른 빈에 영향을 주는지
					// 안줄듯!
					// reDirect할때 request가 사라지기때문에!
					// reDirect할때도 사라지지 않길 원한다면 session에 저장해야함!
					// board_content가 90자가 넘지 않으면 substring에서 에러가 난다.
					// board_content의 글자수를 세서 90이 넘을 경우만 해야함!
					
					// 문자열의 글자 수를 세자!
					char [] count_string;
					count_string = board_content.toCharArray();
					
					// 이게 바로 글자 수
					int cnt = count_string.length;
					System.out.println(cnt);
					
					
					if(cnt > 92){
						// 만약 글자 수가 92가 넘는다면 자르기!
						String temp = board_content.substring(0, 90);
						
						board_content = temp + "...";
					}

					System.out.println(board_content);
					
					// 만약 board_img_main이 null 이면 기본 이미지를 띄우도록 설정
					
					if(board_img_main == null){
						board_img_main = "기본인덱스 이미지 주소";
					}
					
					
					// 해시태그를 가져오는 SQL
					String sql2 = "select h.BOARD_HASH "
						    + "from BOARD_HASHTAG h "
						    + "where h.BOARD_IDX = ? ";
				
					// ?없있으므로 PreparedStatement
					PreparedStatement pstmt2 = conn.prepareStatement(sql2);
					
					// ? 에 값 바인딩
					pstmt2.setInt(1, board_idx);
					
					// 쿼리 결과 저장하는 rs_hash
					ResultSet rs_hash = pstmt2.executeQuery();
					
					// while문 안에서 증가시킬 변수
					int i = 0;
					
					String [] board_hash = null;
					
					while(rs_hash.next()){
						// 가져온 해시태그를 담을 String 배열 생성
						board_hash = null;
						
						// rs_hash값
						board_hash[i] = rs_hash.getString("BOARD_HASH");
						
						i++;
						
					}
					
					// 댓글 가져오는 SQL문 작성
					String sql3 = "select COUNT(*) as COMMENT_CNT "
							    + "from BOARD_COMMENT c "
							    + "where c.BOARD_IDX = ?";
					
					// ? 있으니까 PreparedStatement
					PreparedStatement pstmt3 = conn.prepareStatement(sql3);
					
					// ?에 값 바인딩
					pstmt3.setInt(1, board_idx);
					
					ResultSet rs_comment = pstmt3.executeQuery();
					
					rs_comment.next();
					
					// sql에서 select로 count한걸 가져옴
					// 그래서 컬럼이름을 쓸 수 없으므로 그냥 가져온 첫번째
					int comment_cnt = rs_comment.getInt("COMMENT_CNT");
					
					// 임시로 board_like comment_cnt 주기
					board_like = 12;
					comment_cnt = 17;
					
					// 데이터를 담을 빈객체 생성
					BoardBean bean = new BoardBean();
					
					// 빈에 데이터 넣기
					bean.setBoard_subject(board_subject);
					bean.setBoard_img_main(board_img_main);
					bean.setBoard_like(board_like);
					bean.setUser_nick(user_nick);
					bean.setBoard_hash(board_hash);
					bean.setBoard_content(board_content);
					bean.setComment_cnt(comment_cnt);
					
					// ArrayList 에 bean 객체 넣어주기
					list.add(bean);
					
				}
		
			// Connection 종료
			conn.close();
			
			// SQL의 결과로 게시글 정보가 담겨있는 bean을 가진 ArrayList 반환
			return list;
	}
	
	// 하위 게시판의 글을 가져오는 메소드
	public static ArrayList<BoardBean> get_sub_category_info(int page_num, String local_code, String board_sub) throws Exception{
		
		System.out.println("get_sub_category_info 들어왔다요");
		
		// DB 연결
		Connection conn = DBConnector.getConnection();
		
		// 위 get_board_all_info()의 sql문과 비슷함
		// BOARD_INFO 테이블의 조인하여 BOARD_SUB 컬럼으로 하위 게시판을 구분한다!
		// BOARD_CATEGORY로 b 와 i를 연결
		// i.BOARD_SUB = ? >> ?에는 매개변수의 board_sub으로 카테고리 값 줌!!
		String sql = "select * from "
				   + "(select ROWNUM as rnum, a1.* from "
				   + "(select b.BOARD_SUBJECT, b.BOARD_IMG_MAIN, b.BOARD_LIKE, u.USER_NICK, b.BOARD_IDX, b.BOARD_CONTENT "
				   + "from USER_INFO u, BOARD b, BOARD_INFO i "
				   + "where u.USER_ID = b.BOARD_USER_ID and b.BOARD_CATEGORY = i.BOARD_CATEGORY "
				   + "and b.LOCAL_CODE = ? and i.BOARD_SUB = ? and b.BOARD_STATUS = 0 "
				   + "order by b.BOARD_IDX desc) a1) a2 "
				   + "where a2.rnum >= ? and a2.rnum <= ?";
		
		// 한 번에 게시물을 20개씩 가져오기 위해서.
		// 1 ~ 20, 21 ~ 40, 41 ~ 60 요렇게
		int min = 1 + ((page_num - 1) * 20);
		int max = min + 19;
		
		// SQL문에 ?가 있으므로 PreparedStatement로
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		// ?에 값 바인딩
		pstmt.setString(1, local_code);
		pstmt.setString(2, board_sub);
		pstmt.setInt(3, min);
		pstmt.setInt(4, max);
		
		// SQL문 실행
		ResultSet rs = pstmt.executeQuery();
		
		// 빈객체를 담을 ArrayList 생성
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		
		while(rs.next()){
			String board_subject = rs.getString("BOARD_SUBJECT");
			String board_img_main = rs.getString("BOARD_IMG_MAIN");
			int board_like = rs.getInt("BOARD_LIKE");
			String user_nick = rs.getString("USER_NICK");
			int board_idx = rs.getInt("BOARD_IDX");
			String board_content = rs.getString("BOARD_CONTENT");
			
			// board_content substring으로 자른값으로 다시 저장! > 이건 jsp에서 처리할까? 흠
			// 이문제는 물어보기 board_content를 원래 내용이아닌 자른 내용으로
			// bean에 다시 저장했을때 이 빈이 다른 빈에 영향을 주는지
			// 안줄듯!
			// reDirect할때 request가 사라지기때문에!
			// reDirect할때도 사라지지 않길 원한다면 session에 저장해야함!
			// board_content가 90자가 넘지 않으면 substring에서 에러가 난다.
			// board_content의 글자수를 세서 90이 넘을 경우만 해야함!
			
			// 문자열의 글자 수를 세자!
			char [] count_string;
			count_string = board_content.toCharArray();
			
			// 이게 바로 글자 수
			int cnt = count_string.length;
			System.out.println("board_content count : " + cnt);
			
			
			if(cnt > 92){
				// 만약 글자 수가 92가 넘는다면 자르기!
				String temp = board_content.substring(0, 90);
				
				board_content = temp + "...";
			}

			System.out.println("board_content : " + board_content);
			
			// 만약 board_img_main이 null 이면 기본 이미지를 띄우도록 설정
			
			if(board_img_main == null){
				board_img_main = "기본인덱스 이미지 주소";
			}
			
			
			// 해시태그를 가져오는 SQL
			String sql2 = "select h.BOARD_HASH "
				        + "from BOARD_HASHTAG h "
				        + "where h.BOARD_IDX = ?";
		
			// ?없있으므로 PreparedStatement
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			
			// ? 에 값 바인딩
			pstmt2.setInt(1, board_idx);
			
			// 쿼리 결과 저장하는 rs_hash
			ResultSet rs_hash = pstmt2.executeQuery();
			
			// while문 안에서 증가시킬 변수
			int i = 0;
			
			String [] board_hash = null;
			
			while(rs_hash.next()){
				// 가져온 해시태그를 담을 String 배열 생성
				board_hash = null;
				
				// rs_hash값
				board_hash[i] = rs_hash.getString("BOARD_HASH");
				
				i++;
				
			}
			
			// 댓글 가져오는 SQL문 작성
			String sql3 = "select COUNT(*) as COMMENT_CNT "
					    + "from BOARD_COMMENT c "
					    + "where c.BOARD_IDX = ?";
						
			// ? 있으니까 PreparedStatement
			PreparedStatement pstmt3 = conn.prepareStatement(sql3);
						
			// ?에 값 바인딩
			pstmt3.setInt(1, board_idx);
						
			ResultSet rs_comment = pstmt3.executeQuery();
						
			rs_comment.next();
						
			// sql에서 select로 count한걸 가져옴
			// 그래서 컬럼이름을 쓸 수 없으므로 그냥 가져온 첫번째
			int comment_cnt = rs_comment.getInt("COMMENT_CNT");			
			
			// 임시로 board_like comment_cnt 주기
			board_like = 12;
			comment_cnt = 17;
			
			// 데이터를 담을 빈객체 생성
			BoardBean bean = new BoardBean();
			
			// 빈에 데이터 넣기
			bean.setBoard_subject(board_subject);
			bean.setBoard_img_main(board_img_main);
			bean.setBoard_like(board_like);
			bean.setUser_nick(user_nick);
			bean.setBoard_hash(board_hash);
			bean.setBoard_content(board_content);
			bean.setComment_cnt(comment_cnt);
			
			// ArrayList 에 bean 객체 넣어주기
			list.add(bean);
			
			// 댓글을 가져오는 SQL
		}

	// Connection 종료
	conn.close();
	
	// SQL의 결과로 게시글 정보가 담겨있는 bean을 가진 ArrayList 반환
	return list;
	
	}
	
	// 하위게시판이 없는 게시판 추천순 정렬하여 가져오기
	public static ArrayList<BoardBean> get_baord_order_info(int page_num, String local_code, String board_main) throws Exception{
		
		System.out.println("get_board_order_info 들어왔다요");
		
		// DB 연결
				Connection conn = DBConnector.getConnection();
				
				// 위 get_board_all_info()의 sql문과 비슷함
				// BOARD_INFO 테이블의 조인하여 BOARD_MAIN 컬럼으로 카테고리를 구분한다.
				// BOARD_CATEGORY로 b 와 i를 연결
				// i.BOARD_MAIN = ? >> ?에는 매개변수의 board_main으로 카테고리 값 줌!!
				// 여기에 order by b.BOARD_LIKE 로 바꿔주기!
				String sql = "select * from "
						   + "(select ROWNUM as rnum, a1.* from "
						   + "(select b.BOARD_SUBJECT, b.BOARD_IMG_MAIN, b.BOARD_LIKE, u.USER_NICK, b.BOARD_IDX, b.BOARD_CONTENT "
						   + "from USER_INFO u, BOARD b, BOARD_INFO i "
						   + "where u.USER_ID = b.BOARD_USER_ID and b.BOARD_CATEGORY = i.BOARD_CATEGORY "
						   + "and b.LOCAL_CODE = ? and i.BOARD_MAIN = ? and b.BOARD_STATUS = 0 "
						   + "order by b.BOARD_LIKE desc) a1) a2 "
						   + "where a2.rnum >= ? and a2.rnum <= ?";
				
				// 한 번에 게시물을 20개씩 가져오기 위해서.
				// 1 ~ 20, 21 ~ 40, 41 ~ 60 요렇게
				int min = 1 + ((page_num - 1) * 20);
				int max = min + 19;
				
				// SQL문에 ?가 있으므로 PreparedStatement로
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				// ?에 값 바인딩
				pstmt.setString(1, local_code);
				pstmt.setString(2, board_main);
				pstmt.setInt(3, min);
				pstmt.setInt(4, max);
				
				// SQL문 실행
				ResultSet rs = pstmt.executeQuery();
				
				// 빈객체를 담을 ArrayList 생성
				ArrayList<BoardBean> list = new ArrayList<BoardBean>();
				
				while(rs.next()){
					String board_subject = rs.getString("BOARD_SUBJECT");
					String board_img_main = rs.getString("BOARD_IMG_MAIN");
					int board_like = rs.getInt("BOARD_LIKE");
					String user_nick = rs.getString("USER_NICK");
					int board_idx = rs.getInt("BOARD_IDX");
					String board_content = rs.getString("BOARD_CONTENT");
					
					// board_content substring으로 자른값으로 다시 저장! > 이건 jsp에서 처리할까? 흠
					// 이문제는 물어보기 board_content를 원래 내용이아닌 자른 내용으로
					// bean에 다시 저장했을때 이 빈이 다른 빈에 영향을 주는지
					// 안줄듯!
					// reDirect할때 request가 사라지기때문에!
					// reDirect할때도 사라지지 않길 원한다면 session에 저장해야함!
					// board_content가 90자가 넘지 않으면 substring에서 에러가 난다.
					// board_content의 글자수를 세서 90이 넘을 경우만 해야함!
					
					// 문자열의 글자 수를 세자!
					char [] count_string;
					count_string = board_content.toCharArray();
					
					// 이게 바로 글자 수
					int cnt = count_string.length;
					System.out.println(cnt);
					
					
					if(cnt > 92){
						// 만약 글자 수가 92가 넘는다면 자르기!
						String temp = board_content.substring(0, 90);
						
						board_content = temp + "...";
					}

					System.out.println(board_content);
					
					// 만약 board_img_main이 null 이면 기본 이미지를 띄우도록 설정
					
					if(board_img_main == null){
						board_img_main = "기본인덱스 이미지 주소";
					}
					
					
					// 해시태그를 가져오는 SQL
					String sql2 = "select h.BOARD_HASH "
						    + "from BOARD_HASHTAG h "
						    + "where h.BOARD_IDX = ? ";
				
					// ?없있으므로 PreparedStatement
					PreparedStatement pstmt2 = conn.prepareStatement(sql2);
					
					// ? 에 값 바인딩
					pstmt2.setInt(1, board_idx);
					
					// 쿼리 결과 저장하는 rs_hash
					ResultSet rs_hash = pstmt2.executeQuery();
					
					// while문 안에서 증가시킬 변수
					int i = 0;
					
					String [] board_hash = null;
					
					while(rs_hash.next()){
						// 가져온 해시태그를 담을 String 배열 생성
						board_hash = null;
						
						// rs_hash값
						board_hash[i] = rs_hash.getString("BOARD_HASH");
						
						i++;
						
					}
					
					// 댓글 가져오는 SQL문 작성
					String sql3 = "select COUNT(*) as COMMENT_CNT "
							    + "from BOARD_COMMENT c "
							    + "where c.BOARD_IDX = ?";
								
					// ? 있으니까 PreparedStatement
					PreparedStatement pstmt3 = conn.prepareStatement(sql3);
								
					// ?에 값 바인딩
					pstmt3.setInt(1, board_idx);
								
					ResultSet rs_comment = pstmt3.executeQuery();
								
					rs_comment.next();
								
					// sql에서 select로 count한걸 가져옴
					// 그래서 컬럼이름을 쓸 수 없으므로 그냥 가져온 첫번째
					int comment_cnt = rs_comment.getInt("COMMENT_CNT");	
					
					// 임시로 board_like comment_cnt 주기
					board_like = 12;
					comment_cnt = 17;
					
					// 데이터를 담을 빈객체 생성
					BoardBean bean = new BoardBean();
					
					// 빈에 데이터 넣기
					bean.setBoard_subject(board_subject);
					bean.setBoard_img_main(board_img_main);
					bean.setBoard_like(board_like);
					bean.setUser_nick(user_nick);
					bean.setBoard_hash(board_hash);
					bean.setBoard_content(board_content);
					bean.setComment_cnt(comment_cnt);
					
					// ArrayList 에 bean 객체 넣어주기
					list.add(bean);
					
					// 댓글을 가져오는 SQL
				}
		
			// Connection 종료
			conn.close();
			
			// SQL의 결과로 게시글 정보가 담겨있는 bean을 가진 ArrayList 반환
			return list;
	}
	
	// 하위게시판이 있는 게시판 추천순 정렬하여 가져오기
	public static ArrayList<BoardBean> get_sub_order_info(int page_num, String local_code, String board_sub) throws Exception{
		
		System.out.println("get_sub_order_info 들어왔다요");
		
		// DB 연결
				Connection conn = DBConnector.getConnection();
				
				// 위 get_board_all_info()의 sql문과 비슷함
				// BOARD_INFO 테이블의 조인하여 BOARD_SUB 컬럼으로 하위 게시판을 구분한다!
				// BOARD_CATEGORY로 b 와 i를 연결
				// i.BOARD_SUB = ? >> ?에는 매개변수의 board_sub으로 카테고리 값 줌!!
				// 여기에 order by b.BOARD_LIKE 로 바꿔주기!
				String sql = "select * from "
						   + "(select ROWNUM as rnum, a1.* from "
						   + "(select b.BOARD_SUBJECT, b.BOARD_IMG_MAIN, b.BOARD_LIKE, u.USER_NICK, b.BOARD_IDX, b.BOARD_CONTENT "
						   + "from USER_INFO u, BOARD b, BOARD_INFO i "
						   + "where u.USER_ID = b.BOARD_USER_ID and b.BOARD_CATEGORY = i.BOARD_CATEGORY "
						   + "and b.LOCAL_CODE = ? and i.BOARD_SUB = ? and b.BOARD_STATUS = 0 "
						   + "order by b.BOARD_LIKE desc) a1) a2 "
						   + "where a2.rnum >= ? and a2.rnum <= ?";
				
				// 한 번에 게시물을 20개씩 가져오기 위해서.
				// 1 ~ 20, 21 ~ 40, 41 ~ 60 요렇게
				int min = 1 + ((page_num - 1) * 20);
				int max = min + 19;
				
				// SQL문에 ?가 있으므로 PreparedStatement로
				PreparedStatement pstmt = conn.prepareStatement(sql);
				
				// ?에 값 바인딩
				pstmt.setString(1, local_code);
				pstmt.setString(2, board_sub);
				pstmt.setInt(3, min);
				pstmt.setInt(4, max);
				
				// SQL문 실행
				ResultSet rs = pstmt.executeQuery();
				
				// 빈객체를 담을 ArrayList 생성
				ArrayList<BoardBean> list = new ArrayList<BoardBean>();
				
				while(rs.next()){
					String board_subject = rs.getString("BOARD_SUBJECT");
					String board_img_main = rs.getString("BOARD_IMG_MAIN");
					int board_like = rs.getInt("BOARD_LIKE");
					String user_nick = rs.getString("USER_NICK");
					int board_idx = rs.getInt("BOARD_IDX");
					String board_content = rs.getString("BOARD_CONTENT");
					
					// board_content substring으로 자른값으로 다시 저장! > 이건 jsp에서 처리할까? 흠
					// 이문제는 물어보기 board_content를 원래 내용이아닌 자른 내용으로
					// bean에 다시 저장했을때 이 빈이 다른 빈에 영향을 주는지
					// 안줄듯!
					// reDirect할때 request가 사라지기때문에!
					// reDirect할때도 사라지지 않길 원한다면 session에 저장해야함!
					// board_content가 90자가 넘지 않으면 substring에서 에러가 난다.
					// board_content의 글자수를 세서 90이 넘을 경우만 해야함!
					
					// 문자열의 글자 수를 세자!
					char [] count_string;
					count_string = board_content.toCharArray();
					
					// 이게 바로 글자 수
					int cnt = count_string.length;
					System.out.println("board_content count : " + cnt);
					
					
					if(cnt > 92){
						// 만약 글자 수가 92가 넘는다면 자르기!
						String temp = board_content.substring(0, 90);
						
						board_content = temp + "...";
					}

					System.out.println("board_content : " + board_content);
					
					// 만약 board_img_main이 null 이면 기본 이미지를 띄우도록 설정
					
					if(board_img_main == null){
						board_img_main = "기본인덱스 이미지 주소";
					}
					
					
					// 해시태그를 가져오는 SQL
					String sql2 = "select h.BOARD_HASH "
						        + "from BOARD_HASHTAG h "
						        + "where h.BOARD_IDX = ?";
				
					// ?없있으므로 PreparedStatement
					PreparedStatement pstmt2 = conn.prepareStatement(sql2);
					
					// ? 에 값 바인딩
					pstmt2.setInt(1, board_idx);
					
					// 쿼리 결과 저장하는 rs_hash
					ResultSet rs_hash = pstmt2.executeQuery();
					
					// while문 안에서 증가시킬 변수
					int i = 0;
					
					String [] board_hash = null;
					
					while(rs_hash.next()){
						// 가져온 해시태그를 담을 String 배열 생성
						board_hash = null;
						
						// rs_hash값
						board_hash[i] = rs_hash.getString("BOARD_HASH");
						
						i++;
						
					}
					
					// 댓글 가져오는 SQL문 작성
					String sql3 = "select COUNT(*) as COMMENT_CNT "
							    + "from BOARD_COMMENT c "
							    + "where c.BOARD_IDX = ?";
								
					// ? 있으니까 PreparedStatement
					PreparedStatement pstmt3 = conn.prepareStatement(sql3);
								
					// ?에 값 바인딩
					pstmt3.setInt(1, board_idx);
								
					ResultSet rs_comment = pstmt3.executeQuery();
								
					rs_comment.next();
								
					// sql에서 select로 count한걸 가져옴
					// 그래서 컬럼이름을 쓸 수 없으므로 그냥 가져온 첫번째
					int comment_cnt = rs_comment.getInt("COMMENT_CNT");	
					
					// 임시로 board_like comment_cnt 주기
					board_like = 12;
					comment_cnt = 17;
					
					// 데이터를 담을 빈객체 생성
					BoardBean bean = new BoardBean();
					
					// 빈에 데이터 넣기
					bean.setBoard_subject(board_subject);
					bean.setBoard_img_main(board_img_main);
					bean.setBoard_like(board_like);
					bean.setUser_nick(user_nick);
					bean.setBoard_hash(board_hash);
					bean.setBoard_content(board_content);
					bean.setComment_cnt(comment_cnt);
					
					// ArrayList 에 bean 객체 넣어주기
					list.add(bean);
					
					// 댓글을 가져오는 SQL
				}

			// Connection 종료
			conn.close();
			
			// SQL의 결과로 게시글 정보가 담겨있는 bean을 가진 ArrayList 반환
			return list;
	}
}
