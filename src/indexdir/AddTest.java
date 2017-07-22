package indexdir;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Article;

/**
 * Servlet implementation class AddTest
 */
public class AddTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTest() {
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");	//设置编码
		response.setCharacterEncoding("utf-8");	//设置编码
		System.out.println(request.getParameter("id"));
		String id=request.getParameter("id");
		String title=request.getParameter("title");
		String type=request.getParameter("type");
		String content=request.getParameter("content");
		Article a= new Article();
		a.setId(id);
		a.setTitle(title);
		a.setContent(content);
		a.setClasstify(type);
		a.setDate(new Date().toLocaleString());
		Index index=new Index();
		String path =request.getSession().getServletContext().getRealPath("\\index") ;
		try {
			index.CreateIndex(path);
			index.addDocIndex(a);
			response.getWriter().print("添加成功");
			System.out.println("date:"+a.getDate());
			System.out.println("type:"+a.getClasstify());
			
		} catch (Exception e) {
			System.out.println("添加出错");
			e.printStackTrace();
		}
		
	
		
	}

}
