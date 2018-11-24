package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.api.TimeLineMgr;
import db.bean.MemberBean;
import db.bean.ProjectBean;
import db.bean.TimeLineBean;

/**
 * Servlet implementation class Twitter
 */
@WebServlet("/twitter")
public class TwitterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TwitterServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ProjectBean project = (ProjectBean)session.getAttribute("project");
		int projectid = project.getId();

		TimeLineMgr tm = new TimeLineMgr();

		if(tm != null) {
			ArrayList<TimeLineBean> tg = tm.getComment(projectid);
			session.setAttribute("timeline", tg);
		}
		request.getRequestDispatcher("twitter.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		
		String comment = request.getParameter("comment");

		HttpSession session = request.getSession();
		ProjectBean project = (ProjectBean)session.getAttribute("project");
		int projectid = project.getId();
		
		MemberBean member = (MemberBean)session.getAttribute("user");
		String userid = member.getId();
		
		TimeLineMgr tm = new TimeLineMgr();
		tm.addComment(projectid, userid, comment);

		if(tm != null) {
			ArrayList<TimeLineBean> tg = tm.getComment(projectid);
			session.setAttribute("timeline", tg);
		}
		request.getRequestDispatcher("twitter.jsp").forward(request, response);
	}

}
