package com.example.mlp.Mapper;

import com.example.mlp.Model.PF;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Blob;

public class PFMapper implements RowMapper<PF> {

    @Autowired
    Gson gson;

    @Override
    public PF mapRow(ResultSet rs, int rowNum) throws SQLException {
        PF pf = new PF();

//        pf.setAttr_guid(rs.getString("attr_id"));
        pf.setAttr_season(rs.getString("attr_season"));
        pf.setAttr_hier(rs.getString("attr_hier"));
        pf.setUpdate_date(rs.getDate("update_date"));

//        String data = rs.getBlob("attr_plan_doc").toString();
//        gson.toJson(data, String.class);

        Object data = rs.getObject("attr_plan_doc");
        pf.setAttr_plan_doc(data);

        return pf;
    }
}
