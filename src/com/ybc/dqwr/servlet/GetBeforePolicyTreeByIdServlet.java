package com.ybc.dqwr.servlet;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.alibaba.fastjson.JSONObject;
import com.ybc.dqwr.dao.PolicyDao;
import com.ybc.dqwr.entity.PolicyTree;

public class GetBeforePolicyTreeByIdServlet extends HttpServlet
{
private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String timeselect=request.getParameter("timeselect");
		String starttime=request.getParameter("starttime");
		String endtime=request.getParameter("endtime");
		JSONObject j=new JSONObject();
		response.setContentType("text/html;charset=utf-8");
		PolicyDao policyDao=new PolicyDao();
		ArrayList<ArrayList<PolicyTree>> policyLists =new ArrayList<ArrayList<PolicyTree>>();
		ArrayList<ArrayList<PolicyTree>> policyLists1 =new ArrayList<ArrayList<PolicyTree>>();
		if(id!=null&&!id.equals("")){
			try
			{
				policyLists=policyDao.getBeforePolicyFamilyTreeById(id,timeselect,starttime,endtime);
				policyLists1=policyDao.getAfterPolicyFamilyTreeById(id,timeselect,starttime,endtime);
				j.put("msg", "ok");
				j.put("policyBeforeTreeLists", policyLists);
				j.put("policyAfterTreeLists", policyLists1);
			} catch (Exception e)
			{
				e.printStackTrace();
				j.put("msg", "error");
			}
		}
		response.getWriter().println(j);
		response.getWriter().flush();
		response.getWriter().close();
	}
}
