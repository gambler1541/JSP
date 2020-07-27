package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		BoardDAO boarddao = new BoardDAO();
		BoardBean board = new BoardBean();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		board = boarddao.getDetail(num);
		
		if(board == null) {
			System.out.println("글 답변 실패 ");
			return null;
		}
		System.out.println("글 답변 성공 ");
		request.setAttribute("boarddata", board);
		
		forward.setRedirect(false);
		forward.setPath("./board/qna_board_reply.jsp");
		return forward;
	}

}
