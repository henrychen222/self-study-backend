package com.example.mlp.Service;

import com.example.mlp.Dao.AnalyticsDao;
import com.example.mlp.Model.Analytics;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class AnalyticsService {

    @Autowired
    private AnalyticsDao analyticsDao;

    public List<Analytics> retrieveAllChoiceCountTargetTiersOperation() {
        return analyticsDao.retrieveAllChoiceCountTargetTiersOperation();
    }

}
