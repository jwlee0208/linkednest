package net.linkednest.common.util;

public class PagingUtil {
	/**
	 * *
	 * 
	 * <pre>
	 * 1. MethodName     : getTotalPageCnt       
	 * 2. ClassName      : PagingUtil            
	 * 3. Comment                   : 총 페이지 갯수를 구함.            
	 * 4. 작성자                    : leejinwon             
	 * 5. 작성일                    : 2014. 3. 18. 오전 10:39:49
	 * </pre>
	 * 
	 * @param rowCnt
	 * @param pageSize
	 * @return
	 * @return int
	 */
	public static int getTotalPageCnt(long totalListSize, int listRowCnt) {
		int pageCnt = (int) (totalListSize / listRowCnt);
		int rest = (int) (totalListSize % listRowCnt);

		if (rest > 0) {
			pageCnt++;
		}

		return pageCnt;
	}

	/**
	 * *
	 * 
	 * <pre>
	 * 1. MethodName     : getStartRow           
	 * 2. ClassName      : PagingUtil            
	 * 3. Comment                   : 리스트 첫번째 row number 조회     
	 * 4. 작성자                    : leejinwon             
	 * 5. 작성일                    : 2014. 3. 18. 오전 10:41:12
	 * </pre>
	 * 
	 * @param pageNo
	 * @param listRowCnt
	 * @return
	 * @return int
	 */
	public static int getStartRow(int pageNo, int listRowCnt) {
		return (pageNo - 1) * listRowCnt;
	}

	/**
	 * *
	 * 
	 * <pre>
	 * 1. MethodName     : getEndRow             
	 * 2. ClassName      : PagingUtil          
	 * 3. Comment                   : 리스트 마지막 row number 조회     
	 * 4. 작성자                    : leejinwon             
	 * 5. 작성일                    : 2014. 3. 18. 오전 10:43:00
	 * </pre>
	 * 
	 * @param firstRow
	 * @param listRowCnt
	 * @return
	 * @return int
	 */
	public static int getEndRow(int startRow, int listRowCnt) {
		return listRowCnt;
	}
}
