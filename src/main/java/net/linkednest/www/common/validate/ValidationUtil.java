package net.linkednest.www.common.validate;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.tika.Tika;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.multipart.MultipartFile;

public class ValidationUtil extends ValidationUtils{
    @SuppressWarnings("unused")
	private static Log logger = LogFactory.getLog(ValidationUtil.class);
    /**
     * 일반 전화번호 체크
     */
    public static final String REG_EX_NORMAL_PHONE_NO  = "^\\d{2,3}"+"-"+"\\d{3,4}"+"-"+"\\d{4}$";   
    /**
     * 핸드폰 전화번호 체크
     */
//    public static final String REG_EX_CELL_PHONE_NO    = "^01(?:[0-9])"+"-"+"(?:\\d{3}|\\d{4})"+"-"+"\\d{4}$";
    public static final String REG_EX_CELL_PHONE_NO    = "^01(?:[0-9])"+"(?:\\d{3}|\\d{4})"+"\\d{4}$";
    /**
     * 이메일 정규식 체크
     */
    public static final String REG_EX_EMAIL            = "^([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\\.[0-9a-zA-Z_-]+){1,2}$";
    /**
     * 한글 정규식 체크
     */
    public static final String REG_EX_KOREAN           = "^[ㄱ-ㅎ가-힣]*$";
    /**
     * 영어 정규식 체크
     */
    public static final String REG_EX_ENGLISH          = "^[a-zA-Z]*$";
    /**
     * 숫자 정규식 체크        
     */
    public static final String REG_EX_NUMERIC          = "^[0-9]*$";  
    /**
     * 영어 & 숫자 정규식 체크
     */
    public static final String REG_EX_ENG_NUM          = "^[a-zA-Z0-9]*$";
   
    public static final String IMAGE_FILES_EXT		   = "jpg, jpeg, bmp, gif, png";
    
    
    /**
     * 정규식 체크
     * @param errors
     * @param field
     * @param errorCode
     * @param errorArgs
     * @param defaultMessage
     * @param regEx
     */
    public static void rejectIfNotRegEx(Errors errors, String field, String errorCode, String defaultMessage, String regEx) {
        Object value = errors.getFieldValue(field);
        if (value != null && StringUtils.hasLength(value.toString())) {
            if(!Pattern.matches(regEx, value.toString())){
                errors.rejectValue(field, errorCode, defaultMessage);
            }
        }
    }
    
    /**
     * 범위 체크
     * @param errors
     * @param field
     * @param errorCode
     * @param errorArgs
     * @param defaultMessage
     * @param minLength
     * @param maxLength
     */
    public static void rejectIfNotRangedNumber(Errors errors, String field, String errorCode, String defaultMessage, int minLength, int maxLength) {
        
    }
    /**
     * 최소 길이 체크
     * @param errors
     * @param field
     * @param errorCode
     * @param errorArgs
     * @param defaultMessage
     * @param minLength
     */
    public static void rejectIfNotMinLength(Errors errors, String field, String errorCode, String defaultMessage, int minLength){
        Object value = errors.getFieldValue(field);
        if (value != null && StringUtils.hasLength(value.toString())) {
            if(value.toString().length() < minLength){
                errors.rejectValue(field, errorCode, defaultMessage);
            }
        }

    }
    /**
     * 최대 길이 체크
     * @param errors
     * @param field
     * @param errorCode
     * @param errorArgs
     * @param defaultMessage
     * @param maxLength
     */
    public static void rejectIfNotMaxLength(Errors errors, String field, String errorCode, String defaultMessage, int maxLength){
        Object value = errors.getFieldValue(field);
        if (value != null && StringUtils.hasLength(value.toString())) {
            if(value.toString().length() > maxLength){
                errors.rejectValue(field, errorCode, defaultMessage);
            }
        }
    }
    /**
     * 패스워드 체크
     * @param errors
     * @param field
     * @param chkField
     * @param errorCode
     * @param errorArgs
     * @param defaultMessage
     */
    public static void rejectIfNotMatchedPasswd(Errors errors, String field, String chkField, String errorCode, String defaultMessage){
        Object value = errors.getFieldValue(field);
        Object chkValue = errors.getFieldValue(chkField);
        if (value != null && StringUtils.hasLength(value.toString())) {
            if(chkValue != null && StringUtils.hasLength(chkValue.toString())){
                if(!value.equals(chkValue)){
                    errors.rejectValue(field, errorCode, defaultMessage);
                }
            }else{
                rejectIfEmpty(errors, chkField, errorCode);
            }
        }else{
            rejectIfEmpty(errors, field, errorCode);
        }
    }
    /**
     * 최소 길이 체크
     * @param fieldValue
     * @param minLength
     * @return
     */
    public static boolean isNotMin(String fieldValue, int minLength){
        boolean result = false;
        if(fieldValue.length() < minLength){
            result = true;
        }
        return result;
    }

    /**
     * 최대 길이 체크
     * @param fieldValue
     * @param maxLength
     * @return
     */
    public static boolean isNotMax(String fieldValue, int maxLength){
        boolean result = false;
        if(fieldValue.length() > maxLength){
            result = true;
        }
        return result;
    } 
    /**
     * @brief 문자열 바이트 수가 초과 값인지 체크
     * @param fieldValue
     * @param chkByteSize
     * @return
     */
    public static boolean chkBytesIsOver(String fieldValue, int chkByteSize){
        int byteLength = ValidationUtil.getByteLength(fieldValue);
        return (byteLength > chkByteSize) ? true : false;
    }
    /**
     * @brief 문자열 바이트 길이 조회
     * @param fieldValue
     * @return
     */
    public static int getByteLength(String fieldValue){
        int byteLength = 0;
        if(!StringUtils.isEmpty(fieldValue)){
            byteLength = fieldValue.getBytes().length;
        }
        return byteLength;
    }

    //이미지 파일 용량 체크
    public static Boolean chkFileSize(long maxSize, MultipartFile uploadFile){
        long fileSize = uploadFile.getSize();
        if (fileSize > maxSize || fileSize <= 0) {
            return false;
        }
        return true;
    }

    //파일 확장자 체크 
    public static Boolean chkFileExtension(String fileExtensions, MultipartFile uploadFile){
        String fileName = uploadFile.getOriginalFilename().trim();
        String fileType = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length()).toLowerCase();
        if (fileExtensions.indexOf(fileType) == -1) {
//            log.info("올바른 파일 확장자가 아닙니다. [" + fileType + "," + fileName + "]");
            return false;
        }
        return true;
    }    
    /**
     * @brief 실제 파일 내용과 확장자가 일치하는지 체크
     * @param fileExtensions
     * @param fileObj
     * @return
     */
    public static boolean chkFileSign(String fileExtensions, File fileObj){
        Tika chkFileExt = new Tika();

        try {
            String chkFileExtStr = chkFileExt.detect(fileObj).toLowerCase();

            if(fileExtensions.indexOf(chkFileExtStr) == -1){
                return false;
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return true;
    }
    /**
     * @brief 실제 파일 내용과 확장자가 일치하는지 체크
     * @param fileExtensions
     * @param is
     * @return
     */
    public static boolean chkFileSign(String fileExtensions, InputStream is){
        Tika chkFileExt = new Tika();
        Pattern p = Pattern.compile("[/]+");
        try {
            String chkFileExtStr = chkFileExt.detect(is).toLowerCase();
            if(!StringUtils.isEmpty(chkFileExtStr)){
                chkFileExtStr = p.split(chkFileExtStr)[1];

                // 문서 파일 (doc, ppt : x-tika-msoffice | docx, pptx, xlsx : x-tika-ooxml)에 대한 체크를 위해 추가
                if("x-tika-msoffice".equals(chkFileExtStr) || "x-tika-ooxml".equals(chkFileExtStr)){
                    return true;
                }
                // 상위 문서 파일에 해당하지 않는 파일들에 대한 변조 체크
                if(fileExtensions.indexOf(chkFileExtStr) == -1){
                    return false;
                }
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return true;
    }

    // 태그 제거
    public static String stripTag(String str){

        String striptTagStr = str.replaceAll("<[^>]*>", "");
        striptTagStr = striptTagStr.replaceAll("<", "");
        striptTagStr = striptTagStr.replaceAll(">", "");
        striptTagStr = striptTagStr.replaceAll("\"", "");

        return striptTagStr;
    }
}
