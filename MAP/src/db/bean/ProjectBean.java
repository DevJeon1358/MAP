package db.bean;

import java.util.Date;

public class ProjectBean implements Comparable<ProjectBean> {
	private int id;
	private String name;
	private String subject;
	private Date due;
	private String creator;
	
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public Date getDue() {
		return due;
	}
	public void setDue(Date due) {
		this.due = due;
	}

	@override
	public int compareTo(ProjectBean pb){
		Date today = new Date();
		if(this.due.getTime() < today.getTime()){
			return 1;
		}
		else{
			if(this.due.getTime() < pb.due.getTime()){
				return -1;
			}
			else if(this.due.getTime() > pb.due.getTime()){
				return 1;
			}
			else{
				return 0;
			}
		}
	}
}
