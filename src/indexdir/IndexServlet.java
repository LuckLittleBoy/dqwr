package indexdir;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IndexServlet
 */
public class IndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public IndexServlet() {
        super(); 
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");	//设置编码
		response.setCharacterEncoding("utf-8");	//设置编码 
		String str_query=request.getParameter("str_query");
		String arrwh=request.getParameter("arrwh");
		request.getSession().setAttribute("str_query", str_query);
		//str_query = java.net.URLDecoder.decode(str_query, "UTF-8");
		Index index=new Index();
		String path =request.getSession().getServletContext().getRealPath("\\index") ;
		System.out.println("path");
		if(arrwh==null){
			try {
				index.CreateIndex(path);
				response.getWriter().print(index.searchIndex(str_query).replace("\\", ""));
				
			} catch (Exception e) {
				System.out.println("检索出错");
				response.getWriter().print("{'querys':[]}");
				//e.printStackTrace();
			}
		}else{
			try {
				index.CreateIndex(path);
				response.getWriter().print(index.searchIndexInresult(str_query,arrwh).replace("\\", ""));
				
			} catch (Exception e) {
				System.out.println("检索出错");
				response.getWriter().print("{'querys':[]}");
				//e.printStackTrace();
			}
			
		}
		
		//index.indexOptimize();
	}

}
