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
 * Servlet implementation class BoardMainServlet
 */
@WebServlet("/BoardMainServlet")
public class BoardMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 웬만한 메소는 다 자바인 DAO에서 해결하고 SERVLET은 그저 메소드 호출하고
		// 결과를 전송해주기만 한다.
		
		try{
			// 여기서 잠깐
			// Final Project에선 뒤로가기해도 페이지가 유지하기위해 page_num을 물고다닌다.
			// 우리는 jQuery와 Ajax로 페이지를 이동시킨다.
			// window의 스크롤이 끝났을때 ++page_num 의 결과를 가져와야한다.
			
			// 페이지 번호 파라미터 추출
			String page_num_str = request.getParameter("page_num");
			
			// 지역 코드 가지고 오기
			String local_code = request.getParameter("local_code");
			
			// 임시로 local_code 지정
			local_code = "AA";
			
			// 만약 page_num으로 받아온 결과가 null이면 가장 첫페이지를 띄워 주도록!
			if(page_num_str == null){
				page_num_str = "1";
			}
			
			// int로 변환!
			int page_num = Integer.parseInt(page_num_str);
			
			// 글 목록 데이터를 가지고 온다.
			ArrayList<BoardBean> list = BoardDAO.get_board_all_info(page_num, local_code);
			
			// 가져온 데이터 request에 
			request.setAttribute("board_list", list);
			
			// 페이지 번호 세팅
			request.setAttribute("page_num", page_num);
			
			// 파라미터 테스트 
			System.out.println(page_num);
			System.out.println(local_code);
			System.out.println(list.size());
			
			// 이동한다.
			String site = "main.jsp";
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
