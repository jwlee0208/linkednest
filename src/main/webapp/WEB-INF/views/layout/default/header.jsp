<%@page import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<%@ page import="net.linkednest.www.user.dto.UserDto"%>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/home/home.js"></script>
<div class="loader"></div>
<div class="navbar navbar-light navbar-toggleable-md bd-navbar">
    <div id="google_translate_element"></div>
    <script type="text/javascript">
    function googleTranslateElementInit() {
        new google.translate.TranslateElement({pageLanguage: 'ko', layout: google.translate.TranslateElement.InlineLayout.SIMPLE, multilanguagePage: true, gaTrack: true, gaId: 'UA-65838621-1'}, 'google_translate_element');
    }
    </script>
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
</div>