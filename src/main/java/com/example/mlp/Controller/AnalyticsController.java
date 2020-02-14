package com.example.mlp.Controller;

import com.example.mlp.Model.Analytics;
import com.example.mlp.Service.AnalyticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class AnalyticsController {

    @Autowired
    AnalyticsService analyticsService;

    @GetMapping("/getAllChoiceCountTargetTiers")
    public List<Analytics> getAllChoiceCountTargetTiers() {
        return analyticsService.retrieveAllChoiceCountTargetTiersOperation();
    }
}
