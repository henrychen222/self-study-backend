package com.example.mlp.Controller;

import com.example.mlp.Model.PF;
import com.example.mlp.Service.PFService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class PFController {

    @Autowired
    PFService pfService;

    @GetMapping("/getAllPFAttrPlans")
    public List<PF> getAllPFAttrPlans() {
        return pfService.retrieveAllPFAttrPlans();
    }

}
