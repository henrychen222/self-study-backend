package com.example.mlp.Model;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import java.sql.Blob;
import java.util.Date;
import java.util.UUID;


public class PF {

    // private UUID attr_guid;
    // private String attr_guid;

    private String attr_season;
    private String attr_hier;
    private Date update_date;

    // private String attr_plan_doc;
    // private Blob attr_plan_doc;
    // private JsonObject attr_plan_doc;
    private Object attr_plan_doc;


//    public String getAttr_guid() {
//        return attr_guid;
//    }
//
//    public void setAttr_guid(String attr_guid) {
//        this.attr_guid = attr_guid;
//    }

    public String getAttr_season() {
        return attr_season;
    }

    public void setAttr_season(String attr_season) {
        this.attr_season = attr_season;
    }

    public String getAttr_hier() {
        return attr_hier;
    }

    public void setAttr_hier(String attr_hier) {
        this.attr_hier = attr_hier;
    }

    public Date getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(Date update_date) {
        this.update_date = update_date;
    }

    public Object getAttr_plan_doc() {
        return attr_plan_doc;
    }

    public void setAttr_plan_doc(Object attr_plan_doc) {
        this.attr_plan_doc = attr_plan_doc;
    }

}
