<%--
  Created by IntelliJ IDEA.
  User: jwlee0208
  Date: 2017. 9. 2.
  Time: PM 4:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 		prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" 		prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" 	prefix="tag"%>
<!-- The core React library -->
<script src="http://fb.me/react-0.12.0.js"></script>
<!-- In-browser JSX transformer, remove when pre-compiling JSX. -->
<script src="http://fb.me/JSXTransformer-0.12.0.js"></script>
<script type="text/jsx">

    ReactDOM.render(
            <h1>Hello, world!</h1>,
        document.getElementById('root')
    );
    // When compiled it gets turned into a function


    /*function hello() {
     return React.createElement(
     "div",
     { id: "root" },
     "Hello world!"
     );
     }*/

</script>
<div class="container">
    <title>Title</title>
    <div id="root"></div>
</div>


