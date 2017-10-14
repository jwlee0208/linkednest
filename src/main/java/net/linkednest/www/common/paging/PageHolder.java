package net.linkednest.www.common.paging;

public class PageHolder {

    public static int DEFAULT_LISTSIZE = 10;
    public static int DEFAULT_PAGESIZE = 3;
    private int listSize = DEFAULT_LISTSIZE;
    private int pageSize = DEFAULT_PAGESIZE;
    private final long totalRows;
    private final int currentPage;

    public PageHolder(long totalRows, int currentPage) {
        this.totalRows = totalRows;
        this.currentPage = currentPage;
    }

    public PageHolder(long totalRows, int currentPage, int listSize) {
        this.totalRows = totalRows;
        this.currentPage = currentPage;
        this.listSize = listSize;
    }

    public PageHolder(long totalRows, int currentPage, int listSize,
            int pageSize) {
        this.totalRows = totalRows;
        this.currentPage = currentPage;
        this.listSize = listSize;
        this.pageSize = pageSize;
    }

    public int getStartNumber() {
        return (this.currentPage - 1) * this.listSize + 1;
    }

    public int getLastIndexNumber() {
        return (int) (this.totalRows - (getStartNumber() - 1));
    }

    public int getCurrentPage() {
        return this.currentPage;
    }

    public int getLineSize() {
        return this.listSize;
    }

    public int getPageSize() {
        return this.pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public long getTotalPages() {
        if ((this.totalRows > 0L) && (this.currentPage > 0)) {
            long totalPages = this.totalRows / this.listSize;
            if (this.totalRows % this.listSize > 0L)
                totalPages += 1L;
            return totalPages;
        }
        return 0L;
    }

    public long getTotalRows() {
        return this.totalRows;
    }

}
