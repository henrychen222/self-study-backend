package com.example.mlp.Controller;

import java.util.List;

import com.example.mlp.Model.Vds;
import com.example.mlp.Service.VdsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class VdsController {

    @Autowired
    VdsService vdsService;

    @GetMapping("/getAllVendordetails")
    public List<Vds> getAllVendorDetails() {
        return vdsService.retrieveAllVendorDetails();
    }
}
