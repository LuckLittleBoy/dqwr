package com.dqwr.requirement.dao1;

import java.sql.Connection;
import java.sql.ResultSet;

import com.dqwr.requirement.entity.Orga;
import com.dqwr.requirement.entity.Requirement;

public interface OrgaDao {
  public String insertOrga(Connection conn,Orga orga);
  public ResultSet SelectOrgaById(Connection conn, String OrgaId);
 String insertOrga11(Connection conn, Orga orga);
ResultSet selectOrgaById(Connection conn, int OrgaId);
}
