package beans;

public class Article {
	private String id;
	private String title;
	private String date;
	private String classtify;
	private String content;
	private String keys;
	
	/**
	 * @return the keys
	 */
	public String getKeys() {
		return keys;
	}

	/**
	 * @param keys the keys to set
	 */
	public void setKeys(String keys) {
		this.keys = keys;
	}


	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}

	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}

	/**
	 * @return the classtify
	 */
	public String getClasstify() {
		return classtify;
	}
	/**
	 * @param classtify the classtify to set
	 */
	public void setClasstify(String classtify) {
		this.classtify = classtify;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
