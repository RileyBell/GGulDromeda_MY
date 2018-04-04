package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.BoardBean;
import db.BoardDAO;

/**
 * Servlet implementation class BoardOrerServlet
 */
@WebServlet("/BoardOrerServlet")
public class BoardOrerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardOrerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			System.out.println("BoardOrderServlet 들어옴!");
			
			// 빼내야할것 : board_order, board_sub, page_num, board_main, local_code
			// request에서 local_code, board_main, board_sub 받아오기
			// 페이지 번호 파라미터 추출
			String page_num_str = request.getParameter("page_num");
									
			// 지역코드 가져오기
			String local_code = request.getParameter("local_code");
									
			// 카테고리 정보 넘기기
			String board_main = request.getParameter("board_main");
						
			// 하위 게시판 정보 넘기기
			String board_sub = request.getParameter("board_sub");
			
			// 정렬 정보 가져오기
			String board_order = request.getParameter("board_order");
			
			
			// 잘 받아오는지 테스트
			System.out.println("page_num_str : " + page_num_str);
			System.out.println("local_code : " + local_code);
			System.out.println("board_sub : " + board_sub);
			System.out.println("board_main : " + board_main);
			System.out.println("board_order : " + board_order);
			
			// local_code는 board_order.bee 에서 파라미터로 임의로 넘겨준상태!
			
			// 만약 page_num으로 받아온 결과가 null이면 가장 첫 페이지를 띄워 주도록
			if(page_num_str == null){
				page_num_str = "1";
			}
			
			// page_num_str을 int로 변환
			int page_num = Integer.parseInt(page_num_str);
			
			// 글 목록 데이터를 담을 ArrayList 생성
			ArrayList<BoardBean> list = new ArrayList<BoardBean>();
			
			// 이제 분기문으로 ArrayList에 BoardDAO의 메소드를 통해 글 정보를 담아줄거임
			// sub_select가 선택되지 않은상태 즉 board_sub의 value가 nothing으로 왔을때
			if(board_sub.equals("nothing")){
				// chat, QnA, trade 
				// Tip - nothing, ads - nothing, notice - nothing 
				// 이때가 get_board_order_info & get_board_category info 호출하게 하도록하면됨
				
				/*
				System.out.println("if-nothing board_main : " + board_main);
				System.out.println("if-nothing board_sub : " + board_sub);
				*/
				
				System.out.println("if-nothing 들어옴 = 하위게시판 선택 ㄴㄴ");
				
				// board_order가 new 즉 최신순인경우
				// 그냥 카테고리별로 글 평소에 가져오던데로 가져오면됨!
				if(board_order.equals("new")){
					System.out.println("if-nothing의 if-new 분기문안 board_main : " + board_main);
					
					list = BoardDAO.get_baord_category_info(page_num, local_code, board_main);
					
				} else if (board_order.equals("like")){
					// board_order가 like 즉 추천순인경우
					System.out.println("if-nothing의 else-like 분기문안 board_main : " + board_main);
					
					list = BoardDAO.get_baord_order_info(page_num, local_code, board_main);
				}
				
			} else {
				// sub_select가 선택되었을때
				// Tip - food, place, course & ads - meal, pub, cafe & notice - notice , event
				
				/*
				System.out.println("else문 board_main : " + board_main);
				System.out.println("else문 board_sub : " + board_sub);
				*/
				
				System.out.println("하위게시판 있음");
				
				// 하위게시판이 있을때 board_order가 new 즉 최신순인경우
				// 그냥 하위게시판 게시글 불러오는 메소드 쓰면됨!
				if(board_order.equals("new")){
					System.out.println("else의 if-new 분기문안 board_main : " + board_main);
					System.out.println("else의 if-new 분기문안 board_sub : " + board_sub);
					
					list = BoardDAO.get_sub_category_info(page_num, local_code, board_sub);
					
				} else if (board_order.equals("like")){
					// 하위게시판이 있을때 board_order가 like 즉 추천순인경우
					System.out.println("else의 else-like 분기문안 board_main : " + board_main);
					System.out.println("else의 else-like 분기문안 board_sub : " + board_sub);
					
					list = BoardDAO.get_sub_order_info(page_num, local_code, board_sub);
				}
				
			}
			
			// 가져온 글 몇개인지
			System.out.println("BoardOrderServlet 가져온 list 개수 : " + list.size());
			
			// 가져온 데이터 request에 넣기
			request.setAttribute("board_list", list);
			
			// 페이지 번호 세팅
			request.setAttribute("page_num", page_num);
			
			// 카테고리 세팅
			request.setAttribute("board_main", board_main);
			
			// 하위 게시판 세팅
			request.setAttribute("board_sub", board_sub);
			
			// 정렬 세팅
			request.setAttribute("board_order", board_order);
			
			// 이동한다.
			// board_main 에 따라서 board_img_main or board_basic_main
			String site = null;
			
			if(board_main.equals("chat") || board_main.equals("QnA")){
				// 수다잡담 & 질문 게시판은 이미지게시판이아닌 일반 게시반으로
				site = "board/board_basic_main.jsp";
			} else {
				// tip, 지역거래, 광고, 공지 는 이미지게시판 폼으로 이동한다.
				site = "board/board_img_main.jsp";
			}
			
			RequestDispatcher dis = request.getRequestDispatcher(site);
			dis.forward(request, response);
			
						
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
