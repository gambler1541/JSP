package net.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.board.db.BoardBean;
import net.board.db.BoardDAO;


public class BoardAddAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		BoardDAO boarddao = new BoardDAO();
		BoardBean boarddata = new BoardBean();
		ActionForward forward = new ActionForward();
		
		String realFolder = "";
		String saboFolder = "/boardupload";
		
		int fileSize = 5*1024*1024;
		
		String saveFolder = request.getSession().getServletContext().getRealPath(saboFolder);
		System.out.println(saveFolder);
		
		boolean result = false;
		
		try {
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
			
			boarddata.setBOARD_NAME(multi.getParameter("BOARD_NAME"));
			boarddata.setBOARD_PASS(multi.getParameter("BOARD_PASS"));
			boarddata.setBOARD_SUBJECT(multi.getParameter("BOARD_SUBJECT"));
			boarddata.setBOARD_CONTENT(multi.getParameter("BOARD_CONTENT"));
			boarddata.setBOARD_FILE(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
			
			result = boarddao.boardInsert(boarddata);
			
			if(result == false) {
				System.out.println("BoardAddAction 실패");
				return null;
			}
			System.out.println("BoardAddAction 성공");
			
			forward.setRedirect(true);
			forward.setPath("./BoardList.bo");
			return forward;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
