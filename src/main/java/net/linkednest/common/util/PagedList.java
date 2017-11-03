package net.linkednest.common.util;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class PagedList implements Serializable {
	private List<?> list; // 리스트 목록
	private int pageNo; // 페이지 번호
	private int pageSize; // 페이지 사이즈
	private int totalListCnt; // 목록 총계
	private int startRow; // 시작 열
	private int endRow; // 종료 열
	private int listRowCnt; // 출력 목록 갯수

	public PagedList(List<?> list, int pageNo, int pageSize,
			int totaListCnt, int startRow, int endRow, int listRowCnt) {
		this.list = list;
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.totalListCnt = totaListCnt;
		this.startRow = startRow;
		this.endRow = endRow;
		this.listRowCnt = listRowCnt;
	}

	public List<?> getList() {
        return list;
    }

	public void setList(List<?> list) {
        this.list = list;
    }

    public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalListCnt() {
		return totalListCnt;
	}

	public void setTotalListCnt(int totalListCnt) {
		this.totalListCnt = totalListCnt;
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

	public int getListRowCnt() {
		return listRowCnt;
	}

	public void setListRowCnt(int listRowCnt) {
		this.listRowCnt = listRowCnt;
	}

	public int getTotalPageCnt() {
		return PagingUtil.getTotalPageCnt(this.totalListCnt, this.listRowCnt);
	}

	public int getStartPageNo() {
		int divide = (this.pageNo - 1) / (this.pageSize);
		int result = (divide * this.pageSize) + 1;
		return result;
	}

	public int getEndPageNo() {
		int result = 0;
		int totalPageCnt = getTotalPageCnt();
		int startPageNo = getStartPageNo();
		int minus = totalPageCnt - startPageNo;
		int divide = (this.pageNo - 1) / pageSize;
		if (minus < this.pageSize)
			result = totalPageCnt;
		else
			result = (divide + 1) * this.pageSize;
		return result;
	}

    @Override
    public String toString() {
        return "PagedList [list=" + list + ", pageNo=" + pageNo + ", pageSize="
                + pageSize + ", totalListCnt=" + totalListCnt + ", startRow="
                + startRow + ", endRow=" + endRow + ", listRowCnt="
                + listRowCnt + "]";
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + endRow;
        result = prime * result + ((list == null) ? 0 : list.hashCode());
        result = prime * result + listRowCnt;
        result = prime * result + pageNo;
        result = prime * result + pageSize;
        result = prime * result + startRow;
        result = prime * result + totalListCnt;
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        PagedList other = (PagedList) obj;
        if (endRow != other.endRow)
            return false;
        if (list == null) {
            if (other.list != null)
                return false;
        } else if (!list.equals(other.list))
            return false;
        if (listRowCnt != other.listRowCnt)
            return false;
        if (pageNo != other.pageNo)
            return false;
        if (pageSize != other.pageSize)
            return false;
        if (startRow != other.startRow)
            return false;
        if (totalListCnt != other.totalListCnt)
            return false;
        return true;
    }

}
