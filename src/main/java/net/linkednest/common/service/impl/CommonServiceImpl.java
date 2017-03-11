/*
package net.linkednest.common.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import net.linkednest.common.dao.CommonDao;
import net.linkednest.common.dto.CodeDto;
import net.linkednest.common.dto.MailDto;
import net.linkednest.common.service.CommonService;

@Service("CommonServiceImpl")
public class CommonServiceImpl implements CommonService{
    final Log log = LogFactory.getLog(this.getClass());
    
    @Resource(name="CommonDao")
    private CommonDao commonDao;
    
    private Message message;
    
    private static final String mailServer = "smtp.gmail.com";
    
    private static final String temp01 = "jwlee0208@gmail.com";
    
    @Override
    public List<CodeDto> selectCodeList(CodeDto codeDto) throws Exception{
        return this.commonDao.selectCodeList(codeDto);
    }
    
    @Override
    public void sendMail(MailDto mailInfo) throws Exception{
        
        Properties properties = new Properties();
        
        properties.put("mail.smtp.host", mailServer);
        properties.put("mail.smtp.port", 465);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.enable", "true");

        Authenticator auth = new SMTPAuthenticator(temp01, "");
     
        Session s = Session.getDefaultInstance(properties, auth);
        
        this.message = new MimeMessage(s);
        this.message.setHeader("content-type", "text/html; charset=utf-8");
        this.message.setFrom(new InternetAddress(mailInfo.getMailFrom(), MimeUtility.encodeText(mailInfo.getMailFrom(), "UTF-8", "B")));
        this.message.setRecipient(Message.RecipientType.TO, new InternetAddress(mailInfo.getMailTo(), MimeUtility.encodeText(mailInfo.getMailTo(), "UTF-8", "B")));
        this.message.setSubject(MimeUtility.encodeText(mailInfo.getMailSubject(), "UTF-8", "8"));
        this.message.setContent(mailInfo.getMailContent(), mailInfo.getContentType());
        this.message.setSentDate(new Date());
        
        try{
            Transport.send(this.message);    
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
    
    private static class SMTPAuthenticator extends Authenticator{
        private String id = "";
        private String pw = "";
        
        public SMTPAuthenticator(String id, String pw){
            this.id = id;
            this.pw = pw;
        }
        @Override
        protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
            return new javax.mail.PasswordAuthentication(id, pw);
        }
    }
}
*/
package net.linkednest.common.service.impl;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.linkednest.common.dto.MailDto;
import net.linkednest.common.service.CommonService;
import net.linkednest.user.dto.UserDto;
import org.apache.axis.utils.StringUtils;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import net.linkednest.common.CommonConstant;
import net.linkednest.common.dao.CommonDao;
import net.linkednest.common.dto.CodeDto;
import net.linkednest.common.dto.MailDto;
import net.linkednest.common.service.CommonService;
import net.linkednest.common.util.AES256Util;
import net.linkednest.user.dto.UserDto;
import net.linkednest.user.service.UserServiceImpl;

@Service("CommonServiceImpl")
public class CommonServiceImpl implements CommonService {
    final Log log = LogFactory.getLog(this.getClass());
    
    @Resource(name="CommonDao")
    private CommonDao   commonDao;
    
    private Message     message;

    @Value("${mail.transport.protocol}")
    private String      protocol;
    
    @Value("${admin.mail.id}")
    private String      adminMailId;
    
    @Value("${admin.mail.pw}")
    private String      adminMailPw;
    
    @Value("${mail.smtp.host}")
    private String      smtpServer;
    
    @Value("${mail.smtp.port}")
    private int         smtpServerPort;
    
    @Resource(name="UserServiceImpl")
    private UserServiceImpl userService;
    
    
    @Override
    public List<CodeDto> selectCodeList(CodeDto codeDto) throws Exception{
        return this.commonDao.selectCodeList(codeDto);
    }
    /**
     * @brief : sending mail
     */
    @Override
    public void sendMail(MailDto mailInfo) throws Exception{
        
        Properties properties = new Properties();
        
        properties.put("mail.transport.protocol"    , protocol);
        properties.put("mail.smtp.host"             , smtpServer);
        properties.put("mail.smtp.port"             , smtpServerPort);
        properties.put("mail.smtp.auth"             , "true");
        properties.put("mail.smtp.ssl.enable"       , "true");
        properties.put("mail.smtp.ssl.trust"        , smtpServer);
        properties.put("mail.smtp.user"             , adminMailId);
        
        log.info("[ param ][ adminMailId ] " + adminMailId);
        Session session = Session.getInstance(properties,
                new javax.mail.Authenticator() {
                  protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                      return new javax.mail.PasswordAuthentication(new String(Base64.decodeBase64(Base64.encodeBase64(adminMailId.getBytes()))), new String(Base64.decodeBase64(adminMailPw)));
                  }
                });
        
        this.message = new MimeMessage(session);
        this.message.setHeader("content-type", "text/html; charset=utf-8");
        this.message.setFrom(new InternetAddress(mailInfo.getMailFrom(), MimeUtility.encodeText(mailInfo.getMailFrom(), "UTF-8", "B")));
        this.message.setRecipient(Message.RecipientType.TO, new InternetAddress(mailInfo.getMailTo(), MimeUtility.encodeText(mailInfo.getMailTo(), "UTF-8", "B")));
        this.message.setSubject(MimeUtility.encodeText(mailInfo.getMailSubject(), "UTF-8", "8"));
        this.message.setContent(mailInfo.getMailContent(), mailInfo.getContentType());
        this.message.setSentDate(new Date());
        
        try{
            Transport.send(this.message);    
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
    /**
     * @brief : searching private info
     */
    @Override
    public void getPrivateInfo(HttpServletRequest request, Model model, HttpSession session){
        
        UserDto sessionInfo     = (UserDto)session.getAttribute("userInfo");
        UserDto userInfo        = null; 
        if(sessionInfo != null){
            AES256Util aes256util;
            try {
                aes256util = new AES256Util(CommonConstant.IV);
                try {
                    userInfo = this.userService.selectUserInfo(sessionInfo);
                    
                    String phoneNo = userInfo.getPhoneNo();
                    String email = userInfo.getEmail();
                    
                    if(!StringUtils.isEmpty(phoneNo)){
                        try {
                            userInfo.setPhoneNo(aes256util.decrypt(phoneNo));
                        } catch (NoSuchAlgorithmException e) {
                            // TODO Auto-generated catch block
                            // e.printStackTrace();
                            userInfo.setPhoneNo(phoneNo);
                        } catch (GeneralSecurityException e) {
                            // TODO Auto-generated catch block
                            // e.printStackTrace();
                            userInfo.setPhoneNo(phoneNo);
                        }
                    }
                    if(!StringUtils.isEmpty(email)){
                        try {
                            userInfo.setEmail(aes256util.decrypt(email));
                        } catch (NoSuchAlgorithmException e) {
                            // TODO Auto-generated catch block
                            // e.printStackTrace();
                            userInfo.setEmail(email);
                        } catch (GeneralSecurityException e) {
                            // TODO Auto-generated catch block
                            // e.printStackTrace();
                            userInfo.setEmail(email);
                        }
                    }
                } catch (Exception e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                }
                
            } catch (UnsupportedEncodingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            
        }
        model.addAttribute("userInfo", userInfo);
    }    
}
