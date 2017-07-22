package indexdir;

import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DELHTML;
import tools.DeleteDirectory;

import beans.Article;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class AddAllZC
 */
public class AddAllZC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddAllZC() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			
			response.setCharacterEncoding("utf-8");
			ResultSet rs=null;

			String sql="SELECT * from ZCSY ";
			System.out.println(sql);
			rs = Sqlcon.executeQuery(sql);
			String path =request.getSession().getServletContext().getRealPath("\\index") ;
			File dir=new File(path);
			DeleteDirectory.deleteDir(dir);		
			while(rs.next()){
				Article a= new Article();
				a.setId(rs.getString("ZCWH"));
				a.setTitle(rs.getString("ZCMC").replace(" ", ""));
				a.setContent(DELHTML.delHTMLTag(rs.getString("zcnr").replace(" ", "").replace("\r","").replace("\n","").replace("\t","").replace("&nbsp;", "")));
				a.setClasstify(rs.getString("ZCFLMC")==null?"无":rs.getString("ZCFLMC"));
				a.setDate(rs.getString("BSXRQ")==null?"无":rs.getString("BSXRQ"));
				Index index=new Index();
				
					
				index.CreateIndex(path);
				index.addDocIndex(a);	
				System.out.println("date:"+a.getTitle());
				index.indexOptimize();
				
				
			}
			rs.close();
			Sqlcon.close();
			response.getWriter().print("{'index':'success'}");
		}
		catch(Exception e){
			e.printStackTrace();
			response.getWriter().print("{'index':'fail'}");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,  response);
	}

}
