package net.item.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.item.db.ItemBean;

@WebServlet("/ItemFrontController1")
public class ItemFrontController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ItemFrontController1() {
        super();
        // TODO Auto-generated constructor stub
    }

	
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	String requestURI = request.getRequestURI();
    	System.out.println("requestURI = " + requestURI);
    	String contextPath = request.getContextPath();
    	System.out.println("contextPath = " + contextPath);
    	String command = requestURI.substring(contextPath.length());
    	System.out.println("command = " + command );
    	
    	Action action = null;
    	ActionForward forward = null;
    	
    	if(command.equals("/ItemList.it")) {
    		action = new ItemList();
    		try {
    			forward = action.execute(request, response);
    		}catch (Exception e) {
				e.printStackTrace();
			}
    	}
  
    	if(forward != null) {
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
