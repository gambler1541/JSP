package net.board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;
import net.member.db.MemberBean;
import sun.print.resources.serviceui;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		boolean result = false;

		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		int num = Integer.parseInt(request.getParameter("num"));

		String member = (String)session.getAttribute("id");

		boarddata = boarddao.getDetail(num);

		if(!boarddao.isBoardWriter(num, member)) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제할 권한이 없습니다.')");
			out.println("location.href='./BoardList.bo';");	
			out.println("</script>");
			out.close();
			return null;
		}



		result = boarddao.boardDelete(boarddata);
		if(result == false) {
			System.out.println("게시글 삭제 실패");
			return null;
		}
		System.out.println("게시글 삭제 완료");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('정상적으로 삭제하였습니다.')");
		out.println("location.href='./BoardList.bo'");	
		out.println("</script>");
		out.close();
		return forward;

	}
}
