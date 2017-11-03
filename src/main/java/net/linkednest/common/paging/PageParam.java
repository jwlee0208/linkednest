package net.linkednest.common.paging;

import org.apache.commons.lang3.StringUtils;

import java.lang.reflect.Method;
import java.net.URLEncoder;

/**
 * Created by 9000209 on 2017-11-03.
 */
public class PageParam {
    private Integer page = Integer.valueOf(1);
    private int pageSize = PageHolder.DEFAULT_PAGESIZE;
    private int listSize = PageHolder.DEFAULT_LISTSIZE;

    public PageParam() {
    }

    public Integer getPage() {
        return this.page;
    }

    public void setPage(Integer page) {
        if (page == null) {
            this.page = Integer.valueOf(1);
        } else {
            this.page = page;
        }
    }

    public int getPageSize() {
        return this.pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getListSize() {
        return this.listSize;
    }

    public void setListSize(int listSize) {
        this.listSize = listSize;
    }

    public int getFetchScale() {
        return (this.page.intValue() - 1) * this.listSize;
    }

    public String getQuery() {
        Method[] methods = getClass().getMethods();
        String className = getClass().getName();
        StringBuilder buffer = new StringBuilder();

        boolean start = true;
        for (Method method : methods) {
            String methodName = method.getName();
            if (((StringUtils.contains(method.getDeclaringClass().toString(),
                    className)) || (methodName.equals("getPage")) || (methodName
                    .equals("getListSize")))
                    && (methodName.startsWith("get"))) {
                StringBuilder guessField = new StringBuilder(
                        methodName.length() - 3);
                for (int i = 0; i < methodName.length(); i++) {
                    if (i >= 3) {

                        char ch = methodName.charAt(i);
                        if (i == 3) {
                            guessField.append(Character.toLowerCase(ch));
                        } else {
                            guessField.append(ch);
                        }
                    }
                }
                try {
                    Object o = method.invoke(this, new Object[0]);
                    if ((o != null) && (StringUtils.isNotEmpty(o.toString()))) {
                        if (start) {
                            start = false;
                        } else {
                            buffer.append('&');
                        }

                        buffer.append(guessField)
                                .append('=')
                                .append(URLEncoder.encode(o.toString(), "UTF-8"));
                    }
                } catch (Exception localException) {
                }
            }
        }

        if (buffer.length() > 0) {
            return '?' + buffer.toString();
        }
        return null;
    }

    @Override
    public String toString() {
        return "PageParam [page=" + page + ", pageSize=" + pageSize + ", listSize=" + listSize + "]";
    }
}
