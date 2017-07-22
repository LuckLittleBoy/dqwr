package indexutil;

import java.io.File;
import java.io.IOException;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.wltea.analyzer.lucene.IKAnalyzer;

public class LuceneUtils {
	public static Directory directory;
	public static Analyzer analyzer;
	public static String path;
	public LuceneUtils(String path){
		this.path=path;
		try {
			directory = FSDirectory.open(new File(this.path));
		} catch (IOException e) {
			e.printStackTrace();
		}
		analyzer = new IKAnalyzer();
	}		
}
