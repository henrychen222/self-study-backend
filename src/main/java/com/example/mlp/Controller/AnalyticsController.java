package com.example.mlp.Controller;

import com.example.mlp.Model.Analytics;
import com.example.mlp.Service.AnalyticsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class AnalyticsController {

    @Autowired
    AnalyticsService analyticsService;

    @GetMapping("/getAllChoiceCountTargetTiers")
    public List<Analytics> getAllChoiceCountTargetTiers() {
        return analyticsService.retrieveAllChoiceCountTargetTiersService();
    }

    @GetMapping("/getChoiceCountTargetsPercentageBySubclass")
    public List<Map<String, String>> getChoiceCountTargetsPercentageBySubclass(@RequestParam String subclass) {
        return analyticsService.getChoiceCountTargetsPercentageBySubclassService(subclass);
    }

    @GetMapping("/getChoiceCountTargetsBySubclass")
    public List<Map<String, String>> getChoiceCountTargetsBySubclass(@RequestParam String subclass) {
        return analyticsService.getChoiceCountTargetsBySubclassService(subclass);
    }


}
