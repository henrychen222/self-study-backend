package com.example.mlp.Dao;

import com.example.mlp.Mapper.VdsMapper;
import com.example.mlp.Model.Vds;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VdsDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Vds> retrieveAllVendorDetailsOperation() {
        String query = "SELECT * FROM vendor.VENDORDETAILS";
        List<Vds> result = jdbcTemplate.query(query, new VdsMapper());
        return result;
    }
}
