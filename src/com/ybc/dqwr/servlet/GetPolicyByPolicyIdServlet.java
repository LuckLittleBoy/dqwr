package com.ybc.dqwr.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.alibaba.fastjson.JSONObject;
import com.ybc.dqwr.dao.PolicyDao;
import com.ybc.dqwr.entity.Policy;

public class GetPolicyByPolicyIdServlet extends HttpServlet
{
private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String policyId = request.getParameter("policyId");
		JSONObject j=new JSONObject();
		response.setContentType("text/html;charset=utf-8");
		PolicyDao policyDao=new PolicyDao();
		Policy policy=new Policy();
		if(policyId!=null&&!policyId.equals("")){
			try
			{
				policy=policyDao.getPolicyByPolicyId(policyId);
				j.put("msg", "ok");
				j.put("data", policy);
			} catch (Exception e)
			{
				j.put("msg", "error");
			}
		}
		response.getWriter().println(j);
		response.getWriter().flush();
		response.getWriter().close();
	}
}
