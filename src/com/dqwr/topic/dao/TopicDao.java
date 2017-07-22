package com.dqwr.topic.dao;

import java.sql.Connection;

import com.dqwr.topic.entity.Topic;

public interface TopicDao {
 public boolean addTopic(Connection conn,Topic topic);
}
