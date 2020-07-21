package kr.ac.mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.ac.mvc.model.UserBean;


@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public UserController() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		String tel = request.getParameter("tel");
		
		UserBean user = new UserBean();
		user.setUserid(userid);
		user.setPasswd(passwd);
		user.setTel(tel);
		request.setAttribute("resultlogin", user.getCheckUser());
		
		// 처리 결과가 저장된 request를 전송하며 동시에 뷰인 login.jsp로 제어 이동
		RequestDispatcher view = request.getRequestDispatcher("login.jsp");
		view.forward(request, response);
	}

	// POST 요청 역시 doGet()에서 처리하도록 함.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
