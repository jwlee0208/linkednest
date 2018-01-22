package net.linkednest.www.test.testtwo.web;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.HTMLElementName;
import net.htmlparser.jericho.Source;



public class HtmlParseJerichoTest {
	private static Source setSource(String url) throws Exception{
		Source source = new Source(new URL(url));
		source.fullSequentialParse();
		return source;
	}
	
	private static void getDNWCategoryAttrList() throws Exception{
		Source source = HtmlParseJerichoTest.setSource("http://prod.danawa.com/list/?defSite=PC&cate1=861&cate2=873");
		
		List<Element> allElement = source.getAllElements();
		System.out.println(allElement.size());
		if(allElement != null && allElement.size() > 0){
			
			/**
			 * 카테고리별 상품목록
			 * http://api.danawa.com/api/main/category/product/list?charset=euckr&key=f817de63d6163a0962b5c43e4d3343b6&cate1=861&cate2=873&orderBy=productNameDESC&limit=10&offset=0
			 
			<productCategories>
			<productCategory>
			<cateCode1>861</cateCode1>
			<cateCode2>873</cateCode2>
			<cateCode3>960</cateCode3>
			<cateCode4>0</cateCode4>
			<product>
			<code>1241266</code>
			<name>산타로사 2220 (벌크)</name>
			<minPrice>367500</minPrice>
			<avgPrice>376744</avgPrice>
			<makeDate>2010-11-01</makeDate>
			<shopCount>4</shopCount>
			<shortageYN>N</shortageYN>
			<productSimpleDescription>
			<importantOptionString>AMD(소켓F)|64(32)비트|듀얼 코어|쓰레드 2개|2.8GHz|1MB x2</importantOptionString>
			<etcOptionString/>
			</productSimpleDescription>
			<maker>
			<code>3132</code>
			<name>AMD</name>
			</maker>
			<brand>
			<code>0</code>
			<name>옵테론</name>
			</brand>
			<productDescription>
			<importantOptionString>AMD(소켓F)|64(32)비트|듀얼 코어|쓰레드 2개|2.8GHz|1MB x2</importantOptionString>
			<etcOptionString/>
			</productDescription>
			</product>
			<viewBit>c2,c3</viewBit>
			<saveQuantity>5059</saveQuantity>
			<image_url>
			http://img.danawa.com/prod_img/500000/266/241/img/1241266_1_80.jpg
			</image_url>
			<danawaUrl>
			http://api.danawa.com/bridge/index.html?text=4F186778BB48C49EAA1E25B737932C1AEA5C38CD1AA1792B8C208DA99A859A70F6F5CC80CACF20D6845CACF697ECC9DFD214F7570DFA281457CED0C8E5938B2732ECC9FAF09523128D343DBBE8EFD3F60E529EADF810F9DC4B3E7EB263F0D896&logger_kw=api_bridge_1592
			</danawaUrl>
			</productCategory>
			<productCategory>
			<cateCode1>861</cateCode1>
			<cateCode2>873</cateCode2>
			<cateCode3>959</cateCode3>
			<cateCode4>0</cateCode4>
			<product>
			<code>1337481</code>
			<name>X5690 (웨스터미어) (정품)</name>
			<minPrice>2331990</minPrice>
			<avgPrice>2331990</avgPrice>
			<makeDate>2011-04-01</makeDate>
			<shopCount>1</shopCount>
			<shortageYN>N</shortageYN>
			<productSimpleDescription>
			<importantOptionString>인텔(소켓1366)|64비트|헥사(6) 코어|쓰레드 12개|3.46GHz|256KB x6</importantOptionString>
			<etcOptionString/>
			</productSimpleDescription>
			<maker>
			<code>3156</code>
			<name>인텔</name>
			</maker>
			<brand>
			<code>0</code>
			<name>제온</name>
			</brand>
			<productDescription>
			<importantOptionString>인텔(소켓1366)|64비트|헥사(6) 코어|쓰레드 12개|3.46GHz|256KB x6</importantOptionString>
			<etcOptionString/>
			</productDescription>
			</product>
			<viewBit>c2,c3</viewBit>
			<saveQuantity>65</saveQuantity>
			<image_url>
			http://img.danawa.com/prod_img/500000/481/337/img/1337481_1_80.jpg
			</image_url>
			<danawaUrl>
			http://api.danawa.com/bridge/index.html?text=4F186778BB48C49EAA1E25B737932C1AEA5C38CD1AA1792B8C208DA99A859A7092251315AD7E4A10E3B3179BF8195316F1E420B5C000B0A8C0B632361312BAC963BE71FFF5274F0AAB4069ECCA873A599D3B4AD343CA7A8CF0FC8A4B952D6C73&logger_kw=api_bridge_1592
			</danawaUrl>
			</productCategory>
			<productCategory>
			<cateCode1>861</cateCode1>
			<cateCode2>873</cateCode2>
			<cateCode3>959</cateCode3>
			<cateCode4>0</cateCode4>
			<product>
			<code>1068890</code>
			<name>X5680 (웨스터미어) (정품)</name>
			<minPrice>2116800</minPrice>
			<avgPrice>2140444</avgPrice>
			<makeDate>2010-04-01</makeDate>
			<shopCount>4</shopCount>
			<shortageYN>N</shortageYN>
			<productSimpleDescription>
			<importantOptionString>인텔(소켓1366)|64(32)비트|헥사 코어|쓰레드 12개|3.33GHz|256KB x6</importantOptionString>
			<etcOptionString>터보부스트 / 하이퍼스레딩</etcOptionString>
			</productSimpleDescription>
			<maker>
			<code>3156</code>
			<name>인텔</name>
			</maker>
			<brand>
			<code>0</code>
			<name>제온</name>
			</brand>
			<productDescription>
			<importantOptionString>인텔(소켓1366)|64(32)비트|헥사 코어|쓰레드 12개|3.33GHz|256KB x6</importantOptionString>
			<etcOptionString>터보부스트 / 하이퍼스레딩</etcOptionString>
			</productDescription>
			</product>
			<viewBit>c2,c3</viewBit>
			<saveQuantity>55</saveQuantity>
			<image_url>
			http://img.danawa.com/prod_img/500000/890/068/img/1068890_1_80.jpg
			</image_url>
			<danawaUrl>
			http://api.danawa.com/bridge/index.html?text=4F186778BB48C49EAA1E25B737932C1AEA5C38CD1AA1792B8C208DA99A859A708A77C3D5F3BEC8D28B99260876BED6A3F924B0335EE6420F76A16003872451D6B3ED3C612F8FF473166CFDA1706CE2685E403C532924ED18BB7D5B22657C2B96&logger_kw=api_bridge_1592
			</danawaUrl>
			</productCategory>
			<productCategory>
			<cateCode1>861</cateCode1>
			<cateCode2>873</cateCode2>
			<cateCode3>959</cateCode3>
			<cateCode4>0</cateCode4>
			<product>
			<code>1337528</code>
			<name>X5675 (웨스터미어) (정품)</name>
			<minPrice>1824200</minPrice>
			<avgPrice>1896222</avgPrice>
			<makeDate>2011-04-01</makeDate>
			<shopCount>4</shopCount>
			<shortageYN>N</shortageYN>
			<productSimpleDescription>
			<importantOptionString>인텔(소켓1366)|64비트|헥사(6) 코어|쓰레드 12개|3.06GHz|256KB x6</importantOptionString>
			<etcOptionString/>
			</productSimpleDescription>
			<maker>
			<code>3156</code>
			<name>인텔</name>
			</maker>
			<brand>
			<code>0</code>
			<name>제온</name>
			</brand>
			<productDescription>
			<importantOptionString>인텔(소켓1366)|64비트|헥사(6) 코어|쓰레드 12개|3.06GHz|256KB x6</importantOptionString>
			<etcOptionString/>
			</productDescription>
			</product>
			<viewBit>c2,c3</viewBit>
			<saveQuantity>169</saveQuantity>
			<image_url>
			http://img.danawa.com/prod_img/500000/528/337/img/1337528_1_80.jpg
			</image_url>
			<danawaUrl>
			http://api.danawa.com/bridge/index.html?text=4F186778BB48C49EAA1E25B737932C1AEA5C38CD1AA1792B8C208DA99A859A7092251315AD7E4A10E3B3179BF8195316069FDBE783F5CFBB7FC146C76D9DD3D163BE71FFF5274F0AAB4069ECCA873A59226B064511BE57C6D189806C8071C3F5&logger_kw=api_bridge_1592
			</danawaUrl>
			</productCategory>
			<productCategory>
			<cateCode1>861</cateCode1>
			<cateCode2>873</cateCode2>
			<cateCode3>959</cateCode3>
			<cateCode4>0</cateCode4>
			<product>
			<code>1068928</code>
			<name>X5670 (웨스터미어) (정품)</name>
			<minPrice>2050490</minPrice>
			<avgPrice>2050490</avgPrice>
			<makeDate>2010-04-01</makeDate>
			<shopCount>1</shopCount>
			<shortageYN>N</shortageYN>
			<productSimpleDescription>
			<importantOptionString>인텔(소켓1366)|64(32)비트|헥사 코어|쓰레드 12개|2.93GHz|256KB x6</importantOptionString>
			<etcOptionString>터보부스트 / 하이퍼스레딩</etcOptionString>
			</productSimpleDescription>
			<maker>
			<code>3156</code>
			<name>인텔</name>
			</maker>
			<brand>
			<code>0</code>
			<name>제온</name>
			</brand>
			<productDescription>
			<importantOptionString>인텔(소켓1366)|64(32)비트|헥사 코어|쓰레드 12개|2.93GHz|256KB x6</importantOptionString>
			<etcOptionString>터보부스트 / 하이퍼스레딩</etcOptionString>
			</productDescription>
			</product>
			<viewBit>c2,c3</viewBit>
			<saveQuantity>69</saveQuantity>
			<image_url>
			http://img.danawa.com/prod_img/500000/928/068/img/1068928_1_80.jpg
			</image_url>
			<danawaUrl>
			http://api.danawa.com/bridge/index.html?text=4F186778BB48C49EAA1E25B737932C1AEA5C38CD1AA1792B8C208DA99A859A708A77C3D5F3BEC8D28B99260876BED6A36F6BA8EAF0AF524AA2EC073A13C5F6B7B3ED3C612F8FF473166CFDA1706CE2684990875C9907BEC7D7158A004BA83298&logger_kw=api_bridge_1592
			</danawaUrl>
			</productCategory>
			<productCategory>
			<cateCode1>861</cateCode1>
			<cateCode2>873</cateCode2>
			<cateCode3>959</cateCode3>
			<cateCode4>0</cateCode4>
			<product>
			<code>1068957</code>
			<name>X5660 (웨스터미어) (정품)</name>
			<minPrice>1495000</minPrice>
			<avgPrice>1564489</avgPrice>
			<makeDate>2010-04-01</makeDate>
			<shopCount>6</shopCount>
			<shortageYN>N</shortageYN>
			<productSimpleDescription>
			<importantOptionString>인텔(소켓1366)|64(32)비트|헥사 코어|쓰레드 12개|2.8GHz|256KB x6</importantOptionString>
			<etcOptionString>터보부스트 / 하이퍼스레딩</etcOptionString>
			</productSimpleDescription>
			<maker>
			<code>3156</code>
			<name>인텔</name>
			</maker>
			<brand>
			<code>0</code>
			<name>제온</name>
			</brand>
			<productDescription>
			<importantOptionString>인텔(소켓1366)|64(32)비트|헥사 코어|쓰레드 12개|2.8GHz|256KB x6</importantOptionString>
			<etcOptionString>터보부스트 / 하이퍼스레딩</etcOptionString>
			</productDescription>
			</product>
			<viewBit>c2,c3</viewBit>
			<saveQuantity>94</saveQuantity>
			<image_url>
			http://img.danawa.com/prod_img/500000/957/068/img/1068957_1_80.jpg
			</image_url>
			<danawaUrl>
			http://api.danawa.com/bridge/index.html?text=4F186778BB48C49EAA1E25B737932C1AEA5C38CD1AA1792B8C208DA99A859A708A77C3D5F3BEC8D28B99260876BED6A36F3A575BC3B4828DBE5F9E241F9AA600B3ED3C612F8FF473166CFDA1706CE268D3842363102114FC842CBC6820673E96&logger_kw=api_bridge_1592
			</danawaUrl>
			</productCategory>
			<productCategory>
			<cateCode1>861</cateCode1>
			<cateCode2>873</cateCode2>
			<cateCode3>959</cateCode3>
			<cateCode4>0</cateCode4>
			<product>
			<code>1241096</code>
			<name>X5650 (웨스터미어) (정품)</name>
			<minPrice>1273700</minPrice>
			<avgPrice>1319499</avgPrice>
			<makeDate>2010-11-01</makeDate>
			<shopCount>6</shopCount>
			<shortageYN>N</shortageYN>
			<productSimpleDescription>
			<importantOptionString>인텔(소켓1366)|64(32)비트|헥사 코어|쓰레드 12개|2.66GHz|256KB x6</importantOptionString>
			<etcOptionString>터보부스트 / 하이퍼스레딩</etcOptionString>
			</productSimpleDescription>
			<maker>
			<code>3156</code>
			<name>인텔</name>
			</maker>
			<brand>
			<code>0</code>
			<name>제온</name>
			</brand>
			<productDescription>
			<importantOptionString>인텔(소켓1366)|64(32)비트|헥사 코어|쓰레드 12개|2.66GHz|256KB x6</importantOptionString>
			<etcOptionString>터보부스트 / 하이퍼스레딩</etcOptionString>
			</productDescription>
			</product>
			<viewBit>c2,c3</viewBit>
			<saveQuantity>141</saveQuantity>
			<image_url>
			http://img.danawa.com/prod_img/500000/096/241/img/1241096_1_80.jpg
			</image_url>
			<danawaUrl>
			http://api.danawa.com/bridge/index.html?text=4F186778BB48C49EAA1E25B737932C1AEA5C38CD1AA1792B8C208DA99A859A70F6F5CC80CACF20D6845CACF697ECC9DF042588AD93455314A33AF464DA7D49A832ECC9FAF09523128D343DBBE8EFD3F6609E32C2A6AAAAA903D38976C40FF090&logger_kw=api_bridge_1592
			</danawaUrl>
			</productCategory>
			<productCategory>
			<cateCode1>861</cateCode1>
			<cateCode2>873</cateCode2>
			<cateCode3>959</cateCode3>
			<cateCode4>0</cateCode4>
			<product>
			<code>1834223</code>
			<name>X5650 (웨스터미어) (벌크)</name>
			<minPrice>162000</minPrice>
			<avgPrice>813230</avgPrice>
			<makeDate>2010-11-01</makeDate>
			<shopCount>2</shopCount>
			<shortageYN>N</shortageYN>
			<productSimpleDescription>
			<importantOptionString>인텔(소켓1366)|64(32)비트|헥사 코어|쓰레드 12개|2.66GHz|256KB x6</importantOptionString>
			<etcOptionString>터보부스트 / 하이퍼스레딩</etcOptionString>
			</productSimpleDescription>
			<maker>
			<code>3156</code>
			<name>인텔</name>
			</maker>
			<brand>
			<code>0</code>
			<name>제온</name>
			</brand>
			<productDescription>
			<importantOptionString>인텔(소켓1366)|64(32)비트|헥사 코어|쓰레드 12개|2.66GHz|256KB x6</importantOptionString>
			<etcOptionString>터보부스트 / 하이퍼스레딩</etcOptionString>
			</productDescription>
			</product>
			<viewBit>c2,c3</viewBit>
			<saveQuantity>60</saveQuantity>
			<image_url>
			http://img.danawa.com/prod_img/500000/223/834/img/1834223_1_80.jpg
			</image_url>
			<danawaUrl>
			http://api.danawa.com/bridge/index.html?text=4F186778BB48C49EAA1E25B737932C1AEA5C38CD1AA1792B8C208DA99A859A70B40B95EEECCF2DCC9809AA0945C88B6108B3D4AB5CA86BD817179923AEAE4B4C00D2212C1EDD36606A408A5B7B98FAC03D954125B9F09E02EE84222C04996B0E&logger_kw=api_bridge_1592
			</danawaUrl>
			</productCategory>
			<productCategory>
			<cateCode1>861</cateCode1>
			<cateCode2>873</cateCode2>
			<cateCode3>959</cateCode3>
			<cateCode4>0</cateCode4>
			<product>
			<code>1068763</code>
			<name>X5570 (네할렘) (정품)</name>
			<minPrice>824300</minPrice>
			<avgPrice>844984</avgPrice>
			<makeDate>2010-04-01</makeDate>
			<shopCount>4</shopCount>
			<shortageYN>N</shortageYN>
			<productSimpleDescription>
			<importantOptionString>인텔(소켓1366)|64(32)비트|쿼드 코어|쓰레드 8개|2.93GHz|256KB x4</importantOptionString>
			<etcOptionString>터보부스트 / 하이퍼스레딩</etcOptionString>
			</productSimpleDescription>
			<maker>
			<code>3156</code>
			<name>인텔</name>
			</maker>
			<brand>
			<code>0</code>
			<name>제온</name>
			</brand>
			<productDescription>
			<importantOptionString>인텔(소켓1366)|64(32)비트|쿼드 코어|쓰레드 8개|2.93GHz|256KB x4</importantOptionString>
			<etcOptionString>터보부스트 / 하이퍼스레딩</etcOptionString>
			</productDescription>
			</product>
			<viewBit>c2,c3</viewBit>
			<saveQuantity>36</saveQuantity>
			<image_url>
			http://img.danawa.com/prod_img/500000/763/068/img/1068763_1_80.jpg
			</image_url>
			<danawaUrl>
			http://api.danawa.com/bridge/index.html?text=4F186778BB48C49EAA1E25B737932C1AEA5C38CD1AA1792B8C208DA99A859A708A77C3D5F3BEC8D28B99260876BED6A3D087B092540AD89FE16C690D065724BEB3ED3C612F8FF473166CFDA1706CE26883B27B975345372F238FA012F0CB6A95&logger_kw=api_bridge_1592
			</danawaUrl>
			</productCategory>
			<productCategory>
			<cateCode1>861</cateCode1>
			<cateCode2>873</cateCode2>
			<cateCode3>959</cateCode3>
			<cateCode4>0</cateCode4>
			<product>
			<code>1670113</code>
			<name>X5550 (네할렘) (벌크)</name>
			<minPrice>651000</minPrice>
			<avgPrice>651000</avgPrice>
			<makeDate>2010-04-01</makeDate>
			<shopCount>1</shopCount>
			<shortageYN>N</shortageYN>
			<productSimpleDescription>
			<importantOptionString>인텔(소켓1366)|64(32)비트|쿼드 코어|쓰레드 8개|2.66GHz|256KB x4</importantOptionString>
			<etcOptionString/>
			</productSimpleDescription>
			<maker>
			<code>3156</code>
			<name>인텔</name>
			</maker>
			<brand>
			<code>0</code>
			<name>제온</name>
			</brand>
			<productDescription>
			<importantOptionString>인텔(소켓1366)|64(32)비트|쿼드 코어|쓰레드 8개|2.66GHz|256KB x4</importantOptionString>
			<etcOptionString/>
			</productDescription>
			</product>
			<viewBit>c2,c3</viewBit>
			<saveQuantity>17</saveQuantity>
			<image_url>
			http://img.danawa.com/prod_img/500000/113/670/img/1670113_1_80.jpg
			</image_url>
			<danawaUrl>
			http://api.danawa.com/bridge/index.html?text=4F186778BB48C49EAA1E25B737932C1AEA5C38CD1AA1792B8C208DA99A859A706ADED1A819C9003E988451489B383259641899C6E09443BD0B1F757A69E3A6E97FA1A3D67A81F619066A8F73E5372E4FAC42D85A970236A98CE5CCDC6A962FD6&logger_kw=api_bridge_1592
			</danawaUrl>
			</productCategory>
			</productCategories>			 
			 */
			
			
			
			/**
			 * 카테고리 리스트
			 * http://api.danawa.com/api/main/category/site/list?key=82079354151a950cdc76b11733745e55&mediatype=xml&charset=euckr&site=1
			 <sites>
				<site>
				<code>1</code>
				<cateName>디지털 완제품</cateName>
				<cate1>860</cate1>
				<cate2>0</cate2>
				<cate3>0</cate3>
				<cate4>0</cate4>
				</site>
				<site>
				<code>1</code>
				<cateName>PC 주요 부품</cateName>
				<cate1>861</cate1>
				<cate2>0</cate2>
				<cate3>0</cate3>
				<cate4>0</cate4>
				</site>
				<site>
				<code>1</code>
				<cateName>주변기기</cateName>
				<cate1>862</cate1>
				<cate2>0</cate2>
				<cate3>0</cate3>
				<cate4>0</cate4>
				</site>
				<site>
				<code>1</code>
				<cateName>멀티미디어/네트워크</cateName>
				<cate1>863</cate1>
				<cate2>0</cate2>
				<cate3>0</cate3>
				<cate4>0</cate4>
				</site>
				<site>
				<code>1</code>
				<cateName>소모품/SW</cateName>
				<cate1>864</cate1>
				<cate2>0</cate2>
				<cate3>0</cate3>
				<cate4>0</cate4>
				</site>
			</sites>
			 */
			
			
			/**
			 * 카테고리 정보
			 * http://api.danawa.com/api/main/category/info?key=330687a5d0141f3602af72dec92d568c&mediatype=xml&charset=euckr&cateCode=865
			 <category>
				<cateCode>865</cateCode>
				<parentCateCode>860</parentCateCode>
				<cateName>표준PC</cateName>
				<depth>2</depth>
				<virtualYN>N</virtualYN>
			</category>
			 */
			for(Element obj : allElement){
				
				
				
				Source childElemAttr = obj.getContent().getSource();
				System.out.println(childElemAttr.toString());
				
				
				
//				Segment seg = obj.getContent();
//				Source segSource = seg.getSource();
//				
//				boolean isListOptionArea = false;
//				
//				if(segSource != null && segSource.getElementById("listOptionTable") != null){
//					isListOptionArea = segSource.getElementById("listOptionTable").isEmpty();
//
//					if(!isListOptionArea){
//						List<Element> listElement = segSource.getElementById("listOptionTable").getAllElements();
//						
//						if(listElement != null && listElement.size() > 0){
//							for(Element optionElement : listElement){
//								System.out.println(optionElement.getContent().toString());
//							}
//						}
//						
//					}
//
//				}
				
//				System.out.println(obj.getContent().toString());
			}
		}
		
//		Element listOptionElement = source.getElementById("listOptionTable");
//		
//		Element tbody = listOptionElement.getAllElements(HTMLElementName.TBODY).get(0);
//		
//		List<Element> tr = tbody.getAllElements();
//		
//		if(tr != null && tr.size() > 0){
//			for(Element element : tr){
//				System.out.println(element.getTextExtractor().toString());
//			}
//		}
//		
		
	}
	
	private static void basic() throws IOException, MalformedURLException {
	    Source source = new Source(new URL("http://www.koreabaseball.com/Record/HitterRecord.aspx?sort=HRA"));
	    source.fullSequentialParse();
	     
	    List<Element> elementList = source.getAllElementsByClass("tData");
	    
	    for(Element table : elementList){
	    	
	    	Element thead = table.getAllElements(HTMLElementName.THEAD).get(0);
	    	
	    	
	    	List<Element> th = thead.getAllElements(HTMLElementName.TH);
	    	
	    	Element tbody = table.getAllElements(HTMLElementName.TBODY).get(0);
	    	List<Element> tr = tbody.getAllElements(HTMLElementName.TR);
	    	
	    	List<String> attrList = new ArrayList<String>();
	    	
	    	for(Element attrName : th){
	    		String attrValue = attrName.getTextExtractor().toString();
	    		attrList.add(attrValue);
	    	}

	    	for(Element trElem : tr){
	    		
	    		List<Element> td = trElem.getAllElements(HTMLElementName.TD);
	    		StringBuilder sb = new StringBuilder();
	    		for(Element tdElem : td){
	    			
		    		sb.append(":" + tdElem.getTextExtractor().toString());	
		    		
	    		}
	    		System.out.println(sb.toString());
	    	}	    
	    }
	    // id 로 찾을 수 있다.
//	    Element div = source.getElementById("ranklst_total_day");
	     
	    // 자식 엘레멘트를 찾을 때 특정 엘레멘트만 찾도록 할 수 있다.
	    // 하나의 자식 엘레멘트만 가져오는 API 가 없어서 index 0 으로 찾아야 한다. 
//	    Element ul = div.getAllElements(HTMLElementName.UL).get(0);
//	    List<Element> liList = ul.getAllElements(HTMLElementName.LI);
	     
//	    for (Element li : liList) {
//	        Element dl = li.getAllElements(HTMLElementName.DL).get(0);
//	         
//	        Element dt = dl.getAllElements(HTMLElementName.DT).get(0);
//	        Element dd = dl.getAllElements(HTMLElementName.DD).get(0);
//	 
//	        // getAttributeValue 를 통해 엘레멘트의 속성을 가져 올 수 있다.
//	        String rank = dt.getAttributeValue("class").split(" ")[0].substring(6);
//	        String content = dt.getContent().getTextExtractor().toString();
//	         
//	        String position1 = dd.getAttributeValue("class").split(" ")[1];
//	        String position2 = dd.getContent().getTextExtractor().toString();
//	         
//	        System.out.println(rank + " " + content + " 변동폭(" + position1 + position2 + ")");
//	    }
	}	
	
	public static void main(String[] args) throws Exception{
//		HtmlParseJerichoTest.basic();
		HtmlParseJerichoTest.getDNWCategoryAttrList();
	}
}
