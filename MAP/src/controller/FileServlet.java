package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import db.api.FileMgr;
import db.bean.FileBean;
import db.bean.MemberBean;
import db.bean.ProjectBean;

/**
 * Servlet implementation class FileServlet
 */
@WebServlet("/file")
public class FileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ProjectBean project = (ProjectBean)session.getAttribute("project");
		if(project==null) {
			request.getRequestDispatcher("home").forward(request, response);
			return;
		}
		int projectid = project.getId();

		FileMgr fm = new FileMgr();

		if(fm != null) {
			ArrayList<FileBean> fb = fm.getAllProjectFiles(projectid);
			session.setAttribute("files", fb);
		}
		request.getRequestDispatcher("file.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		ProjectBean project = (ProjectBean)session.getAttribute("project");
		if(project==null) {
			request.getRequestDispatcher("home").forward(request, response);
			return;
		}
		int projectid = project.getId();
		
		MemberBean member = (MemberBean)session.getAttribute("user");
		if(member==null) {
			request.getRequestDispatcher("login").forward(request, response);
			return;
		}
		String userid = member.getId();
		
		FileMgr fm = new FileMgr();
		
		String savePath = "/upload";
		int uploadFileSizeLimit = 5*1024*1024;
		String encType = "UTF-8";
		
		ServletContext context = getServletContext();
		String uploadFilePath = context.getRealPath(savePath);
		
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadFilePath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());
			String fileName = multi.getFilesystemName("uploadFile");
			String originalName = multi.getOriginalFileName("uploadFile");
			String memo = multi.getParameter("memo");
			if(fileName!=null) {
				FileBean fb = new FileBean();
				fb.setUploaderId(userid);
				fb.setProjectId(projectid);
				fb.setOriginalFileName(originalName);
				fb.setSavedFileName(fileName);
				fb.setMemo(memo);
				fm.uploadFile(fb);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		if(fm != null) {
			ArrayList<FileBean> fb = fm.getAllProjectFiles(projectid);
			session.setAttribute("files", fb);
		}
		
		request.getRequestDispatcher("file.jsp").forward(request, response);
	}

}
