package com.dqwr.expert.dao;

import java.sql.Connection;
import java.sql.ResultSet;

import com.dqwr.expert.entity.Expert;
import com.dqwr.technology.entity.Case;

public interface ExpertDao {
	  public String insertExpert(Connection conn,Expert expert);
	  public boolean deleteExpert(Connection conn,int ExpertId);
	  public String alterExpert(String ExpertId);
	  public ResultSet selectExpertAll(Connection conn);
	  public ResultSet selectExpertById(Connection conn,int expertId);
}
