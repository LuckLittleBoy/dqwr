package com.dqwr.publishinfo.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Test.JpgTest;

import com.jspsmart.upload.File;
import com.jspsmart.upload.Request;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.YH;
import com.dqwr.publishinfo.dao.impl.PublishInfoImpl;
import com.dqwr.publishinfo.entity.Info;
import com.dqwr.util.ReadProjectExcelToDb;
import com.jspsmart.upload.SmartUpload;

public class PublishPic1 extends HttpServlet{

	private static final long serialVersionUID = 1L;
    private DataBaseDao database = null;
    private ServletConfig config;
    private PreparedStatement ps = null; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublishPic1() {
        super();
        database = new DataBaseDao();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config) throws ServletException {
    	this.config = config;
    	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("进来了");
		super.doGet(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("进来了111");
		request.setCharacterEncoding("gbk");
		SmartUpload su = new SmartUpload();
		su.initialize(config,request,response);
		try {
			su.upload();
		} catch (SmartUploadException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {

			int count = su.getFiles().getCount();
			for (int i = 0; i < count; i++) {
				File myFile = su.getFiles().getFile(i);
                System.out.println(myFile.getFilePathName());
				long bigSize = myFile.getSize();
				myFile.saveAs("C:/temp/1.jpg", su.SAVE_PHYSICAL);
				
				//获取原图片的字符流
				java.io.File filebig = new java.io.File("C:/temp/1.jpg");
				FileInputStream fisbig = new FileInputStream(filebig);
				InputStreamReader isbig = new InputStreamReader(
						new FileInputStream(filebig));
				
				//对原图片进行处理
				JpgTest  convert=new JpgTest();
				//convert.JpgChange();
				
				//获取处理后缩略图的字符流
				java.io.File filesmall = new java.io.File("C:/temp.jpg");
				FileInputStream fissmall = new FileInputStream(filesmall);
				long smallSize=filesmall.length();
				InputStreamReader issmall = new InputStreamReader(
						new FileInputStream(filesmall));
				
				//将图片存储到数据库中
				//获取时间
				Date now=new Date();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
				String datetime = dateFormat.format(now); 
				String sql = "insert into PublicPic (Big,Small,Time) values(?,?,?)";
				System.out.println(sql);

				try {
					PreparedStatement ps = database.connection().prepareStatement(sql);
					// ps.setBinaryStream(2, fis, (int) fileSize);
					// ps.setBlob(2, fis,(long)fileSize);
					// ps.setCharacterStream(2, isr, (int) fileSize);
					ps.setBinaryStream(1, fisbig, (long) bigSize);
					ps.setBinaryStream(2, fissmall, (long)smallSize);
					ps.setString(3,datetime);
					ps.executeUpdate();
					database.connection().commit();

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} finally {
					fisbig.close();
					fissmall.close();
					isbig.close();
					issmall.close();
					//SQlConnectionTest.closeAll(dt.getConn(), ps, null);
					database.closeConnection(database.connection());
					ps = null;
				}
			}
	}catch(Exception e){
		e.printStackTrace();
	}	
	}
}