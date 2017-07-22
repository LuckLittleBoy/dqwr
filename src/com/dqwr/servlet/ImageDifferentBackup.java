package com.dqwr.servlet;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class ImageDifferentBackup implements ServletContextListener
{

	@Override
	public void contextDestroyed(ServletContextEvent sce)
	{
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce)
	{
		PublicPicBackup.imageDifferentBackup(sce);
		TopicPicBackup.imageDifferentBackup(sce);
	}
}
