package net.linkednest.common.util;

import java.util.HashMap;

public class PaginateUtil {
    private static int      startPage;
    private static int      endPage;
    private static int      page;
    private static String   link;
    
    public PaginateUtil() {}
    
    public static HashMap<String, String> paginate(String inputLink, String inputPage, int total) {
        return paginate(inputLink, inputPage, "10", 5, total);
    }
    
    public static HashMap<String, String> paginate(String inputLink, String inputPage, String inputPerPage, int listSize, int total) {
        link = String.format("%s?%s=", inputLink, "page");
        page = Integer.parseInt(inputPage);
        int perPage   = Integer.parseInt(inputPerPage);
        int pageCount = total / perPage + (total % perPage == 0 ? 0 : 1);
        int listCut   = (page - 1) * perPage;
        startPage = page - listSize / 2;
        endPage   = startPage + listSize - 1;
        if (startPage <= 0) {
            startPage = 1;
        }
        if (endPage >= pageCount) {
            endPage = pageCount;
        }
        HashMap<String, String> result = new HashMap();
        result.put("showPaginate"         , showPaginate());
        result.put("showPaginateNoLink"   , showPaginateNoLink());
        result.put("listCut"              , String.valueOf(listCut));

        return result;
    }
    
    private static String showPaginate() {
        StringBuffer sb = new StringBuffer();
        sb.append("<div class='paginate'>");
        sb.append(String.format("%s%s%d%s", "<a href='", link, startPage, "' class='first'>맨처음목록</a>"));
        if (page - 1 >= startPage) {
            sb.append(String.format("%s%s%d%s", "<a href='", link, (page - 1), "' class='prev'>이전목록</a>"));
        } else {
            sb.append("<a class='prev'>이전목록</a>");
        }
        for (int i = startPage; i <= endPage; i++) {
            if (i == page) {
                sb.append(String.format("%s%s%d%s%d%s", "<a href='", link, i, "' class='current'>", i, "</a>"));
            } else {
                sb.append(String.format("%s%s%d%s%d%s", "<a href='", link, i, "'>", i, "</a>"));
            }
        }
        if (page + 1 <= endPage) {
            sb.append(String.format("%s%s%d%s", "<a href='", link, (page + 1),"' class='next'>다음목록</a>"));
        } else {
            sb.append("<a class='next'>다음목록</a>");
        }
        sb.append(String.format("%s%s%d%s", "<a href='", link, endPage, "' class='last'>마지막 목록</a>"));
        sb.append("</div>");
        return sb.toString();
    }
    
    private static String showPaginateNoLink() {
        StringBuffer sb = new StringBuffer();
        sb.append("<div class='paginate'>");
        sb.append(String.format("%s%d%s", "<a href='javascript:void(0)' page='", startPage, "' class='first'>맨처음목록</a>"));
        if (page - 1 >= startPage) {
            sb.append(String.format("%s%d%s", "<a href='javascript:void(0)' page='", (page - 1), "' class='prev'>이전목록</a>"));
        } else {
            sb.append("<a class='prev'>이전목록</a>");
        }
        for (int i = startPage; i <= endPage; i++) {
            if (i == page) {
                sb.append(String.format("%s%d%s%d%s", "<a href='javascript:void(0)' page='", i, "' class='current'>", i, "</a>"));
            } else {
                sb.append(String.format("%s%d%s%d%s", "<a href='javascript:void(0)' page='", i, "'>", i, "</a>"));
            }
        }
        if (page + 1 <= endPage) {
            sb.append(String.format("%s%d%s", "<a href='javascript:void(0)' page='", (page + 1), "' class='next'>다음목록</a>"));
        } else {
            sb.append("<a class='next'>다음목록</a>");
        }
        sb.append(String.format("%s%d%s", "<a href='javascript:void(0)' page='", endPage, "' class='last'>마지막 목록</a>"));
        sb.append("</div>");
        return sb.toString();
    }
}
