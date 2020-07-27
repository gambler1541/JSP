package net.item.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.item.db.ItemBean;
import net.item.db.ItemDAO;

public class ItemList implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		HttpSession session = request.getSession();
		List<ItemBean> itemlist = new ArrayList<ItemBean>();
		String id = (String) session.getAttribute("id");
		ItemDAO itemdao = new ItemDAO();
	
		if(id == null) {
			id = "guest";
		}

		itemlist = itemdao.getitemlist();
		session.setAttribute("id", id);
		request.setAttribute("itemlist", itemlist);
		
		forward.setPath("./item/itemlist.jsp");
		forward.setRedirect(false);
		List testList = (List)request.getAttribute("itemlist");
		System.out.println(testList.get(0));
		return forward;
	}

}
