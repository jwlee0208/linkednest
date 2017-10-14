package net.linkednest.www.common.dto;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("common.codeDto")
public class CodeDto {
    private int codeId;
    private String codeName;
    private String codeValue;
    private String codeType;
    private Timestamp createDate;
    public int getCodeId() {
        return codeId;
    }
    public void setCodeId(int codeId) {
        this.codeId = codeId;
    }
    public String getCodeName() {
        return codeName;
    }
    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }
    public String getCodeValue() {
        return codeValue;
    }
    public void setCodeValue(String codeValue) {
        this.codeValue = codeValue;
    }
    public String getCodeType() {
        return codeType;
    }
    public void setCodeType(String codeType) {
        this.codeType = codeType;
    }
    public Timestamp getCreateDate() {
        return createDate;
    }
    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }
    @Override
    public String toString() {
        return "CodeDto [codeId=" + codeId + ", codeName=" + codeName
                + ", codeValue=" + codeValue + ", codeType=" + codeType + "]";
    }
    
    
}
