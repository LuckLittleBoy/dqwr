package com.satp.wordManager;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.wltea.analyzer.lucene.IKAnalyzer;

import net.sf.json.JSONArray;
import net.sourceforge.pinyin4j.PinyinHelper;
import beans.Word;
import beans.WordConut;

/**
 * Servlet implementation class GetWordCount2
 */
public class GetWordCount2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetWordCount2() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");	//设置编码
		response.setCharacterEncoding("utf-8");	//设置编码
		String str_query=request.getParameter("str_query");
		Analyzer analyzer=new IKAnalyzer();
		TokenStream ts=analyzer.tokenStream("myfield",new StringReader(str_query));
		List<String> keys=new ArrayList<String>();
		try {		
			while(ts.incrementToken()){
				String str=ts.toString().split(",")[2].replace(")", "");
				if(str.length()>1){//关键词长度必须大于1
					keys.add(str);			
					System.out.println(str);
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<WordConut> wordconut=new ArrayList<WordConut>();
		
		System.out.println("11111111");
		for(String word : keys){	
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
			System.out.println("(((((((("+strmsg);
		/*try { 
		//	InputStream file = new File(path+"\\keysku.dic"); 
			BufferedReader reader = null;
			System.out.println("***********读取关键词库："); 
			reader = new BufferedReader(new InputStreamReader(new FileInputStream(path+"\\keysku.dic"),"UTF-8")); 
			String tempString = null; 
			List<String> strList = new ArrayList<String>();			
			while ((tempString = reader.readLine()) != null){
				strList.add(tempString);			
				System.out.println(tempString);
			} 
			reader.close(); 
			String[] word= new String[strList.size()];
			for (int i = 0; i < strList.size(); i++) {
				word[i] = strList.get(i).toString();
	        }
			Comparator cmp = Collator.getInstance(java.util.Locale.CHINA);	        
		    Arrays.sort(word, cmp);
		    List<Word> wordList = new ArrayList<Word>();
		    for(int i=0;i<word.length;i++){
		    	Word w=new Word();
		    	w.setId(i+1);
		    	w.setKeys(word[i]);
		    	String[] pinyin=PinyinHelper.toHanyuPinyinStringArray(word[i].charAt(0));
		    	if(pinyin!=null){
		    		w.setZimu(pinyin[0].charAt(0));
		    	}
		    	wordList.add(w);	
		    }
		    JSONArray msg=JSONArray.fromObject(wordList);		
			String strmsg=msg.toString();
			strmsg="{'words':"+strmsg+"}";	
			response.getWriter().print(strmsg);
			System.out.println("关键词库："+strmsg);
		} catch (IOException e) { 
			e.printStackTrace(); 
		} */
		
	}

}
