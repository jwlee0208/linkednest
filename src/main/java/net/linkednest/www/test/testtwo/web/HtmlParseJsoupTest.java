package net.linkednest.www.test.testtwo.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.HttpResponseException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class HtmlParseJsoupTest {
	/**
	 * Testing Html Parser - Jsoup
	 * @throws Exception
	 */
	private static void parseHtml() throws Exception{
		HttpClient httpClient = new DefaultHttpClient();
		HttpGet httpget = new HttpGet("http://www.koreabaseball.com/Record/HitterTop5.aspx");
		
		try{
		
			httpClient.execute(httpget, new BasicResponseHandler(){
				@Override
				public String handleResponse(HttpResponse response) throws HttpResponseException, IOException {
					String res = new String (super.handleResponse(response).getBytes("8859_1"), "euc-kr");
					Document doc = Jsoup.parse(res);
					
					Elements headRow = doc.select("table.tData thead tr");
					Elements rows = doc.select("table.tData tbody tr");
					
					List<String> headItemList = new ArrayList<String>();
					for(Element headItem : headRow){
						Iterator<Element> headElem = headItem.getElementsByTag("th").iterator();
						headItemList.add(headElem.next().text());
					}
					
					for(Element row : rows){
						
						StringBuilder sb = new StringBuilder();
						
						Iterator<Element> iterElem = row.getElementsByTag("td").iterator();
						for(String item : headItemList){
							sb.append(item + ":" + iterElem.next().text());
						}
						System.out.println(">>> row : " + sb.toString());
					}
					return res;
				}
				
			});
		}catch(ClientProtocolException cpe){
			cpe.printStackTrace();
		}
		catch(IOException ioe){
			ioe.printStackTrace();
		}
	}
	

	public static void main(String[] args) throws Exception{
		HtmlParseJsoupTest.parseHtml();
	}

}
