package com.dqwr.publishinfo.dao;
import java.sql.Connection;
import java.sql.ResultSet;

import com.dqwr.publishinfo.entity.mzsm;
public interface PublishMzsm {
  public String insertMzsm(Connection conn,mzsm mzsm); 
  public ResultSet selectMzsmContent(Connection conn);

}
