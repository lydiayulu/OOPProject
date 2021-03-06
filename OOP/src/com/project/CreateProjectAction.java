package com.project;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import org.apache.struts2.interceptor.SessionAware;

import model.Project;
import model.Task;
import model.User;
import DAO.ProjectService;
import DAO.ProjectServiceImp;

import com.opensymphony.xwork2.ActionSupport;

public class CreateProjectAction extends ActionSupport implements SessionAware {

	private Project newproject;
	private String startdate;
	private String enddate;
	Map<String, Object> session;

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public void setprojectdate() {
		SimpleDateFormat start = new SimpleDateFormat("yyyy-mm-dd");

		Date sdate;
		Date edate;
		Date today = new Date();
		try {
			sdate = start.parse(startdate);
			newproject.setStartDate(sdate);
			edate = start.parse(enddate);
			newproject.setEndDate(edate);
			newproject.setLastModifiedDate(today);

		} catch (ParseException e) {
			e.printStackTrace();
		}

	}

	public String execute() {
		newproject.setProjectStatus("initialization");
		setprojectdate();
		ProjectService ps = new ProjectServiceImp();
		HashSet<User> set1 = new HashSet<User>();
		User creater = (User) session.get("user");
		set1.add(creater);
		newproject.setUsers(set1);

		if (ps.addProject(newproject, creater))
			return SUCCESS;
		else
			return INPUT;
	}

	public Project getNewproject() {
		return newproject;
	}

	public void setNewproject(Project newproject) {
		this.newproject = newproject;
	}

	@Override
	public void setSession(Map<String, Object> sess) {
		this.session = sess;
	}

	public Map<String, Object> getSession() {
		return session;
	}

}
