package com.dqwr.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.YH;
import com.dqwr.model.ZCMD;

/**
 * Servlet implementation class xd
 */
public class xd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static com.dqwr.dao.DataBaseDao database=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xd() {
        super();
        /**
         * 创建数据库对象
         */
		database = new com.dqwr.dao.DataBaseDao();
		
		

        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String zcid = request.getParameter("zcid");
		String sxzt = request.getParameter("sxzt");
		Connection con = database.connection();
		
		String fzrq = request.getParameter("fzrq");
		String qqzc = request.getParameter("qqzc");
		
		if(sxzt!=null&&"1".equals(sxzt)){
			fzrq=null;
		}
		if("".equals(qqzc)||qqzc==null){
			qqzc=null;
		}else{
			String[] qqzclist = qqzc.split(";");
			qqzc="";
			for(int i=0;i<qqzclist.length;i++){
				int tag = ZCMD.checkSWQQ(con, qqzclist[i]);
				if(tag==1){
					if(qqzc=="")
						qqzc+=qqzclist[i];
					else
						qqzc=qqzc+";"+qqzclist[i];
				}
			}
			if(qqzc=="")
				qqzc=null;
		}
		
		String swzc = request.getParameter("swzc");
		if("".equals(swzc)||swzc==null){
			swzc=null;
		}else{
			String[] swzclist = swzc.split(";");
			swzc="";
			for(int i=0;i<swzclist.length;i++){
				int tag = ZCMD.checkSWQQ(con, swzclist[i]);
				if(tag==1){
					if(swzc=="")
						swzc+=swzclist[i];
					else
						swzc=swzc+";"+swzclist[i];
				}
			}
			if(swzc=="")
				swzc=null;
		}
		YH user = (YH) request.getSession().getAttribute("user");
		/**
		 * 调用修订
		 */
		if(zcid==null&&swzc==null&& qqzc==null&& sxzt==null&& fzrq==null){
			
		}else{
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			ZCMD.xdzc(con, user.getYHID(), zcid, swzc, qqzc, sxzt, fzrq,df.format(new Date()));
			database.closeConnection(con);
		}
		response.getWriter().print(" <script language='javascript' type='text/javascript'>alert('已提交修订'); window.location.href='ws/syzc.jsp';</script>");

	}

}
