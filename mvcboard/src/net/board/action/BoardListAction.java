package net.board.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.db.BoardDAO;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BoardDAO boarddao = new BoardDAO();
		List boardlist = new ArrayList();
		
		int page = 1;
		int limit = 10;
		
		request.setCharacterEncoding("utf-8");
		
		if(request.getParameter("page")!= null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 검색  기능 추가 - 시작
		String srchKey  = request.getParameter("srchKey");
		String srchFlds = request.getParameter("srchFlds");
		String cond = null;
		
		if(srchKey == null || srchKey.equals("")) {
			cond = null;
		} else if(srchFlds.equals("all")) {

			String whereFmt = " upper(BOARD_SUBJECT) like '%%' || upper('%s') || '%%' "
					+ " or upper(BOARD_NAME) like '%%' || upper('%s') || '%%' "
					+ " or upper(BOARD_CONTENT) like '%%' || upper('%s') || '%%' ";
			cond = String.format(whereFmt, srchKey, srchKey, srchKey);
		} else if(srchFlds.equals("au")) {
			String whereFmt = " upper(BOARD_NAME) like '%%' || upper('%s') || '%%' ";
			cond = String.format(whereFmt, srchKey);
		} else if(srchFlds.equals("sub")) {
			String whereFmt = " upper(BOARD_SUBJECT) like '%%' || upper('%s') || '%%' ";
			cond = String.format(whereFmt, srchKey);
		} else if(srchFlds.equals("con")) {
			String whereFmt = " upper(BOARD_CONTENT) like '%%' || upper('%s') || '%%' ";
			cond = String.format(whereFmt, srchKey);
		}
		
		// 검색 기능 추가 - 끝
		
		int listcount = boarddao.getListCount(cond);
		boardlist = boarddao.getBoardList(page, limit, cond);
		
		// 총 페이지 수 : 0.95를 더해서 올림 처리
		int maxpage = (int)((double)listcount / limit + 0.95);		
		
		// 현재 페이지에서 보여줄 시작 페이지 수(1, 11, 21, 등...)
		int startpage = (((int)((double)page / 10 + 0.95)) -1) * 10 + 1;
		
		// 현재 페이지에서 보여줄 마지막 페이지 수 (10, 20, 30 등)
		int endpage = startpage + 10 - 1;
		
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		request.setAttribute("page", page);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("listcount", listcount);
		request.setAttribute("boardlist", boardlist);
		
		// 검색 기능 추가 - 시작
		request.setAttribute("srchKey", srchKey);
		request.setAttribute("srchFlds", srchFlds);
		// 검색 기능 추가 - 끝
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./board/qna_board_list.jsp");
		return forward;
	}

}
