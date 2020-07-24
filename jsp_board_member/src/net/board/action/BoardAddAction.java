package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;

public class BoardAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		ActionForward forward = new ActionForward();
		
		String realFolder = "";
		String saveFolder ="/boardupload";
		
		int filesize = 5*1024*1024;
		
		//realFolder = request.getRealPath(saveFolder);
		
		realFolder = request.getSession().getServletContext().getRealPath(saveFolder);
		
		boolean result = false;
		
		try {
			MultipartRequest multi = null;
			
			multi = new MultipartRequest(request,
					realFolder,
					filesize,
					"UTF-8",
					new DefaultFileRenamePolicy());
			
			boarddata.setBOARD_ID(multi.getParameter("BOARD_ID"));
			boarddata.setBOARD_SUBJECT(multi.getParameter("BOARD_SUBJECT"));
			boarddata.setBOARD_CONTENT(multi.getParameter("BOARD_CONTENT"));
			boarddata.setBOARD_FILE(multi.getParameter("BOARD_FILE"));
			
			result = boarddao.boardInsert(boarddata);
			
			if(result == false){
				System.out.println("게시판 등록 실패");
				return null;
			}
			System.out.println("게시판 등록 완료");
			
			forward.setRedirect(true);
			forward.setPath("./BoardList.bo");
			return forward;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
