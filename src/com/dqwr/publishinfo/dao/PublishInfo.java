package com.dqwr.publishinfo.dao;

import java.sql.Connection;
import java.sql.ResultSet;

import com.dqwr.publishinfo.entity.Info;

public interface PublishInfo {
  public String insertInfo(Connection conn,Info info);
  public boolean deleteInfo(Connection conn,int InfoId);
  public String alterInfo(int InfoId);
  public ResultSet selectInfoAll(Connection conn);
  public ResultSet selectInfoById(Connection conn,int infoId);
  public boolean updateInfo(Connection conn,int infoid,int ispass,String yjnr);
  public boolean editInfo0(Connection coon,int infoid,String creator,String title,String publictime,String content);
  public boolean editInfo1(Connection coon,int infoid,String creator,String title,String publictime,byte scope,String content);
  
}
