package indexutil;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.Index;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.util.NumericUtils;

import beans.Article;

public class DocumentUtils {
	public static Document article2Document(Article article){
		Document document = new Document();
		Field idField = new Field("id",article.getId(),Store.YES,Index.NOT_ANALYZED);
		Field titleField = new Field("title",article.getTitle(),Store.YES,Index.ANALYZED);
		Field contentField = new Field("content",article.getContent(),Store.YES,Index.ANALYZED);
		Field dateField = new Field("date",article.getDate(),Store.YES,Index.NOT_ANALYZED);
		Field typetField = new Field("type",article.getClasstify(),Store.YES,Index.NOT_ANALYZED);
		document.add(idField);
		document.add(titleField);
		document.add(dateField);
		document.add(typetField);
		document.add(contentField);
		return document;
	}
	
	public static Article document2Article(Document document){
		Article article = new Article();
		article.setId(document.get("id"));
		article.setTitle(document.get("title").replace(" ", "").replace("/n", ""));
		article.setDate(document.get("date").replace(" ", "").replace("/n", ""));
		article.setClasstify(document.get("type").replace(" ", "").replace("/n", ""));
		article.setContent(document.get("content").replace(" ", "").replace("/n", ""));
		return article;
	}
}
