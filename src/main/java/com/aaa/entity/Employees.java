package com.aaa.entity;

public class Employees {
    private int id;
    private String empNo;
    private String name;
    private int sex;
    private String idCard;
    private int role;
    private int department;
    private String tel;
    private String email;
    private String address;
    private String nativePlace;
    private String national;
    private String educationBg;
    private String school;
    private String bank;
    private String password;
    private String bankAccount;
    private String roleName;

    public Employees() {
    }

    public Employees(int id, String empNo, String name) {
        this.id = id;
        this.empNo = empNo;
        this.name = name;
    }

    public Employees(int id, String empNo, String name, int sex, String idCard, int role, int department, String tel, String email, String address, String nativePlace, String national, String educationBg, String school, String bank, String password, String bankAccount) {
        this.id = id;
        this.empNo = empNo;
        this.name = name;
        this.sex = sex;
        this.idCard = idCard;
        this.role = role;
        this.department = department;
        this.tel = tel;
        this.email = email;
        this.address = address;
        this.nativePlace = nativePlace;
        this.national = national;
        this.educationBg = educationBg;
        this.school = school;
        this.bank = bank;
        this.password = password;
        this.bankAccount = bankAccount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmpNo() {
        return empNo;
    }

    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getDepartment() {
        return department;
    }

    public void setDepartment(int department) {
        this.department = department;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getNativePlace() {
        return nativePlace;
    }

    public void setNativePlace(String nativePlace) {
        this.nativePlace = nativePlace;
    }

    public String getNational() {
        return national;
    }

    public void setNational(String national) {
        this.national = national;
    }

    public String getEducationBg() {
        return educationBg;
    }

    public void setEducationBg(String educationBg) {
        this.educationBg = educationBg;
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }
}
