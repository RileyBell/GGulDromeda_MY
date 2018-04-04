 package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.UserInfoBean;

/**
 * Servlet implementation class ControllerServlet
 */
@WebServlet("*.bee")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1. 요청할 때 사용한 서블릿 이름을 추출
		// 파라미터 한글 처리
		request.setCharacterEncoding("utf-8");
		// 세션 검사 여부를 확인할 변수
		boolean isCheckSession = false;
		// 요청 서블릿 이름을 추출
		String url = request.getRequestURI();
		// /를 기준으로 잘라낸다.
		String [] sub = url.split("/");
		url = sub[sub.length -1];
		// JESESSIONID 값이 붙을 수도 있기 때문에...
		sub = url.split(";");
		url = sub[0];

		// 2. 서블릿 이름으로 분기해서 실제로 이동될 페이지 이름 셋팅
		String site = "서블릿이름 확인하세요";
		// 서블릿 이름으로 분기
		
		if(url.equals("main.bee")){
			site = "BoardMainServlet";
			isCheckSession = true;
		} else if (url.equals("board_category.bee")){
			site = "BoardCategoryServlet";
			isCheckSession = true;
		} else if (url.equals("board_sub.bee")){
			System.out.println("여기까지옴");
			site = "BoardSubCategoryServlet";
			isCheckSession = true;
		} else if (url.equals("board_order.bee")){
			site = "BoardOrerServlet";
		}
		
		// 3. 필요하다면 로그인여부 검사
		if(isCheckSession == true){
			// 세션에 저장되어 있는 사용자 정보 객체를 추출
			HttpSession session = request.getSession();
			UserInfoBean bean = (UserInfoBean)session.getAttribute("user_bean");
			// 로그인 여부값 확인
			/*
			if(bean == null || bean.isLogin() == false){
				site = "index.jsp";
				response.sendRedirect(site);
				return;
			}
			*/
		}
		// 4. 페이지 이동
		RequestDispatcher dis = request.getRequestDispatcher(site);
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
