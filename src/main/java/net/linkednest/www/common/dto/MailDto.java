package net.linkednest.www.common.dto;

import java.util.List;
import java.util.Map;

public class MailDto {
    private String              mailFrom;
    private String              mailTo;
    private String              mailCc;
    private String              mailBcc;
    private List<String>        addressTo;
    private List<String>        addressCc;
    private List<String>        addressBcc;
    private String              mailSubject;
    private String              mailContent;
    private String              templateName;
    private String              contentType;
    private String              attachPath;
    private String              attachName;
    private Map<String, Object> model;
    
    public MailDto(){
        contentType = "text/html; charset=utf-8";
    }

    public String getMailFrom() {
        return mailFrom;
    }

    public void setMailFrom(String mailFrom) {
        this.mailFrom = mailFrom;
    }

    public String getMailTo() {
        return mailTo;
    }

    public void setMailTo(String mailTo) {
        this.mailTo = mailTo;
    }

    public String getMailCc() {
        return mailCc;
    }

    public void setMailCc(String mailCc) {
        this.mailCc = mailCc;
    }

    public String getMailBcc() {
        return mailBcc;
    }

    public void setMailBcc(String mailBcc) {
        this.mailBcc = mailBcc;
    }

    public List<String> getAddressTo() {
        return addressTo;
    }

    public void setAddressTo(List<String> addressTo) {
        this.addressTo = addressTo;
    }

    public List<String> getAddressCc() {
        return addressCc;
    }

    public void setAddressCc(List<String> addressCc) {
        this.addressCc = addressCc;
    }

    public List<String> getAddressBcc() {
        return addressBcc;
    }

    public void setAddressBcc(List<String> addressBcc) {
        this.addressBcc = addressBcc;
    }

    public String getMailSubject() {
        return mailSubject;
    }

    public void setMailSubject(String mailSubject) {
        this.mailSubject = mailSubject;
    }

    public String getMailContent() {
        return mailContent;
    }

    public void setMailContent(String mailContent) {
        this.mailContent = mailContent;
    }

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public String getAttachPath() {
        return attachPath;
    }

    public void setAttachPath(String attachPath) {
        this.attachPath = attachPath;
    }

    public String getAttachName() {
        return attachName;
    }

    public void setAttachName(String attachName) {
        this.attachName = attachName;
    }

    public Map<String, Object> getModel() {
        return model;
    }

    public void setModel(Map<String, Object> model) {
        this.model = model;
    }

    @Override
    public String toString() {
        return "MailDto [mailFrom=" + mailFrom + ", mailTo=" + mailTo
                + ", mailCc=" + mailCc + ", mailBcc=" + mailBcc
                + ", addressTo=" + addressTo + ", addressCc=" + addressCc
                + ", addressBcc=" + addressBcc + ", mailSubject=" + mailSubject
                + ", mailContent=" + mailContent + ", templateName="
                + templateName + ", contentType=" + contentType
                + ", attachPath=" + attachPath + ", attachName=" + attachName
                + "]";
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result
                + ((addressBcc == null) ? 0 : addressBcc.hashCode());
        result = prime * result
                + ((addressCc == null) ? 0 : addressCc.hashCode());
        result = prime * result
                + ((addressTo == null) ? 0 : addressTo.hashCode());
        result = prime * result
                + ((attachName == null) ? 0 : attachName.hashCode());
        result = prime * result
                + ((attachPath == null) ? 0 : attachPath.hashCode());
        result = prime * result
                + ((contentType == null) ? 0 : contentType.hashCode());
        result = prime * result + ((mailBcc == null) ? 0 : mailBcc.hashCode());
        result = prime * result + ((mailCc == null) ? 0 : mailCc.hashCode());
        result = prime * result
                + ((mailContent == null) ? 0 : mailContent.hashCode());
        result = prime * result
                + ((mailFrom == null) ? 0 : mailFrom.hashCode());
        result = prime * result
                + ((mailSubject == null) ? 0 : mailSubject.hashCode());
        result = prime * result + ((mailTo == null) ? 0 : mailTo.hashCode());
        result = prime * result
                + ((templateName == null) ? 0 : templateName.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        MailDto other = (MailDto) obj;
        if (addressBcc == null) {
            if (other.addressBcc != null)
                return false;
        } else if (!addressBcc.equals(other.addressBcc))
            return false;
        if (addressCc == null) {
            if (other.addressCc != null)
                return false;
        } else if (!addressCc.equals(other.addressCc))
            return false;
        if (addressTo == null) {
            if (other.addressTo != null)
                return false;
        } else if (!addressTo.equals(other.addressTo))
            return false;
        if (attachName == null) {
            if (other.attachName != null)
                return false;
        } else if (!attachName.equals(other.attachName))
            return false;
        if (attachPath == null) {
            if (other.attachPath != null)
                return false;
        } else if (!attachPath.equals(other.attachPath))
            return false;
        if (contentType == null) {
            if (other.contentType != null)
                return false;
        } else if (!contentType.equals(other.contentType))
            return false;
        if (mailBcc == null) {
            if (other.mailBcc != null)
                return false;
        } else if (!mailBcc.equals(other.mailBcc))
            return false;
        if (mailCc == null) {
            if (other.mailCc != null)
                return false;
        } else if (!mailCc.equals(other.mailCc))
            return false;
        if (mailContent == null) {
            if (other.mailContent != null)
                return false;
        } else if (!mailContent.equals(other.mailContent))
            return false;
        if (mailFrom == null) {
            if (other.mailFrom != null)
                return false;
        } else if (!mailFrom.equals(other.mailFrom))
            return false;
        if (mailSubject == null) {
            if (other.mailSubject != null)
                return false;
        } else if (!mailSubject.equals(other.mailSubject))
            return false;
        if (mailTo == null) {
            if (other.mailTo != null)
                return false;
        } else if (!mailTo.equals(other.mailTo))
            return false;
        if (templateName == null) {
            if (other.templateName != null)
                return false;
        } else if (!templateName.equals(other.templateName))
            return false;
        return true;
    }
    
}
