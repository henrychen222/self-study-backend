package com.example.mlp.Service;

import java.util.List;

import com.example.mlp.Dao.VdsDao;
import com.example.mlp.Model.Vds;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class VdsService {

    @Autowired
    private VdsDao vdsDao;

    public List<Vds> retrieveAllVendorDetails() {
        return vdsDao.retrieveAllVendorDetailsOperation();
    }
}
