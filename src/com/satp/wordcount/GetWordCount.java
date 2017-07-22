package com.satp.wordcount;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.wltea.analyzer.lucene.IKAnalyzer;

import beans.WordConut;

/**
 * Servlet implementation class GetWordCount
 */
public class GetWordCount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetWordCount() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");	//设置编码
		response.setCharacterEncoding("utf-8");	//设置编码
		String str_query=request.getParameter("msg");
		//获取主题词库
		String keysStr=null;
		String path =request.getSession().getServletContext().getRealPath("\\lexicon") ;
		try { 
			File file = new File(path+"\\keysku.dic"); 
			BufferedReader reader = null;
			System.out.println("***********读取关键词库："); 
			reader = new BufferedReader(new InputStreamReader(new FileInputStream(path+"\\keysku.dic"),"UTF-8")); 
			String tempString = null; 
			int line = 1; 
			//一次读入一行，直到读入null为文件结束 
			while ((tempString = reader.readLine()) != null){ 
				//显示行号 
				System.out.println("line " + line + ": " + tempString); 
				keysStr+=tempString+",";
				line++; 
			} 
			reader.close(); 
		} catch (IOException e) { 
			e.printStackTrace(); 
		} 
		String[] cutkeys=keysStr.split(",");
		Analyzer analyzer=new IKAnalyzer();
		TokenStream ts=analyzer.tokenStream("myfield",new StringReader(str_query));
		List<String> keys=new ArrayList<String>();
		String countkeysstr="";//jiang suo you zhu ti ci xie ru zi fu chuan,hou split fen ge tong ji
		try {		
			while(ts.incrementToken()){
				String str=ts.toString().split(",")[2].replace(")", "");
				if(str.length()>1){//关键词长度必须大于1	
					for(String i : cutkeys){	
						if(str.equals(i)){
							countkeysstr+=i+",";
						}
					}					
					System.out.println(str);
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<WordConut> wordconut=new ArrayList<WordConut>();
		String[] wors=countkeysstr.split(",");
		System.out.println("11111111"+countkeysstr);
		for(String word : wors){	
			Boolean isreword=false;
			for(int i=0;i<wordconut.size();i++){
				WordConut w=wordconut.get(i);
				if(word.equals(w.getStrname())){
					w.setNum(w.getNum()+1);
					isreword=true;
					break;
				}	
			}
			if(isreword==false){
				WordConut w=new WordConut() ;
				w.setNum(1);
				w.setStrname(word);
				wordconut.add(w);
			}
		}	
		 Comparator<WordConut> comparator = new Comparator<WordConut>(){
		

			public int compare(WordConut w1, WordConut w2) {
				 if(w1.getNum()!=w2.getNum()){
				     return w2.getNum()-w1.getNum();
				}
				return 0;
			}
		};
		Collections.sort(wordconut,comparator);
		JSONArray msg=JSONArray.fromObject(wordconut);	
		String strmsg=msg.toString();
		strmsg="{'wordconut':"+strmsg+"}";	
		response.getWriter().print(strmsg);
		
	}
}