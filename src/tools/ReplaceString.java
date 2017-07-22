package tools;

import java.io.IOException;
import java.io.StringReader;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.index.Term;
import org.wltea.analyzer.lucene.IKAnalyzer;

import indexutil.LuceneUtils;

public class ReplaceString {
	public static String replace(String strSource, String strFrom, String strTo) {    
	    if (strSource == null) {        
	      return null;    
	    }  
	    int i = 0;
	    if ((i = strSource.indexOf(strFrom, i)) >= 0) {
	      char[] cSrc = strSource.toCharArray();
	      char[] cTo = strTo.toCharArray();
	      int len = strFrom.length();  
	      StringBuffer buf = new StringBuffer(cSrc.length);  
	      buf.append(cSrc, 0, i).append(cTo);
	      i += len;    
	      int j = i;       
	      while ((i = strSource.indexOf(strFrom, i)) > 0) {  
	        buf.append(cSrc, j, i - j).append(cTo);   
	        i += len;  
	        j = i;        
	      }        
	      buf.append(cSrc, j, cSrc.length - j); 
	      return buf.toString(); 
	    } 
	    return strSource;
	  }
	public static String dowithHighString(String strSource, String HighSource){
		String doSetContent=strSource;
		String contentText = HighSource;
		/**
		 * 处理高亮器处理完数据的缺失
		 */
		int starttext=contentText.indexOf("<font color='#FA6060'>")+22;
		int endtext=contentText.indexOf("</font>");
		String redayString=contentText.substring(starttext, endtext);
		doSetContent=ReplaceString.replace(doSetContent, redayString, "<font color='#FA6060'>"+redayString+"</font>");
		return doSetContent;
	}
	public static String dowithHighString2(String strSource, String strquery){
		String doSetContent=strSource;
		
		Analyzer analyzer=new IKAnalyzer();
		TokenStream ts=analyzer.tokenStream("myfield",new StringReader(strquery));
		try {
			while(ts.incrementToken()){
				String HighSource=ts.toString().split(",")[2].replace(")", "");
				doSetContent=ReplaceString.replace(doSetContent, HighSource, "<font color='#FA6060'>"+HighSource+"</font>");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		doSetContent=ReplaceString.replace(doSetContent, "/n", "<br/>");
		return doSetContent;
	}
	public static String dowithHighString3(String strSource, String[] strquery){
		String doSetContent=strSource;
		
		for(String word:strquery){
			//System.out.println(word);
			doSetContent=ReplaceString.replace(doSetContent, word.replace(" ", ""), "<font color='#FA6060'>"+word+"</font>");	
			//System.out.println(doSetContent);
		}
		doSetContent=ReplaceString.replace(doSetContent, "/n", "<br/>");
		return doSetContent;
	}



}
