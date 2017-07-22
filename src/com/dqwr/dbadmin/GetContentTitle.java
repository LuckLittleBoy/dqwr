package com.dqwr.dbadmin;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tools.DELHTML;

import com.dqwr.db.Sqlcon;
import com.dqwr.entity.YH;

/**
 * Servlet implementation class GetContentTitle
 */
public class GetContentTitle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetContentTitle() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			String content=request.getParameter("content");
			content=content.substring(content.indexOf("<div"), content.length());
			String []arr=content.split("\n");
			System.out.println(content);
			String title="";
			String zwh="";
			for(int i=0;i<arr.length;i++){
				String wh=DELHTML.delHTMLTag(arr[i]);
				System.out.println(wh);
				if(wh.length()>1&&wh.length()<25){
					System.out.println("++sssss"+wh);
					if(wh.indexOf("号")>=0){
						zwh=wh;
						break;
					}
					
				}
			}
			int start=content.indexOf("<h1>");
			int end=content.indexOf("</h1>");
			if(start>=0&&end>=0&&start<end){
				title=content.substring(start+4, end);
				//System.out.println(title);
			}
			else{
				start=content.indexOf("<H1>");
				end=content.indexOf("</H1>");
				if(start>=0&&end>=0&&start<end){
					title=content.substring(start+4, end);
					//System.out.println(title);
				}else{
					start=content.indexOf("<h2>");
					end=content.indexOf("</h2>");
					if(start>=0&&end>=0&&start<end){
						title=content.substring(start+4, end);
						//System.out.println(title);
					}else{
						start=content.indexOf("<H3>");
						end=content.indexOf("</H3>");
						if(start>=0&&end>=0&&start<end){
							title=content.substring(start+4, end);
							//System.out.println(title);
						}else{
							start=content.indexOf("<h3>");
							end=content.indexOf("</h3>");
							if(start>=0&&end>=0&&start<end){
								title=content.substring(start+4, end);
								//System.out.println(title);
							}else{
								start=content.indexOf("<H2>");
								end=content.indexOf("</H2>");
								if(start>=0&&end>=0&&start<end){
									title=content.substring(start+4, end);
									//System.out.println(title);
								}
							} 
						} 
					} 
				} 
			} 
			if(title.length()>1){
				arr=title.split("\n");
			}
			
			for(int i=0;i<arr.length;i++){
				if(DELHTML.delHTMLTag(arr[i]).length()>2){
					title=arr[i];
					break;
				}
			}
			String []arr2=title.split("<br>");;
			for(int i=0;i<arr2.length;i++){
				if(DELHTML.delHTMLTag(arr2[i]).length()>2){
					title=arr2[i];
					break;
				}
			}
			String []arr3=title.split("</p>");;
			for(int i=0;i<arr3.length;i++){
				if(DELHTML.delHTMLTag(arr3[i]).length()>2){
					title=arr3[i];
					break;
				}
			}
			String []arr4=title.split("。");;
			for(int i=0;i<arr4.length;i++){
				if(DELHTML.delHTMLTag(arr4[i]).length()>2){
					title=arr4[i];
					break;
				}
			}
			
			title=DELHTML.delHTMLTag(title.replace("\r\n", "").replace("\n", ""));
			response.getWriter().print("{'title':'"+title.replace(" ", "")+"','wh':'"+zwh.replace(" ", "")+"'}");
			//System.out.println("TTTTTT"+title);
			//System.out.println("cccccc"+content);
			//System.out.println(request.getSession().getAttribute("content1"));
		}
		catch(Exception e){
			
		}
		
	
	}

}