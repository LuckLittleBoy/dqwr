package com.dqwr.publishinfo.bean;

import java.sql.Connection;

import com.dqwr.publishinfo.entity.Info;

public interface PublishInfo {
  public String insertInfo(Connection conn,Info info);
  public String deleteInfo(String InfoId);
  public String alterInfo(String InfoId);
  public String checkInfo();
}
