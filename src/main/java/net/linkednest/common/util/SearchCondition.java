package net.linkednest.common.util;

public class SearchCondition {
	// 검색 조건 파라미터
	private String 	searchCondition;
	private String 	searchText;
	private String 	startDate;
	private String 	endDate;
	private int 	boardId;
	private String  createUserId;

	// 페이징을 위한 파라미터
	private int startRow;
	private int endRow;

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public String getStartDate() {
		return (startDate != null && startDate != "") ? startDate + " 00:00:00"
				: startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return (endDate != null && endDate != "") ? endDate + " 23:59:59"
				: endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

    public String getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(String createUserId) {
        this.createUserId = createUserId;
    }

    @Override
    public String toString() {
        return "SearchCondition [searchCondition=" + searchCondition
                + ", searchText=" + searchText + ", startDate=" + startDate
                + ", endDate=" + endDate + ", boardId=" + boardId
                + ", createUserId=" + createUserId + ", startRow=" + startRow
                + ", endRow=" + endRow + "]";
    }

}
