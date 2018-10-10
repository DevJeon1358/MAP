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
			System.out.println(e);
			return null;
		}
	}
	
	public MemberBean procLogin(String userId, String password) {
		PreparedStatement pstmt = null;
		MemberBean member = new MemberBean();
		
		try {
			//INIT CONNECTION
			Connection con = getConnection();
			
			//CONNECTION 유효 확인
			if(con == null) {
				throw new Exception("DB INIT FAILED");
			}
			
			//Set Query
			String query = "select * from Member where userId=?,password=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setString(0, userId);
			pstmt.setString(1, password);
			
			//Send Query
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()==false) {
				throw new Exception("검색 결과가 없습니다.");
			}
			
			member.setId(rs.getString("id"));
			member.setName(rs.getString("name"));
			member.setPassword(rs.getString("password"));
			member.setEmail(rs.getString("email"));
			return member;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	public int procRegister(MemberBean member) {
		PreparedStatement pstmt = null;
		try {
			//INIT CONNECTION
			Connection con = getConnection();
			
			//CONNECTION 유효 확인
			if(con == null) {
				throw new Exception("DB INIT FAILED");
			}
			
			//Set Query
			String query = "insert into Member values(\"?\",\"?\",\"?\",\"?\");";
			pstmt = con.prepareStatement(query);
			pstmt.setString(0, member.getId());
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			
			pstmt.executeQuery();
			
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
			
			//CONNECTION 유효 확인
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
				pstmt.setString(0, rs.getString("projectId"));
				
				ResultSet rs1 = pstmt.executeQuery();
				if(rs1==null) {
					throw new Exception("요청 정보가 Null 을 반환하였습니다.");
				}
				
				ProjectBean ps = new ProjectBean();
				ps.setId(rs1.getInt("Id"));
				ps.setName(rs.getString("name"));
				ps.setSubject(rs.getString("subject"));
				ps.setDue(rs.getDate("due"));
				
				projects.add(ps);
			}
			return projects;
		}
		catch(Exception e) {
			return null;
		}
	}
}
