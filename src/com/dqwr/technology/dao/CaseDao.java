package com.dqwr.technology.dao;

import java.sql.Connection;
import java.sql.ResultSet;

import com.dqwr.publishinfo.entity.Info;
import com.dqwr.technology.entity.Case;
import com.dqwr.technology.entity.Technology;

public interface CaseDao {
  public String insertInfo(Connection conn,Case cases);
  public boolean deleteCase(Connection conn,int techid);
  public String alterInfo(String InfoId);
  public ResultSet selectInfoAll(Connection conn);
  public ResultSet selectCaseById(Connection conn,int infoId);
  
}
