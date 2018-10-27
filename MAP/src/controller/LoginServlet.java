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
import db.bean.MemberBean;
import db.bean.ProjectBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 필요하면 DBBean에서 데이터 얻어옴
		// 데이터를 세션에 저장
		
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		AccountMgr account = new AccountMgr();
		MemberBean member = account.getUserInformation(userid);
		
		if(member != null) {
			if(member.getPassword().equals(password)) {
				HttpSession session = request.getSession();
				session.setAttribute("user", member);
				
				ArrayList<ProjectBean> projectlist = account.getUserProjects(userid);
				session.setAttribute("projectlist", projectlist);
				
				request.getRequestDispatcher("home.jsp").forward(request, response);
				return;
			}
		}
		request.getRequestDispatcher("login.jsp").forward(request, response);
	}

}
