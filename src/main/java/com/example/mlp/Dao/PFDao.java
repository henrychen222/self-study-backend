package com.example.mlp.Dao;

import com.example.mlp.Mapper.PFMapper;
import com.example.mlp.Model.PF;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PFDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<PF> retrieveAllPlansOperation() {
        String query = "SELECT * FROM mlpdocs.plan_framework_attr_doc";
        List<PF> result = jdbcTemplate.query(query, new PFMapper());
        System.out.println(result);
        return result;
    }
}
