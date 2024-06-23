<%@ page 	import="org.springframework.web.bind.annotation.SessionAttributes"%>
<%@ page 	import="net.linkednest.www.user.dto.UserDto"%>
<%@ page 	session="false" 							contentType="text/html; charset=UTF-8"%>
<%@ taglib 	uri="http://java.sun.com/jsp/jstl/core" 	prefix="c" %>
<%@ taglib 	uri="http://www.springframework.org/tags" 	prefix="tag" %>
<script type="text/javascript" 		src="${pageContext.request.contextPath}/js/home/home.js"></script>
<style>
#google_translate_element > div > div {
        position: relative;
        min-width: 200px;
        height: 40px;
}
#google_translate_element > div > div > select::-ms-expand {
    display: none;
}
#google_translate_element > div > div:after {
    content: `<>`; /* 목록 펼침 아이콘 */
    font: 17px "Consolas", monospace;
    color: #333;
    transform: rotate(90deg);
    right: 11px;
    top: 18px;
    padding: 0 0 2px;
    border-bottom: 1px solid #999;
    position: absolute;
    pointer-events: none;
}
#google_translate_element > div > div > select {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    display: block;
    width: 100%;
    max-width: 320px;
    height: 30px;
    float: right;
    margin: 5px 0px;
    padding: 0px 24px;
    font-size: 16px;
    line-height: 1.75;
    color: #333;
    border: 1px solid #cccccc;
    -ms-word-break: normal;
    word-break: normal;
    border-radius: 10px;
}
div#google_translate_element {
    text-align: right;
}
</style>
<div class="loader"></div>
<div class="navbar navbar-light navbar-toggleable-md bd-navbar navbar-collapse">
	<ul class="navbar-nav mr-auto">
		<li></li>
   	</ul>
   	<ul class="navbar-nav navbar-right float-right">
     	<li class="nav-item">
		    <div id="google_translate_element"></div>
		</li>		
    </ul>
    <script type="text/javascript">
	    function googleTranslateElementInit() {
			new google.translate.TranslateElement(
					{
						pageLanguage : 'en',
						includedLanguages : 'en,ja,es,fr,de,pt,zh-CN,zh-TW,ru,ko,id,it,cs,eu,ar,nl,ms,sa,th,vi',
						multilanguagePage : true,
						gaTrack : true,
						gaId : 'UA-65838621-1'
					}, 'google_translate_element');
		}
					/*     function googleTranslateElementInit() {
					    new google.translate.TranslateElement({pageLanguage: 'en', includedLanguages : 'en,ja,es,fr,de,pt,zh-CN,zh-TW,ru,ko,id,it,cs,eu,ar,nl,ms,sa,th,vi', layout: google.translate.TranslateElement.InlineLayout.SIMPLE, multilanguagePage: true, gaTrack: true, gaId: 'UA-65838621-1'}, 'google_translate_element');
					}
					 */
	</script>
    <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>
</div>