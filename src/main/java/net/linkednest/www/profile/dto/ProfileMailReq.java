package net.linkednest.www.profile.dto;

import org.apache.ibatis.type.Alias;

/**
 * Created by jwlee0208 on 2017. 10. 7..
 */
@Alias("profile.profileMailReq")
public class ProfileMailReq {

    private String mailTo;

    private String message;

    public String getMailTo() {
        return mailTo;
    }

    public void setMailTo(String mailTo) {
        this.mailTo = mailTo;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
