package bbs;

public class PaginationBeans {	
	private static PaginationBeans single = null;

	private int totalArticle;				//총 게시물
	private int currPage;					//현재 페이지
	private int startPage;					//리스트 시작 번호
	private int endPage;					//리스트 종료 번호
	public final int articleLimit = 10;	//한 페이지 당 게시물 제한
	public final int pageLimit = 10;		//한 리스트 당 페이지 수 제한

	private PaginationBeans() {
		
	}
	
	public static PaginationBeans getInstance() {
		if (single == null) {
			single = new PaginationBeans();
		}
		return single;
	}

	public int getCur_page() {
		return currPage;
	}

	public void setCur_page(int currPage) {
		this.currPage = currPage;
	}

	public int getTotalArticle() {
		return totalArticle;
	}

	public void setTotalArticle(int totalArticle) {
		this.totalArticle = totalArticle;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

}
