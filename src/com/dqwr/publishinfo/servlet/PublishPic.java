package com.dqwr.publishinfo.servlet;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
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

public class PublishPic extends HttpServlet{

	private static final long serialVersionUID = 1L;
    private DataBaseDao database = null;
    private ServletConfig config;
    private PreparedStatement ps = null; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PublishPic() {
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
		String path=request.getSession().getServletContext().getRealPath("/");
		System.out.println("前台展示图片存储路径"+path);
		request.setCharacterEncoding("gbk");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
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
                //获取当前时间
                Date now=new Date();
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");//可以方便地修改日期格式
				String datetime_file = dateFormat.format(now);
				SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
				String datetime_db = dateFormat1.format(now);
				//定义原图存储路径
				String Bigpath=path+"images\\Publicpic\\"+datetime_file+"big.jpg";
				System.out.println(Bigpath);
				java.io.File f=new java.io.File(Bigpath);
				if (!f.exists()) {
		            try {
		                f.createNewFile();
		            } catch (IOException e) {
		            	out.print("<script language=javascript>" + "alert('发布图片失败！');"+"document.location.href='ws/Public_pic.jsp'"+"</script>");
		                e.printStackTrace();
		            }
				}
				//定义相应缩略图存储路径
				String Smallpath=path+"images\\Publicpic\\"+datetime_file+"small.jpg";
				myFile.saveAs(Bigpath, su.SAVE_PHYSICAL);
				//对原图片进行处理然后存储
				JpgTest  convert=new JpgTest();
				convert.JpgChange(Bigpath,Smallpath);
				String sql = "insert into PublicPic (Big,Small,Time) values(?,?,?)";
				System.out.println(sql);
				try {
					PreparedStatement ps = database.connection().prepareStatement(sql);
					ps.setString(1,Bigpath);
					ps.setString(2,Smallpath);
					ps.setString(3,datetime_db);
					ps.executeUpdate();
					database.connection().commit();

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					out.print("<script language=javascript>" + "alert('发布图片失败！');"+"document.location.href='ws/Public_pic.jsp'"+"</script>");
					e.printStackTrace();
				} 
					database.closeConnection(database.connection());
					ps = null;
					out.print("<script language=javascript>" + "alert('发布图片成功！');"+"document.location.href='ws/Public_pic.jsp'"+"</script>");
				}
	}catch(Exception e){
		out.print("<script language=javascript>" + "alert('发布图片失败！');"+"document.location.href='ws/Public_pic.jsp'"+"</script>");
		e.printStackTrace();
	}	
	}
}