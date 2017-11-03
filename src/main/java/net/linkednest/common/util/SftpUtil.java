package net.linkednest.common.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.StringTokenizer;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

public class SftpUtil {
    private Session session = null;

    private Channel channel = null;

    private ChannelSftp channelSftp = null;

    /**
     * 서버와 연결에 필요한 값들을 가져와 초기화 시킴
     *
     * @param host
     *            서버 주소
     * @param userName
     *            접속에 사용될 아이디
     * @param password
     *            비밀번호
     * @param port
     *            포트번호
     */
    public void init(String host, String userName, String password, int port) {
        JSch jsch = new JSch();
        try {
            session = jsch.getSession(userName, host, port);
            session.setPassword(password);

            java.util.Properties config = new java.util.Properties();
            config.put("StrictHostKeyChecking", "no");
            session.setConfig(config);
            session.connect();

            channel = session.openChannel("sftp");
            channel.connect();
            System.out.println("connect success!");
        } catch (JSchException e) {
            e.printStackTrace();
        }

        channelSftp = (ChannelSftp) channel;

    }

    /**
     * 하나의 파일을 업로드 한다.
     *
     * @param dir
     *            저장시킬 주소(서버)
     * @param file
     *            저장할 파일
     */
    public void upload(String dir, File file) {

        FileInputStream in = null;
        try {
            in = new FileInputStream(file);
            channelSftp.cd(dir);
            channelSftp.put(in, file.getName());
        } catch (SftpException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 하나의 파일을 다운로드 한다.
     *
     * @param dir
     *            저장할 경로(서버)
     * @param downloadFileName
     *            다운로드할 파일
     * @param path
     *            저장될 공간
     */
    public void download(String dir, String downloadFileName, String path) {
        InputStream in = null;
        FileOutputStream out = null;
        try {
            channelSftp.cd(dir);
            in = channelSftp.get(downloadFileName);
        } catch (SftpException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        try {
            out = new FileOutputStream(new File(path));
            int i;

            while ((i = in.read()) != -1) {
                out.write(i);
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            try {
                out.close();
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }

        }

    }
    
    /**
     * makeFolder
     * @param dir
     */
    public void makeFolder(String dir) {
        //try {
            /*
            String currentDirectory=channelSftp.pwd();
            System.out.println("currentDriectory" + currentDirectory);
            SftpATTRS attrs=null;
            try {
                attrs = channelSftp.stat(dir);
            } catch (Exception e) {
                System.out.println(dir+" not found");
            }
            
            if (attrs != null) {
                System.out.println("Directory exists IsDir="+attrs.isDir());
            } else {
                System.out.println("Creating dir "+dir);
                channelSftp.mkdir(dir);
            }
        } catch (SftpException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        */
        
        // 폴더 생성;
        String[] pathArray = split(dir,"/");
        for(int i = 0; i < pathArray.length; i ++) {
           try{
               if(dir.length() != 0){
                   channelSftp.cd("/");
                   channelSftp.mkdir(pathArray[i]);  //폴더 생성..
                   channelSftp.cd(pathArray[i]);
               }
            } catch(Exception e)  {
                try {
                    channelSftp.cd(pathArray[i]);
                } catch (SftpException e1) {
                    // TODO Auto-generated catch block
                    e1.printStackTrace();
                }
            }    
        }
    }
    
   

    /**
     * 서버와의 연결을 끊는다.
     */
    public void disconnection() {
        channelSftp.quit();

    }
    
    
    public static String[] split(String s, String s1) {
        StringTokenizer stringtokenizer = new StringTokenizer(s, s1);
        int i = stringtokenizer.countTokens();
        String as[] = new String[i];
        for (int j = 0; j < i; j++) {
                as[j] = stringtokenizer.nextToken();
        }
        return as;
    }
    
    public static void main(String args[]) {
        String host = "14.63.170.148"; //admin server ip
        int port = 2122;
        String userName = "company";
        String password = "namu1234";
        String dir = "/Users/we/Documents/images/btn.png"; //접근할 폴더가 위치할 경로
        
        SftpUtil util = new SftpUtil();
        util.init(host, userName, password, port);
        String saveDir="/home/company/www/intro/uploadfiles" ;//ex. "f:\\test3.txt"
        
        util.upload(saveDir, new File(dir));
        util.disconnection();
        System.exit(0);
    }
    
    

    public boolean sendSFtp(String server, String userid, String password, String filepath, String filename, String path
        ) throws JSchException, SftpException, IOException {
    FileInputStream in = null;
     try {
         
         JSch jsch = new JSch();
         session = jsch.getSession(userid,server,22);
         session.setPassword(password);
         
         java.util.Properties config = new java.util.Properties();
         config.put("StrictHostKeyChecking", "no");
         session.setConfig(config);
         session.connect();

         channel = session.openChannel("sftp");
         channel.connect();
         
         channelSftp = (ChannelSftp) channel;
         File file_in = new File(filepath+filename);
  
           // 폴더 생성;
           String[] pathArray = split(path,"/");
           
           for(int i = 0; i < pathArray.length; i ++) {

              try{
                  if(path.length() != 0){
                      channelSftp.mkdir(pathArray[i]);  //폴더 생성..

                      channelSftp.cd(pathArray[i]);
                  }
                  
               }catch(Exception e)  {
                   channelSftp.cd(pathArray[i]);
                  
               }    
           }

           in = new FileInputStream(file_in);
           channelSftp.put(in, file_in.getName());  //업로드
           in.close();
           channelSftp.quit();

        } catch (SftpException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } 
        return true;
    }
}
