package db.api;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import db.bean.*;
import java.util.Collections;

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
			pstmt.setInt(1, projectId);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				project.setId(rs.getInt("id"));
				project.setName(rs.getString("name"));
				project.setSubject(rs.getString("subject"));
				project.setDue(rs.getDate("due"));
				project.setCreator(rs.getString("creator"));
				return project;
			}
			else {
				return null;
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
			pstmt.setInt(1, projectId);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs==null) {
				throw new Exception("No Result");
			}
			while(rs.next()) {
				query = "select * from member where id=?;";
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, rs.getString("memberId"));
				ResultSet rs1 = pstmt.executeQuery();
				if(rs1.next()){
					MemberBean member = new MemberBean();
					member.setEmail(rs.getString("email"));
					member.setId(rs.getString("id"));
					member.setName(rs.getString("name"));
					member.setPassword(rs.getString("password"));

					members.add(member);
				}
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
			pstmt.setInt(1, projectId);
			pstmt.setString(2, memberId);
			
			pstmt.executeUpdate();
			
			return projectId;
		}
		catch(Exception e) {
			return -1;
		}
	}
	
	public int getProjectId(String projectName, String userId) {
		PreparedStatement pstmt = null;
		try {
			Connection con = getConnection();
			if(con == null) {
				throw new Exception("DB INIT FAILED");
			}
			String query = "select * from project where name=?,creator=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, projectName);
			pstmt.setString(2, userId);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt("id");
			}
			else {
				return -1;
			}
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
			pstmt.setInt(1, projectId);
			pstmt.setString(2, memberId);
			
			pstmt.executeUpdate();
			
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
			
			String query = "insert into project(name,subject,due,creator) values(?,?,?,?);";
			pstmt = con.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, pb.getName());
			pstmt.setString(2, pb.getSubject());
			pstmt.setTimestamp(3, new java.sql.Timestamp(pb.getDue().getTime()));
			pstmt.setString(4, pb.getCreator());
			
			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
			if(rs.next()) {
				return rs.getInt("id");
			}
			else {
				return -1;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
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
			pstmt.setInt(1, projectId);
			pstmt.executeUpdate();
			
			query = "delete from projectmember where projectId=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, projectId);
			pstmt.executeUpdate();
			
			return 0;
		}
		catch(Exception e) {
			return -1;
		}
	}
	
	public ArrayList<ProjectBean> getUserProjects(String Id){
		try {
			ArrayList<ProjectBean> projects = new ArrayList<ProjectBean>();
			PreparedStatement pstmt = null;
			
			//INIT CONNECTION
			Connection con = getConnection();
			
			//CONNECTION CHECK
			if(con == null) {
				throw new Exception("DB INIT FAILED");
			}
			
			String query = "select * from projectmember where memberId=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, Id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String query2 = "select * from project where id=?;";
				pstmt = con.prepareStatement(query2);
				pstmt.setString(1, rs.getString("projectId"));
				
				ResultSet rs1 = pstmt.executeQuery();
				if(rs1.next() == false) {
					throw new Exception("Result is null");
				}
				
				ProjectBean ps = new ProjectBean();
				ps.setId(rs1.getInt("id"));
				ps.setName(rs1.getString("name"));
				ps.setSubject(rs1.getString("subject"));
				ps.setDue(rs1.getDate("due"));
				ps.setCreator(rs1.getString("creator"));
				
				projects.add(ps);
			}

			Collections.sort(projects);

			return projects;
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
