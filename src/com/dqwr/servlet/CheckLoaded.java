package com.dqwr.servlet;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckLoaded
 */
public class CheckLoaded extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLoaded() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String filename=request.getParameter("filename");
		filename = java.net.URLDecoder.decode(filename, "UTF-8");
		if(request.getSession().getAttribute(filename)!=null&&request.getSession().getAttribute(filename).equals("success")){
			response.getWriter().print("success");		
		}else{
			response.getWriter().print("fail");
			
		}
	}

}
