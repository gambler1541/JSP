package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardReplyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		
		BoardDAO boarddao = new BoardDAO();
		BoardBean board = new BoardBean();
		int result = 0;
		
		board.setBOARD_NUM(Integer.parseInt(request.getParameter("BOARD_NUM")));
		board.setBOARD_ID(request.getParameter("BOARD_ID"));
		board.setBOARD_SUBJECT(request.getParameter("BOARD_SUBJECT"));
		board.setBOARD_CONTENT(request.getParameter("BOARD_CONTENT"));
		board.setBOARD_RE_REF(Integer.parseInt(request.getParameter("BOARD_RE_REF")));
		board.setBOARD_RE_LEV(Integer.parseInt(request.getParameter("BOARD_RE_LEV")));
		board.setBOARD_RE_SEQ(Integer.parseInt(request.getParameter("BOARD_RE_SEQ")));
		
		result = boarddao.boardReply(board);
		
		if(result == 0) {
			System.out.println("답변글 실패");
			return null;
		}
		System.out.println("답변글 성공");
		
		forward.setRedirect(true);
		forward.setPath("./BoardDetailAction.bo?num="+result);
		return forward;
	}

}
