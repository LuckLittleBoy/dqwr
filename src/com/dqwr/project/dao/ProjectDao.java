package com.dqwr.project.dao;

import java.sql.Connection;
import java.sql.ResultSet;

import beans.Emp;

public interface ProjectDao {
 public boolean deleteProject(Connection con,int projectid);
 public ResultSet editProject(Connection con,int projectid);
 public ResultSet lookProject(Connection con,int projectid);
 public void processMonitor();
 public boolean updateProject(Connection con,Emp emp);
 public boolean updateProjectPdf(Connection con,Emp emp);
}
