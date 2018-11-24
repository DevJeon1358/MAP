package controller;

import java.io.IOException;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.api.ProjectMgr;
import db.bean.MemberBean;
import db.bean.ProjectBean;

/**
 * Servlet implementation class New
 */
@WebServlet("/new")
public class NewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("new.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberBean user = (MemberBean)session.getAttribute("user");
		if(user == null) {
			request.getRequestDispatcher("login").forward(request, response);
			return;
		}
		
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("projectname");
		String subject = request.getParameter("subject");
		String due = request.getParameter("endtime");
		//System.out.println(due);
		Date date;
		try {
			date = new SimpleDateFormat("yyyy/MM/dd HH:mm").parse(due);
		} catch (ParseException e) {
			e.printStackTrace();
			date = new Date();
		}
		
		ProjectBean project = new ProjectBean();
		project.setName(name);
		project.setSubject(subject);
		project.setDue(date);
		
		
		project.setCreator(user.getId());
		
		ProjectMgr pm = new ProjectMgr();
		int projectid = pm.addProject(project);
		//System.out.println("projectid" + projectid);
		
		pm.addProjectMember(projectid, user.getId());
		
		// 프로젝트 멤버 추가하기
		String memberStr = request.getParameter("members"); //  id;id;id;
		if(memberStr != null) {
			String[] members = memberStr.split(";");
			if(members != null) {
				for(int i = 0; i < members.length; i++) {
					pm.addProjectMember(projectid, members[i]);
				}
			}
		}
		
		// home으로 redirect
		//request.getRequestDispatcher("home").forward(request, response);
		response.sendRedirect("home");
	}

}
