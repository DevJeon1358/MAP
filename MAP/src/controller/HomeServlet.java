package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.api.AccountMgr;
import db.api.ProjectMgr;
import db.bean.MemberBean;
import db.bean.ProjectBean;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//현재 사용자의 project리스트를 받아서 세션에 projectlist 에 저장
		HttpSession session = request.getSession();
		MemberBean member = (MemberBean)session.getAttribute("user");
		
		if(member != null) {
			AccountMgr account = new AccountMgr();
			ProjectMgr pm = new ProjectMgr();
			ArrayList<ProjectBean> list = pm.getUserProjects(member.getId());
			
			session.setAttribute("projectlist", list);
		}
		
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
