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
			System.out.println(e);
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
			if(rs == null) {
				throw new Exception("No Result");
			}
			
			project.setId(rs.getInt("id"));
			project.setName(rs.getString("name"));
			project.setSubject(rs.getString("subject"));
			project.setDue(rs.getDate("due"));
			return project;
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
}
