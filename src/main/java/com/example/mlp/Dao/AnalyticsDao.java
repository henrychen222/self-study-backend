package com.example.mlp.Dao;

import com.example.mlp.Mapper.AnalyticsMapper;
import com.example.mlp.Mapper.AnalyticsResultSetMapper;
import com.example.mlp.Model.Analytics;
import com.example.mlp.Model.RequiredData;
import com.example.mlp.Model.AnalyticsResultSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AnalyticsDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Analytics> retrieveAllChoiceCountTargetTiersOperation() {
        // JdbcTemplate jdbcTemplate = new JdbcTemplate(); // No DataSource Set
        String query = "SELECT * FROM mlp_analytics.choice_count_targets_tier";
        List<Analytics> result = jdbcTemplate.query(query, new AnalyticsMapper());
        return result;
    }

    public List<Map<String, String>> retrieveChoiceCountTargetsPercentageBySubclassOperation(String subclass) {
        RequiredData requiredData = getRequiredData(subclass);

        List<Map<String, String>> arrPercentage = new ArrayList<>();

        Map<String, String> buildDataPercentage = new HashMap<>();

        buildDataPercentage.put("pgA1", calculation(requiredData.getA1(), requiredData.getTotalA()));
        buildDataPercentage.put("pgA2", calculation(requiredData.getA2(), requiredData.getTotalA()));
        buildDataPercentage.put("pgA3", calculation(requiredData.getA3(), requiredData.getTotalA()));
        buildDataPercentage.put("pgA4", calculation(requiredData.getA4(), requiredData.getTotalA()));

        buildDataPercentage.put("pgB1", calculation(requiredData.getB1(), requiredData.getTotalB()));
        buildDataPercentage.put("pgB2", calculation(requiredData.getB2(), requiredData.getTotalB()));
        buildDataPercentage.put("pgB3", calculation(requiredData.getB3(), requiredData.getTotalB()));
        buildDataPercentage.put("pgB4", calculation(requiredData.getB4(), requiredData.getTotalB()));

        buildDataPercentage.put("pgC1", calculation(requiredData.getA1(), requiredData.getTotalC()));
        buildDataPercentage.put("pgC2", calculation(requiredData.getA2(), requiredData.getTotalC()));
        buildDataPercentage.put("pgC3", calculation(requiredData.getA3(), requiredData.getTotalC()));
        buildDataPercentage.put("pgC4", calculation(requiredData.getA4(), requiredData.getTotalC()));

        buildDataPercentage.put("pgD1", calculation(requiredData.getA1(), requiredData.getTotalD()));
        buildDataPercentage.put("pgD2", calculation(requiredData.getA2(), requiredData.getTotalD()));
        buildDataPercentage.put("pgD3", calculation(requiredData.getA3(), requiredData.getTotalD()));
        buildDataPercentage.put("pgD4", calculation(requiredData.getA4(), requiredData.getTotalD()));

        arrPercentage.add(buildDataPercentage);
        return arrPercentage;
    }

    public List<Map<String, String>> retrieveChoiceCountTargetsBySubclassOperation(String subclass) {
        RequiredData requiredData = getRequiredData(subclass);

        List<Map<String, String>> arrCount = new ArrayList<>();

        Map<String, String> buildDataCount = new HashMap<>();
        buildDataCount.put("pgA1", requiredData.getA1());
        buildDataCount.put("pgA2", requiredData.getA2());
        buildDataCount.put("pgA3", requiredData.getA3());
        buildDataCount.put("pgA4", requiredData.getA4());
        buildDataCount.put("pgB1", requiredData.getB1());
        buildDataCount.put("pgB2", requiredData.getB2());
        buildDataCount.put("pgB3", requiredData.getB3());
        buildDataCount.put("pgB4", requiredData.getB4());
        buildDataCount.put("pgC1", requiredData.getC1());
        buildDataCount.put("pgC2", requiredData.getC2());
        buildDataCount.put("pgC3", requiredData.getC3());
        buildDataCount.put("pgC4", requiredData.getC4());
        buildDataCount.put("pgD1", requiredData.getD1());
        buildDataCount.put("pgD2", requiredData.getD2());
        buildDataCount.put("pgD3", requiredData.getD3());
        buildDataCount.put("pgD4", requiredData.getD4());

        arrCount.add(buildDataCount);
        return arrCount;
    }

    public RequiredData getRequiredData(String subclass) {
        // const sub = '030500100125';
        String sub = subclass;
        // String query = "SELECT sc_nbr,\n" +
        // " tier,\n" +
        // " ag,\n" +
        // " CASE\n" +
        // " WHEN substring(mth, 5, 2) IN ('01', '02', '03') THEN\n" +
        // " substring(mth, 1, 4) || '01'\n" +
        // " WHEN substring(mth, 5, 2) IN ('04', '05', '06') THEN\n" +
        // " substring(mth, 1, 4) || '02'\n" +
        // " WHEN substring(mth, 5, 2) IN ('07', '08', '09') THEN\n" +
        // " substring(mth, 1, 4) || '03'\n" +
        // " WHEN substring(mth, 5, 2) IN ('10', '11', '12') THEN\n" +
        // " substring(mth, 1, 4) || '04'\n" +
        // " ELSE\n" +
        // " '999999'\n" +
        // " END qtr,\n" +
        // " CASE\n" +
        // " WHEN substring(mth, 5, 2) IN ('01', '02', '03', '04', '05', '06') THEN\n" +
        // " substring(mth, 1, 4) || '01'\n" +
        // " WHEN substring(mth, 5, 2) IN ('07', '08', '09', '10', '11', '12') THEN\n" +
        // " substring(mth, 1, 4) || '02'\n" +
        // " ELSE\n" +
        // " '999999'\n" +
        // " END season,\n" +
        // " SUM(cc_target)\n" +
        // "FROM mlp_analytics.choice_count_targets_tier\n" +
        // "WHERE sc_nbr =" + sub + "\n" +
        // "GROUP BY ROLLUP (sc_nbr, tier, ag, qtr, season)\n" +
        // "ORDER BY sc_nbr, tier, ag, qtr, season;";

        String query = "SELECT sc_nbr,\n" + "       tier,\n" + "       ag,\n" + "       CASE\n"
                + "           WHEN substring(mth, 5, 2) IN ('01', '02', '03') THEN\n"
                + "               substring(mth, 1, 4) || '01'\n"
                + "           WHEN substring(mth, 5, 2) IN ('04', '05', '06') THEN\n"
                + "               substring(mth, 1, 4) || '02'\n"
                + "           WHEN substring(mth, 5, 2) IN ('07', '08', '09') THEN\n"
                + "               substring(mth, 1, 4) || '03'\n"
                + "           WHEN substring(mth, 5, 2) IN ('10', '11', '12') THEN\n"
                + "               substring(mth, 1, 4) || '04'\n" + "           ELSE\n" + "               '999999'\n"
                + "           END qtr,\n" + "       CASE\n"
                + "           WHEN substring(mth, 5, 2) IN ('01', '02', '03', '04', '05', '06') THEN\n"
                + "               substring(mth, 1, 4) || '01'\n"
                + "           WHEN substring(mth, 5, 2) IN ('07', '08', '09', '10', '11', '12') THEN\n"
                + "               substring(mth, 1, 4) || '02'\n" + "           ELSE\n" + "               '999999'\n"
                + "           END season,\n" + "       SUM(cc_target)\n"
                + "FROM mlp_analytics.choice_count_targets_tier\n" + "WHERE sc_nbr = '030500100125'\n"
                + "GROUP BY ROLLUP (sc_nbr, tier, ag, qtr, season)\n" + "ORDER BY sc_nbr, tier, ag, qtr, season;";

        System.out.println(query);
        List<AnalyticsResultSet> sqlResult = jdbcTemplate.query(query, new AnalyticsResultSetMapper());

        RequiredData requiredData = processData(sqlResult);
        return requiredData;
    }

    public RequiredData processData(List<AnalyticsResultSet> sqlResult) {
        String totalA = "", A1 = "", A2 = "", A3 = "", A4 = "";
        String totalB = "", B1 = "", B2 = "", B3 = "", B4 = "";
        String totalC = "", C1 = "", C2 = "", C3 = "", C4 = "";
        String totalD = "", D1 = "", D2 = "", D3 = "", D4 = "";

        try {

            for (AnalyticsResultSet i : sqlResult) {
                System.out.println(i);
                if (i.getQtr() == null && i.getSeason() == null) {
                    // get totalAvg
                    if (i.getAg() == null) {
                        if (i.getTier().equals("A")) {
                            totalA = i.getSum();
                        }
                        if (i.getTier().equals("B")) {
                            totalB = i.getSum();
                        }
                        if (i.getTier().equals("C")) {
                            totalC = i.getSum();
                        }
                        if (i.getTier().equals("D")) {
                            totalD = i.getSum();
                        }
                    }

                    // get A
                    if (i.getTier().equals("A")) {
                        if (i.getAg().equals("1")) {
                            A1 = i.getSum();
                        }
                        if (i.getAg().equals("2")) {
                            A2 = i.getSum();
                        }
                        if (i.getAg().equals("3")) {
                            A3 = i.getSum();
                        }
                        if (i.getAg().equals("4")) {
                            A4 = i.getSum();
                            // System.out.println("A4 is" + A4);
                        }
                    }

                    // get B
                    if (i.getTier().equals("B")) {
                        if (i.getAg().equals("1")) {
                            B1 = i.getSum();
                            // System.out.println("B1 is" + B1);
                        }
                        if (i.getAg().equals("2")) {
                            B2 = i.getSum();
                        }
                        if (i.getAg().equals("3")) {
                            B3 = i.getSum();
                        }
                        if (i.getAg().equals("4")) {
                            B4 = i.getSum();
                        }
                    }

                    // get C
                    if (i.getTier().equals("C")) {
                        if (i.getAg().equals("1")) {
                            C1 = i.getSum();
                        }
                        if (i.getAg().equals("2")) {
                            C2 = i.getSum();
                        }
                        if (i.getAg().equals("3")) {
                            C3 = i.getSum();
                        }
                        if (i.getAg().equals("4")) {
                            C4 = i.getSum();
                        }
                    }

                    // get D
                    if (i.getTier().equals("D")) {
                        if (i.getAg().equals("1")) {
                            D1 = i.getSum();
                        }
                        if (i.getAg().equals("2")) {
                            D2 = i.getSum();
                        }
                        if (i.getAg().equals("3")) {
                            D3 = i.getSum();
                        }
                        if (i.getAg().equals("4")) {
                            D4 = i.getSum();
                        }
                    }

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("totalA: " + totalA);
        System.out.println("totalB: " + totalB);
        System.out.println("totalC: " + totalC);
        System.out.println("totalD: " + totalD);
        System.out.println("A1: " + A1);
        System.out.println("A2: " + A2);
        System.out.println("A3: " + A3);
        System.out.println("A4: " + A4);
        System.out.println("B1: " + B1);
        System.out.println("B2: " + B2);
        System.out.println("B3: " + B3);
        System.out.println("B4: " + B4);
        System.out.println("C1: " + C1);
        System.out.println("C2: " + C2);
        System.out.println("C3: " + C3);
        System.out.println("C4: " + C4);
        System.out.println("D1: " + D1);
        System.out.println("D2: " + D2);
        System.out.println("D3: " + D3);
        System.out.println("D4: " + D4);

        RequiredData requiredData = new RequiredData();

        requiredData.setTotalA(totalA);
        requiredData.setTotalB(totalB);
        requiredData.setTotalC(totalC);
        requiredData.setTotalD(totalD);

        requiredData.setA1(A1);
        requiredData.setA2(A2);
        requiredData.setA3(A3);
        requiredData.setA4(A4);

        requiredData.setB1(B1);
        requiredData.setB2(B2);
        requiredData.setB3(B3);
        requiredData.setB4(B4);

        requiredData.setC1(C1);
        requiredData.setC2(C2);
        requiredData.setC3(C3);
        requiredData.setC4(C4);

        requiredData.setD1(D1);
        requiredData.setD2(D2);
        requiredData.setD3(D3);
        requiredData.setD4(D4);

        return requiredData;
    }

    public String calculation(String property, String total) {
        int digit = Integer.parseInt(property) / Integer.parseInt(total) * 100;
        return Math.round(digit) + "%";
    }

}
