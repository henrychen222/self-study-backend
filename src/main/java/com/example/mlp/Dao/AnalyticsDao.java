package com.example.mlp.Dao;

import com.example.mlp.Mapper.AnalyticsMapper;
import com.example.mlp.Model.Analytics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnalyticsDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Analytics> retrieveAllChoiceCountTargetTiersOperation() {
//        JdbcTemplate jdbcTemplate = new JdbcTemplate();  // No DataSource Set
        String query = "SELECT * FROM mlp_analytics.choice_count_targets_tier";
        List<Analytics> result = jdbcTemplate.query(query, new AnalyticsMapper());
        return result;
    }
}
