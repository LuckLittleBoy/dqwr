package indexdir;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;

/**
 * Servlet implementation class GetSeachMsg
 */
public class GetSeachMsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSeachMsg() {
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
		
		try{
			request.setCharacterEncoding("utf-8");	//设置编码
			response.setCharacterEncoding("utf-8");	//设置编码 
			String zcid=request.getParameter("zcid");
			String str_query=request.getSession().getAttribute("str_query").toString();
			//str_query = java.net.URLDecoder.decode(str_query, "UTF-8");
			System.out.println(zcid);
			try {
				String strmsg="";
				String sql="SELECT * from ZCSY where zcwh='"+zcid+"'";
				ResultSet rs=null;
				rs = Sqlcon.executeQuery(sql);
				if(rs.next()){
					String wh=rs.getString("ZCWH");
					String mc=rs.getString("ZCMC").replace(" ", "");
					String nr=rs.getString("zcnr").replace("\"", "'");
					String fl=rs.getString("ZCFLMC")==null?"无":rs.getString("ZCFLMC");
					String sxrq=rs.getString("BSXRQ")==null?"无":rs.getString("BSXRQ");
					System.out.println(nr);
					nr=URLEncoder.encode(nr, "utf-8");
					strmsg="{\"nr\":\""+nr+"\",\"wh\":\""+wh+"\",\"mc\":\""+mc+"\",\"fl\":\""+fl+"\",\"sxrq\":\""+sxrq+"\",\"str_query\":\""+str_query+"\"}";	
					System.out.println(strmsg);
					response.getWriter().print(strmsg);	
					Sqlcon.close();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("检索出错");
				response.getWriter().print("{'querys':'fail'}");
			}
		}
		catch(Exception e){
			response.getWriter().print("{'querys':'fail'}");
		}
	}

}
