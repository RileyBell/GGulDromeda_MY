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
import sun.reflect.SignatureIterator;

/**
 * Servlet implementation class BoardCategoryServlet
 */
@WebServlet("/BoardCategoryServlet")
public class BoardCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			System.out.println("BoardCategoryServlet 들어옴");
			
			// 페이지 번호 파라미터 추출
			String page_num_str = request.getParameter("page_num");
			
			// 지역코드 가져오기
			String local_code = request.getParameter("local_code");
			
			// 카테고리 정보 넘기기
			String board_main = request.getParameter("board_main");
			
			System.out.println(board_main);
			
			// 임시로 local_code 지정
			local_code = "AA";
			
			// 만약 page_num으로 받아온 결과가 null이면 가장 첫페이지를 띄워 주도록!
			if(page_num_str == null){
				page_num_str = "1";
			}
			
			// int로 변환!
			int page_num = Integer.parseInt(page_num_str);
			
			// 글 목록 데이터를 가지고 온다.
			ArrayList<BoardBean> list = BoardDAO.get_baord_category_info(page_num, local_code, board_main);
			
			// 가져온 데이터 request에
			request.setAttribute("board_list", list);
			
			// 페이지 번호 세팅
			request.setAttribute("page_num", page_num);
			
			// 카테고리 분류도 request에 넣어줘야하나?
			// 넣어주는게 좋을듯! 게시판의 제목을 가져오기 위해서!
			request.setAttribute("board_main", board_main);
			
			// 이제는 board_list 안에 board_main이 있으므로 노상관
			
			// 이동한다.
			// board_main 즉 카테고리에따라 board_img_main.jsp & board_basic_main.jsp로 이동한다
			
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
			
		} catch(Exception e){
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
