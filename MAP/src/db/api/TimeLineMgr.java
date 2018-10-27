package db.api;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import db.bean.TimeLineBean;

public class TimeLineMgr {
	
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
	
	public Date getDueTime(int projectId) {
		try {
			Connection con = getConnection();
			if(con==null) {
				throw new Exception("DB 연결 실패"); 
			}
			
			PreparedStatement pstmt = null;
			String query = "select due from project where id=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,projectId);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs==null) {
				throw new Exception("결과가 읎다");
			}
			return rs.getDate("due");
		}
		catch(Exception e){
			return null;
		}
	}
	
	public ArrayList<TimeLineBean> getComment(int projectId) {
		try {
			Connection con = getConnection();
			if(con==null) {
				throw new Exception("DB 연결 실패");
			}
			
			PreparedStatement pstmt = null;
			String query = "select * from timeline where projectId=?;";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,projectId);
			
			ResultSet rs = pstmt.executeQuery();
			ArrayList<TimeLineBean> list = new ArrayList<>();
			while(rs.next()) {
				TimeLineBean tb = new TimeLineBean();
				tb.setId(rs.getInt("id"));
				tb.setProjectId(rs.getInt("projectId"));
				tb.setMemberId(rs.getString("memberId"));
				tb.setComment(rs.getString("comment"));
				
				list.add(tb);
			}
			
			return list;
		}
		catch(Exception e) {
			return null;
		}
	}
	
	public int addComment(int projectId,String memberId,String comment) {
		try {
			Connection con = getConnection();
			if(con==null) {
				throw new Exception("DB 연결 실패");
			}
			
			PreparedStatement pstmt = null;
			String query = "insert into timeline (projectId,memberId,comment) values(?,?,?);";
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,projectId);
			pstmt.setString(2,memberId);
			pstmt.setString(3,comment);
			return pstmt.executeUpdate();
			
		}
		catch(Exception e) {
			return 0;
		}
	}
}