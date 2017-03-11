package net.linkednest.common.exception;

@SuppressWarnings("serial")
public class FileuploadException extends Exception{
	private static final String DEFAULT_MSG = "파일업로드 진행중 오류가 발생했습니다.";

	public FileuploadException() {
		super(DEFAULT_MSG);
	}

	public FileuploadException(String message) {
		super(message);
	}

}
