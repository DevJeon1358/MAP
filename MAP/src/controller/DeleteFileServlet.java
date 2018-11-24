package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.api.FileMgr;
import db.bean.FileBean;
import db.bean.ProjectBean;

/**
 * Servlet implementation class DeleteFileServlet
 */
@WebServlet("/deletefile")
public class DeleteFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteFileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String fileId = request.getParameter("fileId");
		int fileid = Integer.parseInt(fileId);
		
		HttpSession session = request.getSession();
		ProjectBean project = (ProjectBean)session.getAttribute("project");
		if(project==null) {
			request.getRequestDispatcher("home").forward(request, response);
			return;
		}
		int projectid = project.getId();

		FileMgr fm = new FileMgr();
		
		// 파일 삭제 코드 추가할 것
		fm.deleteFile(fileid);
		
		if(fm != null) {
			ArrayList<FileBean> fb = fm.getAllProjectFiles(projectid);
			session.setAttribute("files", fb);
		}
		request.getRequestDispatcher("file.jsp").forward(request, response);
	}

}
