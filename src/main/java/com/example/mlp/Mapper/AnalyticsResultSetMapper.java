package com.example.mlp.Mapper;

import com.example.mlp.Model.AnalyticsResultSet;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AnalyticsResultSetMapper implements RowMapper<AnalyticsResultSet> {

    @Override
    public AnalyticsResultSet mapRow(ResultSet rs, int rowNum) throws SQLException {
        AnalyticsResultSet analyticsResultSet = new AnalyticsResultSet();

        analyticsResultSet.setSc_nbr(rs.getString("sc_nbr"));
        analyticsResultSet.setTier(rs.getString("tier"));
        analyticsResultSet.setAg(rs.getString("ag"));
        analyticsResultSet.setQtr(rs.getString("qtr"));
        analyticsResultSet.setSeason(rs.getString("season"));
        analyticsResultSet.setSum(rs.getString("sum"));

        return analyticsResultSet;
    }
}
