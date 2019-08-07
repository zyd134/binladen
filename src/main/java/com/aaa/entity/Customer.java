package com.aaa.entity;

public class Customer {
    private int id;
    private String customerNo;
    private String customerName;
    private String contacts;
    private String tel;
    private String address;
    private String email;
    private String bank;
    private String bankAccount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerNo() {
        return customerNo;
    }

    public void setCustomerNo(String customerNo) {
        this.customerNo = customerNo;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getBankAccount() {
        return bankAccount;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount;
    }
    public Customer(int id, String customerNo,String customerName, String contacts, String tel, String address, String email, String bank, String bankAccount) {
        this.id = id;
        this.customerNo = customerNo;
        this.customerName= customerName;
        this.contacts = contacts;
        this.tel = tel;
        this.address = address;
        this.email = email;
        this.bank = bank;
        this.bankAccount = bankAccount;
    }

    public Customer() {
        super();
    }

    @Override
    public String toString() {
        return "customer{" +
                "id=" + id +
                ", customerNo='" + customerNo + '\'' +
                ", contacts='" + contacts + '\'' +
                ", tel='" + tel + '\'' +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", bank='" + bank + '\'' +
                ", bankAccount='" + bankAccount + '\'' +
                '}';
    }
}
