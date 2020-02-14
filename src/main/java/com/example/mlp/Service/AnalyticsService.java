package com.example.mlp.Service;

import com.example.mlp.Dao.AnalyticsDao;
import com.example.mlp.Model.Analytics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class AnalyticsService {

    @Autowired
    private AnalyticsDao analyticsDao;

    public List<Analytics> retrieveAllChoiceCountTargetTiersService() {
        return analyticsDao.retrieveAllChoiceCountTargetTiersOperation();
    }

    public List<Map<String, String>> getChoiceCountTargetsPercentageBySubclassService(String subclass) {
        return analyticsDao.retrieveChoiceCountTargetsPercentageBySubclassOperation(subclass);
    }

    public List<Map<String, String>> getChoiceCountTargetsBySubclassService(String subclass) {
        return analyticsDao.retrieveChoiceCountTargetsBySubclassOperation(subclass);
    }



}
