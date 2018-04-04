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
 * Servlet implementation class BoardSubCategoryServlet
 */
@WebServlet("/BoardSubCategoryServlet")
public class BoardSubCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSubCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			System.out.println("BoardSubCategoryServlet!");
			
			// request에서 local_code, board_main, board_sub 받아오기
			// 페이지 번호 파라미터 추출
			String page_num_str = request.getParameter("page_num");
						
			// 지역코드 가져오기
			String local_code = request.getParameter("local_code");
						
			// 카테고리 정보 넘기기
			String board_main = request.getParameter("board_main");
			
			// 하위 게시판 정보 넘기기
			String board_sub = request.getParameter("board_sub");
			
			// 잘 받아오는지 테스트
			System.out.println(page_num_str);
			System.out.println(local_code);
			System.out.println(board_sub);
			System.out.println(board_main);
			
			// 만약 page_num으로 받아온 결과가 null이면 가장 첫페이지를 띄워 주도록!
			if(page_num_str == null){
				page_num_str = "1";
			}
			
			// page_num_str 를 int로 변환
			int page_num = Integer.parseInt(page_num_str);
			
			// 글 목록 데이터를 담을 ArrayList 생성
			ArrayList<BoardBean> list = BoardDAO.get_sub_category_info(page_num, local_code, board_sub);
			
			// 가져온 글 몇개인지 
			System.out.println("BoardSubCategoryServlet 가져온 list 개수 : " + list.size());
			
			// 가져온 데이터 request에 넣기
			request.setAttribute("board_list", list);
			
			// 페이지 번호 세팅
			request.setAttribute("page_num", page_num);
			
			// 카테고리 세팅
			request.setAttribute("board_main", board_main);
			
			// 하위 게시판을 넘겨줘야지 sub_select값 유지시켜주려고
			request.setAttribute("board_sub", board_sub);
			
			// 이동한다.
			// 하위 카테고리는 이미지 게시판에만 있으므로 나눠주지 않는다!
			String site = "board/board_img_main.jsp";
			
			RequestDispatcher dis = request.getRequestDispatcher(site);
			dis.forward(request, response);
			
		} catch (Exception e){
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
