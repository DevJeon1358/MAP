package db.api;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import db.bean.*;

public class ProjectMgr {
	
	private Connection getConnection() {
		Connection con = null;
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/Test");
			con = ds.getConnection();
			return con;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	public ProjectBean getProjectInformation(int projectId) {
		try {
			Connection con = getConnection();
			if(con==null) {
				throw new Exception("DB INIT FAILED");
			}
			
			PreparedStatement pstmt = null;
			ProjectBean project = new ProjectBean();
			
			String query = "select * from project where id=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(0, projectId);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				project.setId(rs.getInt("id"));
				project.setName(rs.getString("name"));
				project.setSubject(rs.getString("subject"));
				project.setDue(rs.getDate("due"));
				return project;
			}
			else {
				throw new Exception("No Result");
			}
		}
		catch(Exception e) {
			return null;
		}
	}
	
	public ArrayList<MemberBean> getProjectMembers(int projectId){
		try {
			Connection con = getConnection();
			if(con==null) {
				throw new Exception("DB INIT FAILED");
			}
			
			PreparedStatement pstmt = null;
			ArrayList<MemberBean> members = new ArrayList<MemberBean>();
			String query = "select * from projectmember where projectId=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(0, projectId);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs==null) {
				throw new Exception("No Result");
			}
			while(rs.next()) {
				MemberBean member = new MemberBean();
				member.setEmail(rs.getString("email"));
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setPassword(rs.getString("password"));
				
				members.add(member);
			}
			return members;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	public int addProjectMember(int projectId, String memberId) {
		try {
			Connection con = getConnection();
			if(con==null) {
				throw new Exception("DB INIT FAILED");
			}
			
			PreparedStatement pstmt = null;
			String query = "insert into projectmember values (?,?);";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(0, projectId);
			pstmt.setString(1, memberId);
			
			pstmt.executeQuery();
			
			return 0;
		}
		catch(Exception e) {
			return -1;
		}
	}
	
	public int removeProjectMember(int projectId, String memberId) {
		try {
			Connection con = getConnection();
			if(con == null) {
				throw new Exception("DB INIT FAILED");
			}
			
			PreparedStatement pstmt = null;
			String query = "delete from projectmember where projectId=?,memberId=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(0, projectId);
			pstmt.setString(1, memberId);
			
			pstmt.executeQuery();
			
			return 0;
		}
		catch(Exception e) {
			return -1;
		}
	}
	
	public int addProject(ProjectBean pb) {
		try {
			Connection con = getConnection();
			if(con == null) {
				throw new Exception("DB INIT FAILED");
			}
			
			PreparedStatement pstmt = null;
			
			String query = "insert into project(name,subject,due) values(?,?,?);";
			pstmt = con.prepareStatement(query);
			pstmt.setString(0, pb.getName());
			pstmt.setString(1, pb.getSubject());
			pstmt.setDate(2, pb.getDue());
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("id");
			}
			else {
				throw new Exception("Unknown Error Throwed when adding project");
			}
			
		}
		catch(Exception e) {
			return -1;
		}
	}
	
	public int removeProject(int projectId) {
		try {
			Connection con = getConnection();
			if(con == null) {
				throw new Exception("DB INIT FAILED");
			}
			
			PreparedStatement pstmt = null;
			
			String query = "delete from project where id=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(0, projectId);
			pstmt.executeQuery();
			
			query = "delect from projectmember where projectId=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(0, projectId);
			pstmt.executeQuery();
			
			return 0;
		}
		catch(Exception e) {
			return -1;
		}
	}
	
	public int getUserProjectCount(String memberId) {
		try {
			Connection con = getConnection();
			if(con==null) {
				throw new Exception("DB INIT FAILED");
			}
			
			PreparedStatement pstmt = null;
			
			String query = "select count(memberId) from projectmember where memberId=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setString(0, memberId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(0);
			}
			else {
				//Returns 0 if Member dosen't has project or Error
				return 0;
			}
		}
		catch(Exception e) {
			return -1;
		}
	}
}
