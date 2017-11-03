package net.linkednest.common.paging;

import java.io.ByteArrayOutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.lang3.StringUtils;
/**
 * Created by 9000209 on 2017-11-03.
 */
public class PaginationSubmitTag extends TagSupport {
    //    private static final long serialVersionUID = 1L;
//    private String name;
//    private PageHolder pageHolder;
//    private String pageParam = "page";
//    private int page = 1;
//    private String template = "paginationSubmit";
//    private String scriptName;
//    private String separator = "?";
//    private String parameters;
//
//    public PaginationSubmitTag() {
//    }
//
//    public int doStartTag() throws JspTagException {
//        return 0;
//    }
//
//    public int doEndTag() throws JspTagException {
//        try {
//            this.pageHolder = ((PageHolder) lookup(this.pageContext, this.name,
//                    "request"));
//            if (this.pageHolder == null) {
//                return 0;
//            }
//            Map<String, Object> pageInfo = new HashMap<String, Object>();
//
//            pageInfo.put("totalPage",
//                    Long.valueOf(this.pageHolder.getTotalPages()));
//            pageInfo.put("totalCount",
//                    Long.valueOf(this.pageHolder.getTotalRows()));
//
//            this.page = this.pageHolder.getCurrentPage();
//            pageInfo.put("currentPage", Integer.valueOf(this.page));
//
//            pageInfo.put("separator", this.separator);
//            pageInfo.put("scriptName", this.scriptName);
//            pageInfo.put("pageParam", this.pageParam);
//
//            int startPage = ((int) Math.ceil(this.page
//                    / this.pageHolder.getPageSize()) - 1)
//                    * this.pageHolder.getPageSize() + 1;
//            pageInfo.put("startPage", Integer.valueOf(startPage));
//
//            String paramString = makeParamString(this.pageContext.getRequest());
//            pageInfo.put("paramString", paramString);
//
//            List<Integer> pages = new ArrayList(this.pageHolder.getPageSize());
//
//            int i = 0;
//            for (i = startPage; i < startPage + this.pageHolder.getPageSize(); i++) {
//                if (i > this.pageHolder.getTotalPages()) {
//                    break;
//                }
//                pages.add(new Integer(i));
//            }
//            pageInfo.put("pages", pages);
//            pageInfo.put("nextScalePage", Integer.valueOf(i));
//            pageInfo.put("previousScalePage",
//                    Integer.valueOf(startPage - this.pageHolder.getPageSize()));
//            this.pageContext.getRequest().setAttribute("pageInfo", pageInfo);
//            ImportResponseWrapper wrapper = new ImportResponseWrapper(
//                    (HttpServletResponse) this.pageContext.getResponse());
//            this.pageContext
//                    .getRequest()
//                    .getRequestDispatcher(
//                            "/WEB-INF/pagingTemplate/" + this.template + ".jsp")
//                    .include(this.pageContext.getRequest(), wrapper);
//            this.pageContext.getOut().print(wrapper.getString());
//        } catch (Exception e) {
//            throw new JspTagException(e);
//        }
//        return 6;
//    }
//
//    protected Object lookup(PageContext pageContext, String name, String scope)
//            throws JspTagException {
//        Object bean = null;
//        if (scope == null) {
//            bean = pageContext.findAttribute(name);
//        } else if (scope.equalsIgnoreCase("page")) {
//            bean = pageContext.getAttribute(name, 1);
//        } else if (scope.equalsIgnoreCase("request")) {
//            bean = pageContext.getAttribute(name, 2);
//        } else if (scope.equalsIgnoreCase("session")) {
//            bean = pageContext.getAttribute(name, 3);
//        } else if (scope.equalsIgnoreCase("application")) {
//            bean = pageContext.getAttribute(name, 4);
//        } else {
//            JspTagException e = new JspTagException("Invalid scope " + scope);
//            throw e;
//        }
//        return bean;
//    }
//
//    private String makeParamString(ServletRequest request){
//    StringBuilder queryString = new StringBuilder();
//    StringBuffer erString = new StringBuffer();
//
//    Enumeration er = request.getParameterNames();
//    while (er.hasMoreElements())
//    {
//      String temp = er.nextElement().toString();
//      if (erString.length() != 0) {
//        erString.append(",");
//      }
//      erString.append(temp);
//    }
//    if (StringUtils.isEmpty(erString.toString())) {
//      return "";
//    }
//    this.parameters = erString.toString();
//
//
//    StringTokenizer tokenizer = new StringTokenizer(this.parameters, ",");
//    String[] value;
//
////    for (; tokenizer.hasMoreTokens(); (value != null) && (i < value.length))
//    while(tokenizer.hasMoreTokens()){
//      String parameterName = StringUtils.trim(tokenizer.nextToken());
//      value = request.getParameterValues(parameterName);
//
//      for (int i = 0; value != null && i < value.length; i++) {
//          if (parameterName.equals(this.pageParam)) {
//              continue;
//          }
//          if (value[i] != null) {
//              try {
//                  queryString.append("&" + parameterName + "=" + URLEncoder.encode(value[i], "UTF-8"));
//              } catch (UnsupportedEncodingException e) {
//                  queryString.append("&" + parameterName + "=");
//              }
//          } else {
//              queryString.append("&" + parameterName + "=");
//          }
////          if (!parameterName.equals(this.pageParam)) {
////              if (value[i] != null) {
////                try
////                {
////                  queryString.append("&" + parameterName + "=" + URLEncoder.encode(value[i], "UTF-8"));
////                }
////                catch (UnsupportedEncodingException e)
////                {
////                  queryString.append("&" + parameterName + "=");
////                }
////              } else {
////                queryString.append("&" + parameterName + "=");
////              }
////            }
//      }
//    }
//    return queryString.toString();
//  }
//
//    public void setTemplate(String template) {
//        this.template = template;
//    }
//
//    public void setName(String string) {
//        this.name = string;
//    }
//
//    public void setPageParam(String pageParam) {
//        this.pageParam = pageParam;
//    }
//
//    public void setScriptName(String scriptName) {
//        this.scriptName = scriptName;
//    }
//
//    public void setSeparator(String separator) {
//        this.separator = separator;
//    }
//
//    private class ImportResponseWrapper extends HttpServletResponseWrapper {
//        public static final String DEFAULT_ENCODING = "ISO-8859-1";
//        private final StringWriter sw = new StringWriter();
//        private final ByteArrayOutputStream bos = new ByteArrayOutputStream();
//        private final ServletOutputStream sos = new ServletOutputStream() {
//            public void write(int b) {
//                PaginationSubmitTag.ImportResponseWrapper.this.bos.write(b);
//            }
//        };
//        private boolean isWriterUsed;
//        private boolean isStreamUsed;
//        private int status = 200;
//
//        public ImportResponseWrapper(HttpServletResponse response) {
//            super(response);
//        }
//
//        public PrintWriter getWriter() {
//            if (this.isStreamUsed) {
//                throw new RuntimeException("import illegal stream");
//            }
//            this.isWriterUsed = true;
//            return new PrintWriter(this.sw);
//        }
//
//        public ServletOutputStream getOutputStream() {
//            if (this.isWriterUsed) {
//                throw new RuntimeException("import_illegal writer");
//            }
//            this.isStreamUsed = true;
//            return this.sos;
//        }
//
//        public void setContentType(String x) {
//        }
//
//        public void setLocale(Locale x) {
//        }
//
//        public void setStatus(int status) {
//            this.status = status;
//        }
//
//        public int getStatus() {
//            return this.status;
//        }
//
//        public String getString() throws UnsupportedEncodingException {
//            if (this.isWriterUsed) {
//                return this.sw.toString();
//            }
//            if (this.isStreamUsed) {
//                return this.bos.toString("ISO-8859-1");
//            }
//            return "";
//        }
//    }
    private static final long serialVersionUID = 1L;

    private String name;

    private PageHolder pageHolder;

    private String pageParam = "page";

    private int page = 1;

    private String template = "paginationSubmit";

    private String scriptName;

    private String separator = "?";

    /**
     * 페이지 파라매터 명 리스트(, 로 구분)
     */
    private String parameters;

    @Override
    public int doStartTag() throws JspTagException {
        return SKIP_BODY;
    }

    @Override
    public int doEndTag() throws JspTagException {
        try {
            this.pageHolder = (PageHolder) lookup(pageContext, name, "request");
            if (pageHolder == null) {
                return SKIP_BODY;
            }

            Map<String, Object> pageInfo = new HashMap<String, Object>();

            pageInfo.put("totalPage", this.pageHolder.getTotalPages());
            pageInfo.put("totalCount", this.pageHolder.getTotalRows());

            this.page = this.pageHolder.getCurrentPage();
            pageInfo.put("currentPage", page);

            pageInfo.put("separator", this.separator);
            pageInfo.put("scriptName", this.scriptName);
            pageInfo.put("pageParam", this.pageParam);

            int startPage = ((int) Math.ceil((double) page / (double) this.pageHolder.getPageSize()) - 1) * this.pageHolder.getPageSize() + 1;
            pageInfo.put("startPage", startPage);

            String paramString = makeParamString(pageContext.getRequest());
            pageInfo.put("paramString", paramString);


            List<Integer> pages = new ArrayList<Integer>(this.pageHolder.getPageSize());

            int i = 0;
            for (i = startPage; i < startPage + this.pageHolder.getPageSize(); i++) {
                if (i <= this.pageHolder.getTotalPages()) {
                    pages.add(new Integer(i));
                } else {
                    break;
                }
            }

            pageInfo.put("pages", pages);
            pageInfo.put("nextScalePage", i);
            pageInfo.put("previousScalePage", startPage - this.pageHolder.getPageSize());
            pageContext.getRequest().setAttribute("pageInfo", pageInfo);
            ImportResponseWrapper wrapper = new ImportResponseWrapper((HttpServletResponse) pageContext.getResponse());
            pageContext.getRequest().getRequestDispatcher("/WEB-INF/pagingTemplate/" + this.template + ".jsp").include(pageContext.getRequest(), wrapper);
            pageContext.getOut().print(wrapper.getString());
        } catch (Exception e) {
            throw new JspTagException(e);
        }

        return EVAL_PAGE;
    }

    protected Object lookup(PageContext pageContext, String name, String scope) throws JspTagException {
        Object bean = null;
        if (scope == null) {
            bean = pageContext.findAttribute(name);
        } else if (scope.equalsIgnoreCase("page")) {
            bean = pageContext.getAttribute(name, PageContext.PAGE_SCOPE);
        } else if (scope.equalsIgnoreCase("request")) {
            bean = pageContext.getAttribute(name, PageContext.REQUEST_SCOPE);
        } else if (scope.equalsIgnoreCase("session")) {
            bean = pageContext.getAttribute(name, PageContext.SESSION_SCOPE);
        } else if (scope.equalsIgnoreCase("application")) {
            bean = pageContext.getAttribute(name, PageContext.APPLICATION_SCOPE);
        } else {
            JspTagException e = new JspTagException("Invalid scope " + scope);
            throw e;
        }
        return (bean);
    }

    @SuppressWarnings("rawtypes")
    private String makeParamString(ServletRequest request) {
        StringBuilder queryString = new StringBuilder();
        StringBuffer erString = new StringBuffer();

        Enumeration er = request.getParameterNames();

        while (er.hasMoreElements()) {
            String temp = er.nextElement().toString();
            if(erString.length() != 0){
                erString.append(",");
            }
            erString.append(temp);
        }

        if(StringUtils.isEmpty(erString.toString())){
            return "";
        }else{
            this.parameters = erString.toString();
        }

        StringTokenizer tokenizer = new StringTokenizer(this.parameters, ",");
        while (tokenizer.hasMoreTokens()) {
            String parameterName = StringUtils.trim(tokenizer.nextToken());
            String[] value = request.getParameterValues(parameterName);
            for (int i = 0; value != null && i < value.length; i++) {
                if (parameterName.equals(this.pageParam)) {
                    continue;
                }
                if (value[i] != null) {
                    try {
                        queryString.append("&" + parameterName + "=" + URLEncoder.encode(value[i], "UTF-8"));
                    } catch (UnsupportedEncodingException e) {
                        queryString.append("&" + parameterName + "=");
                    }
                } else {
                    queryString.append("&" + parameterName + "=");
                }
            }
        }

        return queryString.toString();
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    public void setName(String string) {
        name = string;
    }

    public void setPageParam(String pageParam) {
        this.pageParam = pageParam;
    }

    public void setScriptName(String scriptName) {
        this.scriptName = scriptName;
    }

    public void setSeparator(String separator) {
        this.separator = separator;
    }

    private class ImportResponseWrapper extends HttpServletResponseWrapper {

        public static final String DEFAULT_ENCODING = "ISO-8859-1";

        /** The Writer we convey. */
        private final StringWriter sw = new StringWriter();

        /** A buffer, alternatively, to accumulate bytes. */
        private final ByteArrayOutputStream bos = new ByteArrayOutputStream();

        /** A ServletOutputStream we convey, tied to this Writer. */
        /*
        private final ServletOutputStream sos = new ServletOutputStream() {
            @Override
            public void write(int b) {
                bos.write(b);
            }
        };
        */
        /** 'True' if getWriter() was called; false otherwise. */
        private boolean isWriterUsed;

        /** 'True if getOutputStream() was called; false otherwise. */
        private boolean isStreamUsed;

        /** The HTTP status set by the target. */
        private int status = 200;

        // ************************************************************
        // Constructor and methods
        /** Constructs a new ImportResponseWrapper. */
        public ImportResponseWrapper(HttpServletResponse response) {
            super(response);
        }

        /** Returns a Writer designed to buffer the output. */
        @Override
        public PrintWriter getWriter() {
            if (isStreamUsed) {
                throw new RuntimeException("import illegal stream");
            }
            isWriterUsed = true;
            return new PrintWriter(sw);
        }

        /** Returns a ServletOutputStream designed to buffer the output. */
        /*
        @Override
        public ServletOutputStream getOutputStream() {
            if (isWriterUsed) {
                throw new RuntimeException("import_illegal writer");
            }
            isStreamUsed = true;
            return sos;
        }
        */
        /** Has no effect. */
        @Override
        public void setContentType(String x) {
            // ignore
        }

        /** Has no effect. */
        @Override
        public void setLocale(Locale x) {
            // ignore
        }

        @Override
        public void setStatus(int status) {
            this.status = status;
        }

        @SuppressWarnings("unused")
        public int getStatus() {
            return status;
        }

        /**
         * Retrieves the buffered output, using the containing tag's
         * 'charEncoding' attribute, or the tag's default encoding, <b>if
         * necessary</b>.
         */
        // not simply toString() because we need to throw
        // UnsupportedEncodingException
        public String getString() throws UnsupportedEncodingException {
            if (isWriterUsed) {
                return sw.toString();
            } else if (isStreamUsed) {
                return bos.toString(DEFAULT_ENCODING);
            } else {
                return "";
            }
        }
    }
}
