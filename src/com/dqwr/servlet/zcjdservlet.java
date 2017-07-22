package com.dqwr.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.YH;
import com.dqwr.entity.ZCJDEntity;
import com.dqwr.model.ZCJD;

/**
 * Servlet implementation class zcjdservlet
 */
public class zcjdservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataBaseDao database = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public zcjdservlet() {
		super();
		database = new DataBaseDao();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String actionUrl = request.getServletPath();
		if (actionUrl.equals("/all.zcjd")) {
			Connection con = database.connection();
			/**
			 * pagesize 页大小 currentpage 页码
			 */
			String pagesize = request.getParameter("pagesize");
			String currentpage = request.getParameter("currentpage");
			String searchnr = request.getParameter("searchnr");
			String result;
			if (searchnr != null && !searchnr.equals("")) {
				result = ZCJD.ZCJDLL(con, pagesize, currentpage, searchnr);
			} else {
				result = ZCJD.ZCJDLL(con, pagesize, currentpage);
			}
			PrintWriter out = response.getWriter();
			database.closeConnection(con);

			out.print(result);
		} else if (actionUrl.equals("/jdyw.zcjd")) {
			Connection con = database.connection();
			String jdid = request.getParameter("jdid");
			ZCJDEntity zcjd = ZCJD.ZCJDyw(con, jdid);
			request.setAttribute("zcjd", zcjd);
			database.closeConnection(con);

			request.getRequestDispatcher("/ws/zcjdyw.jsp").forward(request,
					response);
		} else if (actionUrl.equals("/jdbjyw.zcjd")) {
			Connection con = database.connection();
			String jdid = request.getParameter("jdid");
			ZCJDEntity zcjd = ZCJD.ZCJDyw(con, jdid);
			request.setAttribute("zcjd", zcjd);
			database.closeConnection(con);

			request.getRequestDispatcher("/ws/zcjdbj.jsp").forward(request,
					response);
		} else if (actionUrl.equals("/delete.zcjd")) {
			Connection con = database.connection();
			PrintWriter out = response.getWriter();
			String jdid = request.getParameter("jdid");
			int rs = ZCJD.ZCJDdelete(con, jdid);
			database.closeConnection(con);

			if (rs == 0) {
				out.print("删除失败");
			} else {
				out.print("删除成功");
			}
		} else if (actionUrl.equals("/update.zcjd")) {
			PrintWriter out = response.getWriter();
			String jdid = request.getParameter("jdid");
			String content = request.getParameter("content1");
			String title = request.getParameter("title");
			String result = "";
			if (title == null || content == null || title.equals("请写入标题名...")
					|| content.equals("")) {
				result = "政策解读更新失败，标题或内容为空";

			} else {
				Connection con = database.connection();
				result = com.dqwr.model.ZCJD.ZCJDUpdate(con, title, jdid,
						content);
				database.closeConnection(con);
			}
			request.setAttribute("result", result);
			request.getRequestDispatcher("/ws/zcjdll.jsp").forward(request,
					response);
		} else if (actionUrl.equals("/jdywqt.zcjd")) {
			Connection con = database.connection();
			String jdid = request.getParameter("jdid");
			ZCJDEntity zcjd = ZCJD.ZCJDyw(con, jdid);

			int count = Integer.parseInt(zcjd.getClick()) + 1;
			ZCJD.ZCJDcount(con, jdid, count);
			zcjd.setClick(count + "");
			database.closeConnection(con);

			request.setAttribute("zcjd", zcjd);
			request.getRequestDispatcher("/qt/zcjdyw.jsp").forward(request,
					response);
		}
	}

}
