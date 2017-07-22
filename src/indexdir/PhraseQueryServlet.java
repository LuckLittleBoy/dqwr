package indexdir;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PhraseQueryServlet
 */
public class PhraseQueryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PhraseQueryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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
		String key=request.getParameter("str_query");
		String arrwh=request.getParameter("arrwh");		
		key = java.net.URLDecoder.decode(key, "UTF-8");
		int slop=Integer.parseInt(request.getParameter("slop"));
		String issort=request.getParameter("issort");
		System.out.println(key+slop+issort);
		// key="国家,政策";
	//	int slop=20;
		request.getSession().setAttribute("str_query", key);
		String[] str_query=key.split(",");
		Index index=new Index();
		String path =request.getSession().getServletContext().getRealPath("\\index") ;
		if(arrwh==null){
			try {
				index.CreateIndex(path);
				response.getWriter().print(index.searchPhraseIndex(str_query,slop,issort).replace("\\", ""));
				
			} catch (Exception e) {
				System.out.println("检索出错");
				response.getWriter().print("{'querys':[]}");
				//e.printStackTrace();
			}
		}else{
			try {
				index.CreateIndex(path);
				response.getWriter().print(index.searchPhraseIndex(str_query,slop,issort,arrwh).replace("\\", ""));
				
			} catch (Exception e) {
				System.out.println("检索出错");
				response.getWriter().print("{'querys':[]}");
				//e.printStackTrace();
			}
		}
		
	}

}
