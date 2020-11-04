package com.karl.entity;

public class Major {

    private Integer mid;

    private String mname;

    private Integer credit;


    private Integer lifeyear;


    private String introduction;


    private Integer cid;


    public Major(Integer mid, String mname, Integer credit, Integer lifeyear, String introduction, Integer cid) {
        this.mid = mid;
        this.mname = mname;
        this.credit = credit;
        this.lifeyear = lifeyear;
        this.introduction = introduction;
        this.cid = cid;
    }

    public Major() {
        super();
    }


    public Integer getMid() {
        return mid;
    }


    public void setMid(Integer mid) {
        this.mid = mid;
    }


    public String getMname() {
        return mname;
    }


    public void setMname(String mname) {
        this.mname = mname == null ? null : mname.trim();
    }


    public Integer getCredit() {
        return credit;
    }



    public void setCredit(Integer credit) {
        this.credit = credit;
    }


    public Integer getLifeyear() {
        return lifeyear;
    }


    public void setLifeyear(Integer lifeyear) {
        this.lifeyear = lifeyear;
    }


    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }


    public Integer getCid() {
        return cid;
    }


    public void setCid(Integer cid) {
        this.cid = cid;
    }

    @Override
    public String toString() {
        return "Major{" +
                "mid=" + mid +
                ", mname='" + mname + '\'' +
                ", credit=" + credit +
                ", lifeyear=" + lifeyear +
                ", introduction='" + introduction + '\'' +
                ", cid=" + cid +
                '}';
    }
}