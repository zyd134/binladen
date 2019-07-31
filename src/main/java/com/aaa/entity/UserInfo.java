package com.aaa.entity;

public class UserInfo {
    private int userid;
    private String userno;
    private String username;
    private String telphone;
    private String address;
    private String pwd;

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public UserInfo() {
    }

    public UserInfo(String userno, String username, String telphone, String address) {
        this.userno = userno;
        this.username = username;
        this.telphone = telphone;
        this.address = address;
    }

    public UserInfo(int userid, String userno, String username, String telphone, String address) {
        this.userid = userid;
        this.userno = userno;
        this.username = username;
        this.telphone = telphone;
        this.address = address;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUserno() {
        return userno;
    }

    public void setUserno(String userno) {
        this.userno = userno;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
