package com.dqwr.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import com.dqwr.dao.*;
import com.dqwr.entity.YH;
import com.dqwr.model.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class submitpolicy
 */

public class zcluru extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DataBaseDao database = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public zcluru() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		super.init(config);
		database = new com.dqwr.dao.DataBaseDao();
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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Connection con = database.connection();
		try {

			/*
			 * 接受各种属性
			 */
			String qqtaglist = request.getParameter("qqtag");

			String qqtag;
			if (qqtaglist != null && qqtaglist.equals("1")) {
				qqtag = "0";
			} else
				qqtag = "1";
			String swtag;
			String swtaglist = request.getParameter("swtag");
			if (swtaglist != null && swtaglist.equals("1")) {
				swtag = "0";
			} else
				swtag = "1";
			String sxtag;
			String sxtaglist = request.getParameter("sxtag");
			if (sxtaglist != null && sxtaglist.equals("1")) {
				sxtag = "0";
			} else
				sxtag = "1";
			System.out
					.println("qqtaglist:" + qqtaglist + sxtaglist + swtaglist);
			System.out.println("qqtag:" + qqtag + sxtag + swtag);

			String zcmc = request.getParameter("zcmc");// 政策名称
			System.out.println("zcmc" + zcmc);
			if ("".equals(zcmc)) {
				zcmc = null;
			}
			String sxfw = null;

			if ((!"".equals(request.getParameter("sxfw")) && (request
					.getParameter("sxfw") != null))) {
				sxfw = request.getParameter("sxfw");// 施行范围

			}
			String sxfwmc = null;

			if ((!"".equals(request.getParameter("sxfwmc")) && (request
					.getParameter("sxfwmc") != null))) {
				sxfwmc = request.getParameter("sxfwmc");// 施行范围

			}
			String zcid = "0";
			if (((request.getParameter("zcid") != null) && !"".equals(request
					.getParameter("zcid")))) {
				zcid = request.getParameter("zcid");// zcid;
			}
			String zcwh = request.getParameter("zcwh");// 政策文号

			if ("".equals(zcwh)) {
				zcwh = null;
			}
			String zcfl = request.getParameter("zcfl");// 政策分类
			String zdjg = null;
			if (!"".equals(request.getParameter("zdjg"))
					&& (request.getParameter("zdjg") != null)) {
				zdjg = request.getParameter("zdjg");// 制定机关
			}
			String zdjgmc = null;
			if (!"".equals(request.getParameter("zdjgmc"))
					&& (request.getParameter("zdjgmc") != null)) {
				zdjgmc = request.getParameter("zdjgmc");// 制定机关
			}
			if ("".equals(zcfl)) {
				zcfl = null;
			}
			String bbxs = request.getParameter("bbxs");// 颁布形式
			if ("".equals(bbxs)) {
				bbxs = null;
			}

			String gbrq = request.getParameter("gbrq");// 公布日期
			if ("".equals(gbrq)) {
				gbrq = null;
			}

			String sxrq = request.getParameter("sxrq");// 施行日期
			if ("".equals(sxrq)) {
				sxrq = null;
			}

			String tzly = request.getParameter("tzly");// 调整领域
			if ("".equals(tzly)) {
				tzly = null;
			}

			String swzc = request.getParameter("swzc");// 上位政策
			if ("".equals(swzc)) {
				swzc = null;
			} else {
				String[] swzclist = swzc.split(";");
				swzc = "";
				for (int i = 0; i < swzclist.length; i++) {
					int tag = ZCMD.checkSWQQ(con, swzclist[i]);
					if (tag == 1) {
						if (swzc == "")
							swzc += swzclist[i];
						else
							swzc = swzc + ";" + swzclist[i];
					}
				}
				if (swzc == "")
					swzc = null;
			}
			String fj = request.getParameter("fj");
			if ("".equals(fj)) {
				fj = null;
			}
			String qqzc = request.getParameter("qqzc");// 前趋政策
			if ("".equals(qqzc)) {
				qqzc = null;
			} else {
				String[] qqzclist = qqzc.split(";");
				qqzc = "";
				for (int i = 0; i < qqzclist.length; i++) {
					int tag = ZCMD.checkSWQQ(con, qqzclist[i]);
					if (tag == 1) {
						if (qqzc == "")
							qqzc += qqzclist[i];
						else
							qqzc = qqzc + ";" + qqzclist[i];
					}
				}
				if (qqzc == "")
					qqzc = null;
			}
			String sxztw = request.getParameter("sxzt");// 时效状态
			if ("".equals(sxztw)) {
				sxztw = null;
			}
			String fzrq = request.getParameter("fzrq");// 废止日期

			if ("失效时可填".equals(fzrq) || "".equals(fzrq)) {
				fzrq = null;
			}
			String gjz[] = new String[10];
			int i = 0;
			// 关键字

			if (!"".equals(request.getParameter("gjz1"))) {
				gjz[i] = request.getParameter("gjz1");
				i++;
			}
			if (!"".equals(request.getParameter("gjz2"))) {
				gjz[i] = request.getParameter("gjz2");
				i++;
			}
			if (!"".equals(request.getParameter("gjz3"))) {
				gjz[i] = request.getParameter("gjz3");
				i++;
			}
			if (!"".equals(request.getParameter("gjz4"))) {
				gjz[i] = request.getParameter("gjz4");
				i++;
			}
			if (!"".equals(request.getParameter("gjz5"))) {
				gjz[i] = request.getParameter("gjz5");
				i++;
			}
			if (!"".equals(request.getParameter("gjz6"))) {
				gjz[i] = request.getParameter("gjz6");
				i++;
			}
			if (!"".equals(request.getParameter("gjz7"))) {
				gjz[i] = request.getParameter("gjz7");
				i++;
			}
			if (!"".equals(request.getParameter("gjz8"))) {
				gjz[i] = request.getParameter("gjz8");
				i++;
			}
			if (!"".equals(request.getParameter("gjz9"))) {
				gjz[i] = request.getParameter("gjz9");
				i++;
			}
			if (!"".equals(request.getParameter("gjz10"))) {
				gjz[i] = request.getParameter("gjz10");
				i++;
			}
			String ztc[] = new String[5];
			int j = 0;
			if (!"".equals(request.getParameter("ztc1"))) {
				ztc[j] = request.getParameter("ztc1");
				j++;
			}
			if (!"".equals(request.getParameter("ztc2"))) {
				ztc[j] = request.getParameter("ztc2");
				j++;
			}
			if (!"".equals(request.getParameter("ztc3"))) {
				ztc[j] = request.getParameter("ztc3");
				j++;
			}
			if (!"".equals(request.getParameter("ztc4"))) {
				ztc[j] = request.getParameter("ztc4");
				j++;
			}
			if (!"".equals(request.getParameter("ztc5"))) {
				ztc[j] = request.getParameter("ztc5");
				j++;
			}
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String shzt = request.getParameter("shzt");// 提交状态
			String zcnr = null;
			zcnr = request.getParameter("zcnr");
			if (zcnr == null) {
				if (!"".equals((String) request.getSession().getAttribute(
						"content1"))
						&& (String) request.getSession().getAttribute(
								"content1") != null) {
					zcnr = (String) request.getSession().getAttribute(
							"content1");

				} else if (((String) request.getSession().getAttribute(
						"content1") == null || "".equals((String) request
						.getSession().getAttribute("content1")))
						&& (String) request.getSession().getAttribute(
								"content2") != null
						&& !"".equals((String) request.getSession()
								.getAttribute("content2"))) {
					zcnr = (String) request.getSession().getAttribute(
							"content2");

				}
			}
			YH user = (YH) request.getSession().getAttribute("user");
			/**
			 * 处理添加操作或者修改操作
			 */
			/*
			 * if(zcnr==null){ zcnr = request.getParameter("zcnr"); }
			 */
			System.out.println("zcnr :" + zcnr);
			if (zcnr != null && zcwh != null && zcmc != null && zcfl != null) {

				if ("提交审查".equals(shzt)) {
					shzt = "待审核";
					ZCMD.TJZC(con, zcid, zcwh, zcmc, zcnr, user.getYHID(),
							sxztw, zcfl, sxfw, bbxs, zdjg, gbrq, sxrq, swzc,
							qqzc, shzt, fzrq, tzly, ztc, gjz, swtag, qqtag,
							sxtag, fj, df.format(new Date()), zdjgmc, sxfwmc);
				}
				if ("保存文件".equals(shzt)) {
					shzt = "待标引";
					ZCMD.TJZC(con, zcid, zcwh, zcmc, zcnr, user.getYHID(),
							sxztw, zcfl, sxfw, bbxs, zdjg, gbrq, sxrq, swzc,
							qqzc, shzt, fzrq, tzly, ztc, gjz, swtag, qqtag,
							sxtag, fj, df.format(new Date()), zdjgmc, sxfwmc);
				}
				database.closeConnection(con);
				request.getSession().removeAttribute("content1");
				request.getSession().removeAttribute("content2");
				response.getWriter().print("true");
			}
			/**
			 * 跳转
			 */
			else
				response.getWriter().print("政策文号，政策名称，政策分类，政策内容均不能为空！");

		} catch (Exception e) {
			System.out.println("query error:" + e);
			database.closeConnection(con);
			e.printStackTrace();
			response.getWriter().print("存在政策内容相同的政策");
		}
	}

}
