package checkRepeat;

import indexdir.Index;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class CheckRepeat
 */
public class CheckRepeat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckRepeat() {
        super();
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
		request.setCharacterEncoding("utf-8");	//设置编码
		response.setCharacterEncoding("utf-8");	//设置编码
		String str_query=request.getParameter("str_query").replace("[", " ").replace("]", " ").replace("~", " ").replace("^", " ").replace("\t", " ").replace("'", " ").replace("=", "等于").replace("<EOF>", " ").replace("*", "X").replace(" ", "").replace(":","冒号");
		//初始化索引库
		Index index=new Index();
		String path =request.getSession().getServletContext().getRealPath("\\index") ;
		String result="";
		String[] str_querts=str_query.split("\n");
		for(int i=0;i<str_querts.length;i++){
			if(str_querts[i].replace("　　　", "").length()>3){
				System.out.println("第"+i+"段内容为："+str_querts[i]);
				try {
					index.CreateIndex(path);
					String str=str_querts[i];
					
					result+=index.searchSimilarRepeatIndex(str)+",";
					
				} catch (Exception e) {
					System.out.println("检索出错");
					e.printStackTrace();
				}
			}
		}
		
		result=result.substring(0,result.length()-1);
		String strmsg="{result:["+result+"]}";	
		System.out.println(strmsg);
		response.getWriter().print(strmsg);
		//
		
	}

}
