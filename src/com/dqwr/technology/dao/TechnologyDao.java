package com.dqwr.technology.dao;

import java.sql.Connection;
import java.sql.ResultSet;

import com.dqwr.publishinfo.entity.Info;
import com.dqwr.technology.entity.Technology;

public interface TechnologyDao {
  public String insertInfo(Connection conn,Technology tech);
  public boolean deleteTech(Connection conn,int Techid);
  public boolean alterTech(Connection conn,String InfoId);
  public ResultSet selectTechAll(Connection conn);
  public ResultSet selectTechById(Connection conn,int infoId);
  
}
