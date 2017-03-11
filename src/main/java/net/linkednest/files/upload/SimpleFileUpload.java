package net.linkednest.files.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartException;

public class SimpleFileUpload {
	@Autowired
	public static void upload(HttpServletRequest request){
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		
//		try {
			FileInputStream inputStream = null; //new FileInputStream("operation.properties");
			Properties properties = new Properties();
//			try {
				
//				properties.load(new InputStreamReader(inputStream));
				
				String uploadPath = "/uploadFiles";	//properties.getProperty("file.upload.dir");
				int maxSize = 100*1024*1024;	//Integer.parseInt(properties.getProperty("file.size.max"));
				
				if(isMultipart){
					throw new MultipartException("MultipartException!!!");
				}
				
				File repository = null;
				
				DiskFileItemFactory factory = new DiskFileItemFactory();
//				factory.setRepository(repository);
//				factory.setSizeThreshold(maxSize);
				
				ServletFileUpload servletFileUpload = new ServletFileUpload(factory);
				servletFileUpload.setFileSizeMax(maxSize);
				
				try {
					
					List<FileItem> items = servletFileUpload.parseRequest(request);
					
					Iterator<FileItem> iter = items.iterator();
					
					while(iter.hasNext()){
						FileItem item = iter.next();
						
					    String fieldName = item.getFieldName();
					    String fileName = item.getName();
					    String contentType = item.getContentType();
					    boolean isInMemory = item.isInMemory();
					    long sizeInBytes = item.getSize();					
						
						if(item.isFormField()){
							
							
						}else{
							File uploadFile = new File(uploadPath + fileName);
							try {
								item.write(uploadFile);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}								
							
						}
					}
					
				} catch (FileUploadException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
				
				
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			
//		} catch (FileNotFoundException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		
		
		

	}
}
