package db.api;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import db.bean.*;

public class AccountMgr {
	
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
	
	public MemberBean procLogin(String userId, String password) {
		PreparedStatement pstmt = null;
		MemberBean member = new MemberBean();
		
		try {
			//INIT CONNECTION
			Connection con = getConnection();
			
			//CONNECTION Check
			if(con == null) {
				throw new Exception("DB INIT FAILED");
			}
			
			//Set Query
			String query = "select * from member where userId=?,password=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, password);
			
			//Send Query
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				member.setId(rs.getString("id"));
				member.setName(rs.getString("name"));
				member.setPassword(rs.getString("password"));
				member.setEmail(rs.getString("email"));
				return member;
			}
			else {
				return null;
			}
		}
		catch(Exception e) {
			return null;
		}
	}
	
	public int checkIdExists(String Id) {
		try {
			Connection con = getConnection();
			if(con == null) {
				throw new Exception("DB INIT FAILED");
			}
			
			PreparedStatement pstmt = null;
			String query = "select * from member where id=?";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, Id);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs==null || rs.next() == false) {
				//Available
				return 0;
			}
			else {
				//Using
				return 1;
			}
		}
		catch(Exception e) {
			return -1;
		}
	}
	
	public int procRegister(MemberBean member) {
		PreparedStatement pstmt = null;
		try {
			//INIT CONNECTION
			Connection con = getConnection();
			
			//CONNECTION CHECK
			if(con == null) {
				throw new Exception("DB INIT FAILED");
			}
			
			//ID Check
			int ICheck = checkIdExists(member.getId());
			if(ICheck == -1 || ICheck == 1) {
				return -2;
			}
			
			//Set Query
			String query = "insert into member values(?,?,?,?);";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			
			return pstmt.executeUpdate();
		}
		catch(Exception e) {
			return -1;
		}
	}
	
	public ArrayList<MemberBean> searchMember(String str){
		PreparedStatement pstmt = null;
		try {
			Connection con = getConnection();
			if(con == null) {
				throw new Exception("DB INIT FAILED");
			}
			
			
			String query = "select * from member where id=? or email=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, str);
			pstmt.setString(2, str);
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<MemberBean> result = new ArrayList<MemberBean>();
			while(rs.next()) {
				MemberBean mb = new MemberBean();
				mb.setId(rs.getString("id"));
				mb.setPassword(rs.getString("password"));
				mb.setName(rs.getString("name"));
				mb.setEmail(rs.getString("email"));
				
				result.add(mb);
			}
			return result;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	
	
	public MemberBean getUserInformation(String userId) {
		try {
			PreparedStatement pstmt = null;
			
			//INIT CONNECTION
			Connection con = getConnection();
			
			//CONNECTION CHECK
			if(con == null) {
				throw new Exception("DB INIT FAILED");
			}
			
			String query = "select * from member where id=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				MemberBean member = new MemberBean();
				member.setId(rs.getString("id"));
				member.setPassword(rs.getString("password"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				return member;
			}
			else {
				return null;
			}	
		}
		catch(Exception e) {
			return null;
		}
	}
	
	public int updateUserInformation(MemberBean mb) {
		try {
			Connection con = getConnection();
			if(con==null) {
				throw new Exception("DB INIT FAILED");
			}
			
			PreparedStatement pstmt = null;
			String query = "update member set password=? , name=? , email=? where id=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, mb.getPassword());
			pstmt.setString(2, mb.getName());
			pstmt.setString(3, mb.getEmail());
			pstmt.setString(4, mb.getId());
			
			pstmt.executeUpdate();
			return 0;
		}
		catch(Exception e) {
			return -1;
		}
	}
	
	public int quitProject(int projectId, String userId) {
		try {
			ProjectMgr pmgr = new ProjectMgr();
			pmgr.removeProjectMember(projectId, userId);
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
			pstmt.setString(1, memberId);
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
