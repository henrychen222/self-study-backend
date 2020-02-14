package com.example.mlp.Model;

public class AnalyticsResultSet {
    private String sc_nbr;
    private String tier;
    private String ag;
    private String qtr;
    private String season;
    private String sum;

    public String getSc_nbr() {
        return sc_nbr;
    }

    public void setSc_nbr(String sc_nbr) {
        this.sc_nbr = sc_nbr;
    }

    public String getTier() {
        return tier;
    }

    public void setTier(String tier) {
        this.tier = tier;
    }

    public String getAg() {
        return ag;
    }

    public void setAg(String ag) {
        this.ag = ag;
    }

    public String getQtr() {
        return qtr;
    }

    public void setQtr(String qtr) {
        this.qtr = qtr;
    }

    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season;
    }

    public String getSum() {
        return sum;
    }

    public void setSum(String sum) {
        this.sum = sum;
    }
}
