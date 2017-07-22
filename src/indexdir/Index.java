package indexdir;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import indexutil.DocumentUtils;
import indexutil.LuceneUtils;

import net.sf.json.JSONArray;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriter.MaxFieldLength;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.MultiFieldQueryParser;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.PhraseQuery;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Formatter;
import org.apache.lucene.search.highlight.Fragmenter;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.NullFragmenter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.Scorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.search.vectorhighlight.BaseFragmentsBuilder;
import org.apache.lucene.search.vectorhighlight.FastVectorHighlighter;
import org.apache.lucene.search.vectorhighlight.FragListBuilder;
import org.apache.lucene.search.vectorhighlight.FragmentsBuilder;
import org.apache.lucene.search.vectorhighlight.ScoreOrderFragmentsBuilder;
import org.apache.lucene.search.vectorhighlight.SimpleFragListBuilder;
import org.apache.lucene.store.LockObtainFailedException;
import org.apache.lucene.util.Version;
import tools.ReplaceString;
import beans.Article;


public class Index {
	public static long allcount=20000;
	
	public static  String path ;
	public void CreateIndex(String path) throws Exception{
		new LuceneUtils(path);//初始化LuceneUtils	
		
	}
	/**
	 * 单个增加
	 */
	public void addDocIndex(Article article) throws CorruptIndexException, LockObtainFailedException, IOException{
		@SuppressWarnings("deprecation")
		IndexWriter indexWriter = new IndexWriter(LuceneUtils.directory,LuceneUtils.analyzer,MaxFieldLength.LIMITED);	
		indexWriter.addDocument(DocumentUtils.article2Document(article));
		indexWriter.close();		
	} 
	/**
	 * 多个增加
	 */
	public void addDocIndex(List<Article> articlelist) throws CorruptIndexException, LockObtainFailedException, IOException{
		@SuppressWarnings("deprecation")
		IndexWriter indexWriter = new IndexWriter(LuceneUtils.directory,LuceneUtils.analyzer,MaxFieldLength.LIMITED);
		for(Article article : articlelist){
			indexWriter.addDocument(DocumentUtils.article2Document(article));
		}	
		indexWriter.close();		
	} 
	/**
	 * 索引库优化
	 */
	public void indexOptimize(){
		IndexWriter indexWriter;
		try {
			indexWriter = new IndexWriter(LuceneUtils.directory,LuceneUtils.analyzer,MaxFieldLength.LIMITED);
			indexWriter.optimize();
			indexWriter.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	public  String searchOnejuzi(String strquery,int numword) throws Exception{
		
		//计时器
		long start=System.currentTimeMillis();
		IndexSearcher indexSearcher = new IndexSearcher(LuceneUtils.directory);
		QueryParser queryParser = new MultiFieldQueryParser(Version.LUCENE_36, new String[]{"title","content"}, LuceneUtils.analyzer);
		Query query = queryParser.parse(strquery);
		//最多搜索30条数据
		TopDocs topDocs = indexSearcher.search(query,1);
		ScoreDoc[] scoreDocs = topDocs.scoreDocs;
		Formatter formatter = new SimpleHTMLFormatter("","");
		/**
		 * scorer封装了关键字
		 */
		Scorer scorer = new QueryScorer(query);
		Highlighter highlighter = new Highlighter(formatter,scorer);
		/**
		 * 创建一个摘要
		 */
		Fragmenter fragmenter = new SimpleFragmenter(numword/2*3);
		highlighter.setTextFragmenter(fragmenter);
		Article article2=new  Article();
		List<Article> articleList = new ArrayList<Article>();
		for(ScoreDoc scoreDoc:scoreDocs){
			float score = scoreDoc.score;
			Document document =  indexSearcher.doc(scoreDoc.doc);
			Article article = DocumentUtils.document2Article(document);
			String titleText = highlighter.getBestFragment(LuceneUtils.analyzer, "title", document.get("title"));
			String contentText = highlighter.getBestFragment(LuceneUtils.analyzer, "content", document.get("content"));
			if(titleText!=null){
				article.setTitle(titleText);
			}
			if(contentText!=null){
				article.setContent(contentText);
			}
			article2=article;
			break;
		}		
		indexSearcher.close();
		return article2.getContent();
	}	
	//用于精确搜出一片文章
public  String searchIndex(String strquery,String zcid) throws Exception{
		
		//计时器
		long start=System.currentTimeMillis();
		IndexSearcher indexSearcher = new IndexSearcher(LuceneUtils.directory);
		QueryParser queryParser = new MultiFieldQueryParser(Version.LUCENE_36, new String[]{"title","content"}, LuceneUtils.analyzer);
		Query query = queryParser.parse(strquery);
		//最多搜索30条数据
		TopDocs topDocs = indexSearcher.search(query,(int)(allcount>30?30:allcount));
		ScoreDoc[] scoreDocs = topDocs.scoreDocs;

		
		/***********************************************************************/
		/**
		 * 给关键字加上前缀和后缀
		 */
		Formatter formatter = new SimpleHTMLFormatter("<font color='#FA6060'>","</font>");
		/**
		 * scorer封装了关键字
		 */
		Scorer scorer = new QueryScorer(query);
		Highlighter highlighter = new Highlighter(formatter,scorer);
		/**
		 * 创建一个摘要
		 */
		Fragmenter fragmenter = new NullFragmenter();
		highlighter.setTextFragmenter(fragmenter);
		
		List<Article> articleList = new ArrayList<Article>();
		for(ScoreDoc scoreDoc:scoreDocs){
			float score = scoreDoc.score;
			Document document =  indexSearcher.doc(scoreDoc.doc);
			Article article = DocumentUtils.document2Article(document);
			

			String titleText = highlighter.getBestFragment(LuceneUtils.analyzer, "title", document.get("title"));
			String contentText = highlighter.getBestFragment(LuceneUtils.analyzer, "content", document.get("content"));
			if(titleText!=null){
				article.setTitle(titleText);
			}
			if(contentText!=null){
				article.setContent(contentText);
			}
			//System.out.println(article.getId()+"------"+zcid);
			if(article.getId().equals(zcid))articleList.add(article);
		}	
		indexSearcher.close();
		//结束时间
		long end=System.currentTimeMillis();
		JSONArray msg=JSONArray.fromObject(articleList);
		
		String strmsg=msg.toString();
	
		System.out.println("全文检索："+strmsg);
		System.out.println("index.java:检索完成,用时："+(end-start)+"毫秒 ");	
		return strmsg;
	}	
public  String searchIndexInresult(String strquery,String zcwh) throws Exception{
	
	//计时器
	long start=System.currentTimeMillis();
	IndexSearcher indexSearcher = new IndexSearcher(LuceneUtils.directory);
	QueryParser queryParser = new MultiFieldQueryParser(Version.LUCENE_36, new String[]{"title","content"}, LuceneUtils.analyzer);
	Query query = queryParser.parse(strquery);
	//最多搜索30条数据
	TopDocs topDocs = indexSearcher.search(query,(int)(allcount>30?30:allcount));
	ScoreDoc[] scoreDocs = topDocs.scoreDocs;

	
	/***********************************************************************/
	/**
	 * 给关键字加上前缀和后缀
	 */
	Formatter formatter = new SimpleHTMLFormatter("<font color='#FA6060'>","</font>");
	/**
	 * scorer封装了关键字
	 */
	Scorer scorer = new QueryScorer(query);
	Highlighter highlighter = new Highlighter(formatter,scorer);
	/**
	 * 创建一个摘要
	 */
	Fragmenter fragmenter = new SimpleFragmenter(300);
	highlighter.setTextFragmenter(fragmenter);
	String []arrzc=zcwh.split(",");
	List<Article> articleList = new ArrayList<Article>();
	for(ScoreDoc scoreDoc:scoreDocs){
		float score = scoreDoc.score;
		Document document =  indexSearcher.doc(scoreDoc.doc);
		Article article = DocumentUtils.document2Article(document);
		String titleText = highlighter.getBestFragment(LuceneUtils.analyzer, "title", document.get("title"));
		String contentText = highlighter.getBestFragment(LuceneUtils.analyzer, "content", document.get("content"));
		if(titleText!=null){
			article.setTitle(titleText);
		}
		if(contentText!=null){
			article.setContent(contentText);
		}
		for(int i=0;i< arrzc.length;i++){
			if(article.getId().equals(arrzc[i])){
				articleList.add(article);
				break;
			}
		}
	}	
	indexSearcher.close();
	//结束时间
	long end=System.currentTimeMillis();
	JSONArray msg=JSONArray.fromObject(articleList);
	
	String strmsg=msg.toString();
	strmsg="{'querys':"+strmsg+"}";	
	System.out.println("全文检索："+strmsg);
	System.out.println("index.java:检索完成,用时："+(end-start)+"毫秒 ");	
	return strmsg;
}	
	public  String searchIndex(String strquery) throws Exception{
		
		//计时器
		long start=System.currentTimeMillis();
		IndexSearcher indexSearcher = new IndexSearcher(LuceneUtils.directory);
		QueryParser queryParser = new MultiFieldQueryParser(Version.LUCENE_36, new String[]{"title","content"}, LuceneUtils.analyzer);
		Query query = queryParser.parse(strquery);
		//最多搜索30条数据
		TopDocs topDocs = indexSearcher.search(query,(int)(allcount>30?30:allcount));
		ScoreDoc[] scoreDocs = topDocs.scoreDocs;

		
		/***********************************************************************/
		/**
		 * 给关键字加上前缀和后缀
		 */
		Formatter formatter = new SimpleHTMLFormatter("<font color='#FA6060'>","</font>");
		/**
		 * scorer封装了关键字
		 */
		Scorer scorer = new QueryScorer(query);
		Highlighter highlighter = new Highlighter(formatter,scorer);
		/**
		 * 创建一个摘要
		 */
		Fragmenter fragmenter = new SimpleFragmenter(400);
		highlighter.setTextFragmenter(fragmenter);
		
		List<Article> articleList = new ArrayList<Article>();
		for(ScoreDoc scoreDoc:scoreDocs){
			float score = scoreDoc.score;
			Document document =  indexSearcher.doc(scoreDoc.doc);
			Article article = DocumentUtils.document2Article(document);
			

			String titleText = highlighter.getBestFragment(LuceneUtils.analyzer, "title", document.get("title"));
			String contentText = highlighter.getBestFragment(LuceneUtils.analyzer, "content", document.get("content"));
			if(titleText!=null){
				article.setTitle(titleText);
			}
			if(contentText!=null){
				article.setContent(contentText);
			}
		
			articleList.add(article);
		}	
		indexSearcher.close();
		//结束时间
		long end=System.currentTimeMillis();
		JSONArray msg=JSONArray.fromObject(articleList);
		
		String strmsg=msg.toString();
		strmsg="{'querys':"+strmsg+"}";	
		System.out.println("全文检索："+strmsg);
		System.out.println("index.java:检索完成,用时："+(end-start)+"毫秒 ");	
		return strmsg;
	}	
	/*
	 * 查重复的文档
	 * 13字原则，如果有13字重复则说明有抄袭的嫌疑
	 */
public  String searchRepeatIndex(String strquery) throws Exception{
		//记录重复数
		int repeatNum=0;
		//计时器
		long start=System.currentTimeMillis();
		IndexSearcher indexSearcher = new IndexSearcher(LuceneUtils.directory);
		QueryParser queryParser = new MultiFieldQueryParser(Version.LUCENE_36, new String[]{"title","content"}, LuceneUtils.analyzer);
		Query query = queryParser.parse(strquery);
		TopDocs topDocs = indexSearcher.search(query,1);
		ScoreDoc[] scoreDocs = topDocs.scoreDocs;
		Formatter formatter = new SimpleHTMLFormatter("<font color='#FA6060'>","</font>");
		Scorer scorer = new QueryScorer(query);
		Highlighter highlighter = new Highlighter(formatter,scorer);
		Fragmenter fragmenter = new SimpleFragmenter(13);
		highlighter.setTextFragmenter(fragmenter);
		String result13="";		
		for(ScoreDoc scoreDoc:scoreDocs){
			float score = scoreDoc.score;
			System.out.println("分数："+score);
			Document document =  indexSearcher.doc(scoreDoc.doc);			
			String titleText = highlighter.getBestFragment(LuceneUtils.analyzer, "title", document.get("title"));
			String contentText = highlighter.getBestFragment(LuceneUtils.analyzer, "content", document.get("content"));
			System.out.println(contentText);			
			repeatNum=countWord(contentText);	
			result13=document.get("content").replace(" ", "").replace("/n", "");
			if(contentText!=null){
				
				result13=ReplaceString.replace(contentText, "<font color='#FA6060'>", "");
				result13=ReplaceString.replace(result13, "</font>", "");
			}
		}	
		indexSearcher.close();
		//结束时间
		long end=System.currentTimeMillis();
		//float repeat=1.0f*repeatNum/strquery.replace("，", "").replace(" ","").length();
		String strmsg="";
		System.out.println(repeatNum+" /  "+strquery.replace("，", "").replace(" ","").length());
		boolean isRepeat13=false;//默认没有抄袭
		
		if(repeatNum>=13&&strquery.indexOf(result13)>=0){
			System.out.println("您有可能涉及抄袭 ");	
			isRepeat13=true;
			//strquery=ReplaceString.replace(strquery, result13,"<font color=#FA6060 style=font-style:italic;border-bottom-style:double;>"+ result13+"</font>");
		}
		
		strmsg="{result:[{'result13':'"+result13+"','isRepeat13':"+isRepeat13+"}]}";	
		System.out.println(strmsg+"\n index.java:检索完成,用时："+(end-start)+"毫秒 ");	
		return strmsg;
	}
public  String searchSimilarRepeatIndex(String strquery) throws Exception{
	//记录重复数
	int repeatNum=0;
	//计时器
	long start=System.currentTimeMillis();
	IndexSearcher indexSearcher = new IndexSearcher(LuceneUtils.directory);
	QueryParser queryParser = new MultiFieldQueryParser(Version.LUCENE_36, new String[]{"title","content"}, LuceneUtils.analyzer);
	Query query = queryParser.parse(strquery);
	//System.out.println("      3"+strquery);
	TopDocs topDocs = indexSearcher.search(query,1);
	ScoreDoc[] scoreDocs = topDocs.scoreDocs;
	Formatter formatter = new SimpleHTMLFormatter("<font color='#FA6060'>","</font>");
	Scorer scorer = new QueryScorer(query);
	Highlighter highlighter = new Highlighter(formatter,scorer);
	int seach_num=13;
	
	if(strquery.length()<260){
		seach_num=20;
	}
	else {
		int a=(int) ((int)strquery.length()*0.05);
		seach_num=a+a/3;
	}
	System.out.println("查询个数："+seach_num+"   "+strquery.length());
	Fragmenter fragmenter = new SimpleFragmenter(seach_num);
	highlighter.setTextFragmenter(fragmenter);
	String result13="";		
	String contentText="";
	String titleText="";
	String ariticleType="";
	String ariticleDate="";
	String strmsg="";
	try{
		for(ScoreDoc scoreDoc:scoreDocs){
			float score = scoreDoc.score;
			System.out.println("相似度的分数："+score);
			Document document =  indexSearcher.doc(scoreDoc.doc);	
			titleText=document.get("title").replace(" ", "").replace("\n", "");
			ariticleDate=document.get("date").replace(" ", "").replace("\n", "");
			ariticleType=document.get("type").replace(" ", "").replace("\n", "");
			String addstr=document.get("content").replace(" ", "").replace("\n", "").replace("/", "");	
			//System.out.println("--------"+addstr);	
			//String titleText = highlighter.getBestFragment(LuceneUtils.analyzer, "title", document.get("title"));
			contentText = highlighter.getBestFragment(LuceneUtils.analyzer, "content", addstr);
			highlighter=null;
			//System.out.println("--------"+contentText);			
			repeatNum=countWord(contentText);	
			result13=document.get("content").replace(" ", "").replace("\n", "");
			if(contentText!=null){
				
				result13=ReplaceString.replace(contentText, "<font color='#FA6060'>", "");
				result13=ReplaceString.replace(result13, "</font>", "");
				result13=result13.replace(" ", "").replace("\n", "");
			}
		}	
		indexSearcher.close();
		//结束时间
		
		//float repeat=1.0f*repeatNum/strquery.replace("，", "").replace(" ","").length();
	
		System.out.println(repeatNum+" /  "+strquery.replace("，", "").replace(" ","").length());
		boolean isRepeat13=false;//默认没有抄袭
		/*
		 * 260字以内 查询20字，相似度不能大于13字
		 * 其他查5%+其的1/3  相似度不能大于其%5
		 */
		int maxsimilarnum=(int) (strquery.length()*0.05);
		String newStr=strquery;
		if(strquery.length()<260&&repeatNum>=13){
			isRepeat13=true;
			newStr=strAddStyle(strquery,contentText);
			System.out.println("涉嫌抄袭，段落字数："+strquery.length()+" 查找数："+seach_num+"允许最大重复数："+13+" 重复字数："+repeatNum);	
		}else if(strquery.length()>=260&&repeatNum>=maxsimilarnum){
			isRepeat13=true;
			newStr=strAddStyle(strquery,contentText);
			System.out.println("涉嫌抄袭，段落字数："+strquery.length()+" 查找数："+seach_num+"允许最大重复数："+maxsimilarnum+" 重复字数："+repeatNum);	

		}else{
			System.out.println("没有抄袭，段落字数："+strquery.length()+" 查找数："+seach_num+" 重复字数："+repeatNum);	
			
				
		}
		
		//strmsg="{result:[{'result13':'"+result13+"','isRepeat13':"+isRepeat13+",'newStr':'"+newStr+"'}]}";String titleText
		strmsg="{'result13':'"+result13+"','isRepeat13':"+isRepeat13+",'title':'"+titleText+"','type':'"+ariticleType+"','date':'"+ariticleDate+"','newStr':'"+newStr+"'}";	

	}
	catch(Exception e){
		strmsg="{'result13':'无','isRepeat13':false,'title':'无','type':'无','date':'无','newStr':'无'}";	

	}
	long end=System.currentTimeMillis();
	System.out.println("\n返回结果："+strmsg+"\n\n index.java:检索完成,用时："+(end-start)+"毫秒 ");	
	return strmsg;        
}

public int countWord(String str){
	int count=0;
	if(str!=null){
		while(str.indexOf("<font color='#FA6060'>")>=0){
			int start=str.indexOf("<font color='#FA6060'>")+"<font color='#FA6060'>".length();
			int end=str.indexOf("</font>");
			if(str.substring(start-5, end+3).indexOf("百分")>0)count-=2;
			str=str.substring(end+"</font>".length());
			
			if((end-start)>1)
			count+=(end-start);
			//System.out.println(start+"  "+end+"   "+(end-start)+"   "+str);
		}
	}
	
	//System.out.println("相似字数为："+count);
	return count;
}
/*
 * 给文章相似处画线，加样式
 * 
 */
public String strAddStyle(String strquery,String str){
	String newStr=strquery;
	String keystr="";
	if(str!=null){
		while(str.indexOf("<font color='#FA6060'>")>=0){
			int start=str.indexOf("<font color='#FA6060'>")+"<font color='#FA6060'>".length();
			int end=str.indexOf("</font>");
			keystr+=str.substring(start,end)+",";
			str=str.substring(end+"</font>".length());		
		}
	}
	System.out.println(keystr);
	String[]keys=keystr.split(",");	
	//*******关键字的个数必须大于3个
	String []phrase=strquery.split("。");
	int count=0;//统计关键词在本句出现的次数
	int n=(int) (keys.length*0.6+1);//只要大于关键字个数的0.6时就高亮显示本句
	for(String a : phrase){
		count=0;
		for(String b: keys){
			if(a.indexOf(b)>=0)count++;
		}
		if(count>n)newStr=ReplaceString.replace(newStr, a, "<font color=#FA6060 style=border-bottom-style:double;>"+ a+"</font>");
	}
	System.out.println("new:"+newStr);
	return newStr;
}

public  String searchPhraseIndex(String[] phrase,int slop,String isSort,String zcwh) throws Exception{
	
	IndexSearcher indexSearcher = new IndexSearcher(LuceneUtils.directory);
	PhraseQuery query1=new PhraseQuery();
	PhraseQuery query2=new PhraseQuery();
	query1.setSlop(slop);
	query2.setSlop(slop);
	String allword="";
	for(String word:phrase){
		query1.add(new Term("title",word.replace(" ", "")));
		//System.out.println(word);
		allword+=word+" ";
	}
	for(String word:phrase){
		query2.add(new Term("content",word.replace(" ", "")));
	}
	QueryParser queryParser = new MultiFieldQueryParser(Version.LUCENE_36, new String[]{"title","content","classtify"}, LuceneUtils.analyzer);
	//Query query3 = queryParser.parse(allword);
	
	BooleanQuery querys=new BooleanQuery();
	querys.add(query1,BooleanClause.Occur.SHOULD);
	querys.add(query2,BooleanClause.Occur.SHOULD);
	//querys.add(query3,BooleanClause.Occur.SHOULD);
	//最多搜索30条数据
	TopDocs topDocs = indexSearcher.search(querys,(int)(allcount>40?40:allcount));
	ScoreDoc[] scoreDocs = topDocs.scoreDocs;

	// 
	Formatter formatter = new SimpleHTMLFormatter("","");
	/**
	 * scorer封装了关键字
	 */
	Scorer scorer = new QueryScorer(querys);
	Highlighter highlighter = new Highlighter(formatter,scorer);
	/**
	 * 创建一个摘要
	 */
	Fragmenter fragmenter = new NullFragmenter();
	highlighter.setTextFragmenter(fragmenter);
	List<Article> articleList = new ArrayList<Article>();
	String []arrzc=zcwh.split(",");
	for(ScoreDoc scoreDoc:scoreDocs){
		float score = scoreDoc.score;
		Document document =  indexSearcher.doc(scoreDoc.doc);
		Article article = DocumentUtils.document2Article(document);
		if(isSort.equals("true")){
			//获取关键字的位置，并且判断是否是按关键字顺序，不符合顺序则被淘汰
			boolean issort=true;
			for(int i=0;i<phrase.length-1;i++){
				int frist=article.getContent().indexOf(phrase[i].replace(" ", ""));
				int sencond=article.getContent().indexOf(phrase[i+1].replace(" ", ""));
				System.out.println(sencond+"  "+frist);
				if((sencond-frist)>slop||(sencond-frist)<0){
					issort=false;
					break;
				}
			}
			if(issort==false)continue;
			
		}
		
		String doSetContent=article.getContent().substring(0, article.getContent().length()>300?300:article.getContent().length());
		//doSetContent=ReplaceString.dowithHighString3(doSetContent,phrase);								
		article.setContent(doSetContent);
		//System.out.println(article.getContent());
		
		String doSetTitle=article.getTitle();
		doSetTitle=ReplaceString.dowithHighString3(doSetTitle,phrase);					
		article.setTitle(doSetTitle);
		
		for(int i=0;i< arrzc.length;i++){
			if(article.getId().equals(arrzc[i])){
				articleList.add(article);
				break;
			}
		}
	}	
	
	indexSearcher.close();
	//结束时间
	long end=System.currentTimeMillis();
	JSONArray msg=JSONArray.fromObject(articleList);
	
	String strmsg=msg.toString();
	strmsg="{'querys':"+strmsg+"}";	
	System.out.println(strmsg);	
	return strmsg;
}		
//短语查询
public  String searchPhraseIndex(String[] phrase,int slop,String isSort) throws Exception{
		
		IndexSearcher indexSearcher = new IndexSearcher(LuceneUtils.directory);
		PhraseQuery query1=new PhraseQuery();
		PhraseQuery query2=new PhraseQuery();
		query1.setSlop(slop);
		query2.setSlop(slop);
		String allword="";
		for(String word:phrase){
			query1.add(new Term("title",word.replace(" ", "")));
			//System.out.println(word);
			allword+=word+" ";
		}
		for(String word:phrase){
			query2.add(new Term("content",word.replace(" ", "")));
		}
		QueryParser queryParser = new MultiFieldQueryParser(Version.LUCENE_36, new String[]{"title","content","classtify"}, LuceneUtils.analyzer);
		//Query query3 = queryParser.parse(allword);
		
		BooleanQuery querys=new BooleanQuery();
		querys.add(query1,BooleanClause.Occur.SHOULD);
		querys.add(query2,BooleanClause.Occur.SHOULD);
		//querys.add(query3,BooleanClause.Occur.SHOULD);
		//最多搜索30条数据
		TopDocs topDocs = indexSearcher.search(querys,(int)(allcount>40?40:allcount));
		ScoreDoc[] scoreDocs = topDocs.scoreDocs;
	
		// 
		Formatter formatter = new SimpleHTMLFormatter("","");
		/**
		 * scorer封装了关键字
		 */
		Scorer scorer = new QueryScorer(querys);
		Highlighter highlighter = new Highlighter(formatter,scorer);
		/**
		 * 创建一个摘要
		 */
		Fragmenter fragmenter = new NullFragmenter();
		highlighter.setTextFragmenter(fragmenter);
		List<Article> articleList = new ArrayList<Article>();
		for(ScoreDoc scoreDoc:scoreDocs){
			float score = scoreDoc.score;
			Document document =  indexSearcher.doc(scoreDoc.doc);
			Article article = DocumentUtils.document2Article(document);
			if(isSort.equals("true")){
				//获取关键字的位置，并且判断是否是按关键字顺序，不符合顺序则被淘汰
				boolean issort=true;
				for(int i=0;i<phrase.length-1;i++){
					int frist=article.getContent().indexOf(phrase[i].replace(" ", ""));
					int sencond=article.getContent().indexOf(phrase[i+1].replace(" ", ""));
					System.out.println(sencond+"  "+frist);
					if((sencond-frist)>slop||(sencond-frist)<0){
						issort=false;
						break;
					}
				}
				if(issort==false)continue;
				
			}
			
			String doSetContent=article.getContent().substring(0, article.getContent().length()>300?300:article.getContent().length());
			//doSetContent=ReplaceString.dowithHighString3(doSetContent,phrase);								
			article.setContent(doSetContent);
			//System.out.println(article.getContent());
			
			String doSetTitle=article.getTitle();
			doSetTitle=ReplaceString.dowithHighString3(doSetTitle,phrase);					
			article.setTitle(doSetTitle);
			articleList.add(article);
		}	
		
		indexSearcher.close();
		//结束时间
		long end=System.currentTimeMillis();
		JSONArray msg=JSONArray.fromObject(articleList);
		
		String strmsg=msg.toString();
		strmsg="{'querys':"+strmsg+"}";	
		System.out.println(strmsg);	
		return strmsg;
	}		

//短语精确查询，只查出一个
public  String searchPhraseIndex(String[] phrase,String zcwh) throws Exception{
		
		IndexSearcher indexSearcher = new IndexSearcher(LuceneUtils.directory);
		PhraseQuery query1=new PhraseQuery();
		PhraseQuery query2=new PhraseQuery();
		String allword="";
		for(String word:phrase){
			query1.add(new Term("title",word.replace(" ", "")));
			//System.out.println(word);
			allword+=word+" ";
		}
		for(String word:phrase){
			query2.add(new Term("content",word.replace(" ", "")));
		}
		QueryParser queryParser = new MultiFieldQueryParser(Version.LUCENE_36, new String[]{"title","content","classtify"}, LuceneUtils.analyzer);
		Query query3 = queryParser.parse(allword);
		
		BooleanQuery querys=new BooleanQuery();
		querys.add(query1,BooleanClause.Occur.SHOULD);
		querys.add(query2,BooleanClause.Occur.SHOULD);
		querys.add(query3,BooleanClause.Occur.SHOULD);
		//最多搜索30条数据
		TopDocs topDocs = indexSearcher.search(querys,(int)(allcount>40?40:allcount));
		ScoreDoc[] scoreDocs = topDocs.scoreDocs;
	
		// 
		Formatter formatter = new SimpleHTMLFormatter("","");
		/**
		 * scorer封装了关键字
		 */
		Scorer scorer = new QueryScorer(querys);
		Highlighter highlighter = new Highlighter(formatter,scorer);
		/**
		 * 创建一个摘要
		 */
		Fragmenter fragmenter = new NullFragmenter();
		highlighter.setTextFragmenter(fragmenter);
		List<Article> articleList = new ArrayList<Article>();
		for(ScoreDoc scoreDoc:scoreDocs){
			float score = scoreDoc.score;
			Document document =  indexSearcher.doc(scoreDoc.doc);
			Article article = DocumentUtils.document2Article(document);
			String doSetContent=article.getContent();
			//doSetContent=ReplaceString.dowithHighString3(doSetContent,phrase);								
			article.setContent(doSetContent);
			//System.out.println(article.getContent());
			
			String doSetTitle=article.getTitle();
			doSetTitle=ReplaceString.dowithHighString3(doSetTitle,phrase);					
			article.setTitle(doSetTitle);
			if(article.getId().equals(zcwh))
			articleList.add(article);
		}	
		
		indexSearcher.close();
		//结束时间
		long end=System.currentTimeMillis();
		JSONArray msg=JSONArray.fromObject(articleList);
		
		String strmsg=msg.toString();
		System.out.println(strmsg);	
		return strmsg;
	}		
	//高亮器
	static FastVectorHighlighter getHighlighter(){
		FragListBuilder fragListBuilder = new SimpleFragListBuilder();
		FragmentsBuilder fragmentsBulider=new ScoreOrderFragmentsBuilder(
				BaseFragmentsBuilder.COLORED_PRE_TAGS,
				BaseFragmentsBuilder.COLORED_POST_TAGS);
		return new FastVectorHighlighter(true,true,fragListBuilder,fragmentsBulider);
	}

}
