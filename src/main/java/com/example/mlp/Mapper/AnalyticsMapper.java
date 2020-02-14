package com.example.mlp.Mapper;

import com.example.mlp.Model.Analytics;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AnalyticsMapper implements RowMapper<Analytics> {

    @Override
    public Analytics mapRow(ResultSet rs, int rowNum) throws SQLException {
        Analytics analytics = new Analytics();

        analytics.setGrp_nbr(rs.getString("grp_nbr"));
        analytics.setDept_nbr(rs.getString("dept_nbr"));
        analytics.setClass_nbr(rs.getString("class_nbr"));
        analytics.setSubclass_nbr(rs.getString("subclass_nbr"));
        analytics.setSc_nbr(rs.getString("sc_nbr"));
        analytics.setDept_name(rs.getString("dept_name"));
        analytics.setClass_name(rs.getString("class_name"));
        analytics.setSubclass_name(rs.getString("subclass_name"));
        analytics.setFq(rs.getString("fq"));
        analytics.setMth(rs.getString("mth"));
        analytics.setMth_name(rs.getString("mth_name"));
        analytics.setTier(rs.getString("tier"));
        analytics.setAg(rs.getString("ag"));
        analytics.setCc_target(rs.getInt("cc_target"));

        return analytics;
    }
}