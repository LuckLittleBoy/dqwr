package com.dqwr.requirement.dao1;

import java.sql.Connection;
import java.sql.ResultSet;

import com.dqwr.requirement.entity.Requirement;

public interface RequireDao {
  public String insertRequire(Connection conn,Requirement info);
  public ResultSet AllReuqire(Connection conn);
  public ResultSet SelectRequireById(Connection conn, int requid);
  public String insertRequire11(Connection conn, Requirement req);
  public boolean requirementIsExistById(Connection conn,String orgaid);
}
