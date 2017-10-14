package net.linkednest.www.common.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import org.springframework.util.FileCopyUtils;

public class FileUtil {

	/**
	 * 이미지 파일을 임시로 저장한다: 메일 본문에 포함된 이미지
	 * @param path
	 * @param fileName
	 * @param bo
	 * @throws Exception
	 */
	public static void createdFile(String path, String fileName, byte[] bo) throws Exception {
		File dir = new File(path);
		if(dir == null || !dir.exists() || !dir.isDirectory()) {
			if(!dir.mkdir()) {
				throw new Exception();
			}
		}
		
		File file = new File(path + fileName);
		
		if(file.exists() && file.length() > 0) {
			//이미 있으면 있는 파일을 그대로 사용
		} else {
			FileOutputStream fOut = new FileOutputStream(file);
			
			try {
				FileCopyUtils.copy(bo, fOut);
				fOut.flush();
			} catch(Exception e) {
				throw e;
			} finally {
				if(fOut != null) {
					fOut.close();
					fOut = null;
				}
			}
		}
	}

	/**
	 * 파일을 string으로 반환
	 * @param in
	 * @return
	 * @throws Exception
	 */
	public static String getFileString(InputStream in) throws Exception {
		ByteArrayOutputStream bo = null;
		
		try {
			bo = getFileStream(in);
			return bo.toString();
		} catch(Exception e) {
			throw e;
		} finally {
			if(bo != null) {
				bo.close();
				bo = null;
			}
			if(in != null) {
				in.close();
				in = null;
			}
		}
	}

	/**
	 * 파일을 byte[]로 반환
	 * @param in
	 * @return
	 * @throws Exception
	 */
	public static byte[] getFileBytes(InputStream in) throws Exception {
		ByteArrayOutputStream bo = null;
		
		try {
			bo = getFileStream(in);
			return bo.toByteArray();
		} catch(Exception e) {
			throw e;
		} finally {
			if(bo != null) {
				bo.close();
				bo = null;
			}
			if(in != null) {
				in.close();
				in = null;
			}
		}
	}

	/**
	 * inputStream 을 outputStream으로 반환
	 * @param in
	 * @return
	 * @throws Exception
	 */
	private static ByteArrayOutputStream getFileStream(InputStream in) throws Exception {
		ByteArrayOutputStream bo = null;
		
		if(in != null) {
			bo = new ByteArrayOutputStream();

			FileCopyUtils.copy(in, bo);
			bo.flush();
				
			return bo;
		}
		return null;
	}
	
	/**
	 * 지정된 위치의 파일을 삭제한다.
	 * String 객체의 paramter를 받음.
	 *
	 * @param sourceFile 삭제할 위치
	 */
	public static void deleteFile(String sourceFile) {
		deleteFile(new File(sourceFile));
	}
	
	/**
	 * 지정된 위치의 파일을 삭제한다.
	 * File 객체의 paramter를 받음.
	 *
	 * @param sourceDir 삭제할 위치
	 */
	public static void deleteFile(File sourceDir) {
		boolean isDelete = sourceDir.delete();
		if (!isDelete) {
			try {
				throw new Exception("삭제에 실패했습니다.");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public static String getFileList(String strFolderName) {
		File f = null;
		String strFiles = "";

		try {
			f = new File(strFolderName);
			File[] files = f.listFiles();		
			
			if (files.length > 0) {
				for(int i=0; i< files.length;i++){
					if (files[i].isFile()){
						strFiles = strFiles + "," +files[i].getName();
					}
				}
				strFiles = strFiles.substring(1);
			}
		} catch(Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return strFiles;
	}

}
