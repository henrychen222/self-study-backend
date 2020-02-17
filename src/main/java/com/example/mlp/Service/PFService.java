package com.example.mlp.Service;

import com.example.mlp.Dao.PFDao;
import com.example.mlp.Model.PF;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PFService {

    @Autowired
    private PFDao pfDao;


    public List<PF> retrieveAllPFAttrPlans() {
        return pfDao.retrieveAllPlansOperation();
    }
}
