package net.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MemberFrontController")
public class MemberFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
 
    public MemberFrontController() {
        super();
    }
    
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	System.out.println("member");
    	String RequestURI = request.getRequestURI();
    	System.out.println(RequestURI);
    	String contextPath = request.getContextPath();
    	System.out.println("contextpath : " + contextPath);
    	String command = RequestURI.substring(contextPath.length());
    	System.out.println("command : " + command);
    	ActionForward forward = null; 
    	Action action = null;
    	
    	if(command.equals("/MemberLogin.me")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("./member/loginForm.jsp");
    	}
    	
    	else if(command.equals("/MemberJoin.me")) {
    		forward = new ActionForward();
    		forward.setRedirect(false);
    		forward.setPath("./member/joinForm.jsp");
    	}
    	
    	else if(command.equals("/MemberLoginAction.me")) {
    		action = new MemberLoginAction();
    		try {
    			forward = action.execute(request,response);
    		}catch (Exception e) {
    			e.printStackTrace();
			}
    	}
    	
    	else if(command.equals("/MemberJoinAction.me")) {
    		action = new MemberJoinAction();
    		try {
    			forward = action.execute(request,response);
    		}catch (Exception e) {
    			e.printStackTrace();
    		}
    	}
    	
//    	else if(command.equals("/MemberListAction.me")) {
//    		action = new MemberListAction();
//    		try {
//    			forward = action.execute(request,response);
//    		}catch (Exception e) {
//    			e.printStackTrace();
//    		}
//    	}
//    	
//    	else if(command.equals("/MemberViewAction.me")) {
//    		action = new MemberViewAction();
//    		try {
//    			forward = action.execute(request,response);
//    		}catch (Exception e) {
//    			e.printStackTrace();
//			}
//    	}
//    	
//    	else if(command.equals("/MemberDeleteAction.me")) {
//    		action = new MemberDeleteAction();
//    		try {
//    			forward = action.execute(request,response);
//    		}catch (Exception e) {
//    			e.printStackTrace();
//			}
//    	}
    	
    	if(forward !=null) {
    		if(forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
    		}else {
    			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
    			dispatcher.forward(request, response);
    		}
    	}
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}

}
