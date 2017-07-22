package beans;

public class Page {
	private int alldata=0;//数据总数
	private int currentPage = 1;  //当前页
	private int pages;  //总页数
	private int recorderPage =10; //每页记录数
	public void initpage() {//初始化分页
		if(alldata%recorderPage==0)pages=alldata/recorderPage;
		else pages=alldata/recorderPage+1;
		if(pages==0)pages=1;
	}
	public int getAlldata() {
		return alldata;
	}
	public void setAlldata(int alldata) {
		this.alldata = alldata;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	public int getRecorderPage() {
		return recorderPage;
	}
	public void setRecorderPage(int recorderPage) {
		this.recorderPage = recorderPage;
	}

}
