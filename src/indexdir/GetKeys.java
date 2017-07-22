package indexdir;

import java.io.*;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.dqwr.db.Sqlcon;

public class GetKeys extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GetKeys() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,  response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");	//设置编码
		response.setCharacterEncoding("utf-8");	//设置编码
		String str_query=request.getParameter("str_query");
		String isusernokeysku=request.getParameter("usernokeysku");
		String isuserkeysku=request.getParameter("userkeysku");
		System.out.println(str_query);
		//读取文件
		String path =request.getSession().getServletContext().getRealPath("\\lexicon") ;
		System.out.println(path);
		String keysStr="";
		String nokeysStr="";
		//读取关键词库
		if(isuserkeysku.equals("true")){
			try { 
				ResultSet rs=null;
				String sql="SELECT * from GJCK";
				System.out.println(sql);
				rs = Sqlcon.executeQuery(sql);
				while(rs.next()){
					keysStr+=rs.getString("name").replace(" ", "")+",";					
				}
				rs.close();
				Sqlcon.close();
			
			} catch (Exception e) { 
				e.printStackTrace(); 
			} 
			
		}
		//读取无用关键词库
		if(isusernokeysku.equals("true")){
			try { 
				ResultSet rs=null;
				String sql="SELECT * from WYGJCK";
				System.out.println(sql);
				rs = Sqlcon.executeQuery(sql);
				while(rs.next()){
					keysStr+=rs.getString("name").replace(" ", "")+",";					
				}
				rs.close();
				Sqlcon.close();
			} catch (Exception e) { 
				e.printStackTrace(); 
			} 			
		}	
		System.out.println(keysStr);
		String[] cutkeys=keysStr.split(",");
		String[] cutnokeys=nokeysStr.split(",");
		Analyzer analyzer=new IKAnalyzer();
		TokenStream ts=analyzer.tokenStream("myfield",new StringReader(str_query));
		List<String> keys=new ArrayList<String>();
		try {		
			while(ts.incrementToken()){
				String str=ts.toString().split(",")[2].replace(")", "");
				if(str.length()>1){//关键词长度必须大于1
					Boolean isnokey=false;
					Boolean iskey=false;
					if(isuserkeysku.equals("true")){
						//判断关键词库中是否存在此关键词
						for(String i : cutkeys){						
							if(str.equals(i)){							
								iskey=true;
								break;
							}
						}	
						//是关键词库中存在的，则加入关键词表，跳过，不再查询无用词库，如果关键词库、无用词库都存在，则关键词库优先			
						if(iskey==true){
							keys.add(str);
							continue;
						}
						continue;
					}
							
					if(isusernokeysku.equals("true")){
						//判断无用词库中是否存在此关键词
						for(String i : cutnokeys){	
							if(str.equals(i)){
								System.out.println("跳过————"+str);
								isnokey=true;
								break;
							}
						}					
					}
					if(isnokey==false)keys.add(str);				
					System.out.println(str);
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//去重复的
		String[] str=keys.toArray(new String[keys.size()]);  
	    List<String> list = new ArrayList<String>();  
	    for (int i=0; i<str.length; i++) {  
	            if(!list.contains(str[i])) {  
	                list.add(str[i]);  
	            }  
	    }           
		JSONArray msg=JSONArray.fromObject(list);	
		String strmsg=msg.toString();
		strmsg="{'keys':"+strmsg+"}";	
		System.out.println(strmsg);
		list=null;
		keys=null;
		response.getWriter().print(strmsg);
	}

}
