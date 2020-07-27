package net.member.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.member.db.MemberBean;
import net.member.db.MemberDAO;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberDAO memberdao = new MemberDAO();
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		List<MemberBean> memberlist = new ArrayList<MemberBean>();
		
		String id = (String)session.getAttribute("id");
		
		if(id == null) {
			forward.setRedirect(true);
			forward.setPath("./MemberLogin.me");
			return forward;
		}
		else if(!id.equals("admin")) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out =response.getWriter();
			
			out.println("<script>");
			out.println("alert('관리자가 아닙니다');");
			out.println("location.href='./BoardList.bo';");
			out.println("</script>");
			out.close();
		}
		
		memberlist = memberdao.getMemberList();
		if(memberlist == null) {
			System.out.println("회원목록 보기 실패");
		}
		
		request.setAttribute("memberlist", memberlist);

		System.out.println("회원목록 보기 성공");
		forward.setPath("./member/memberlistform.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
