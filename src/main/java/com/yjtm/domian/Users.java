package com.yjtm.domian;

import java.util.Date;

import org.springframework.stereotype.Repository;
@Repository 
public class Users {
    private Integer id;

    private String pic;

    private String ext;

    private String forms;

    private String sex;

    private String wxName;

    private String opid;

    private String address;

    private Date cdate;

    private String mechanismId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic == null ? null : pic.trim();
    }

    public String getExt() {
        return ext;
    }

    public void setExt(String ext) {
        this.ext = ext == null ? null : ext.trim();
    }

    public String getForms() {
        return forms;
    }

    public void setForms(String forms) {
        this.forms = forms == null ? null : forms.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    public String getWxName() {
        return wxName;
    }

    public void setWxName(String wxName) {
        this.wxName = wxName == null ? null : wxName.trim();
    }

    public String getOpid() {
        return opid;
    }

    public void setOpid(String opid) {
        this.opid = opid == null ? null : opid.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Date getCdate() {
        return cdate;
    }

    public void setCdate(Date cdate) {
        this.cdate = cdate;
    }

    public String getMechanismId() {
        return mechanismId;
    }

    public void setMechanismId(String mechanismId) {
        this.mechanismId = mechanismId == null ? null : mechanismId.trim();
    }
}