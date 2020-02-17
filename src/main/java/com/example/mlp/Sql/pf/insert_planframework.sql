SELECT *
FROM mlpdocs.plan_framework_attr_doc;

DELETE
FROM mlpdocs.plan_framework_attr_doc;

INSERT INTO mlpdocs.plan_framework_attr_doc (attr_guid, attr_season, attr_hier, update_date, attr_plan_doc)
VALUES ('de49d7d8-1a87-4cd9-a281-bbda11fce1d2', 'henry', 'henry', '2019-12-16 14:34:36.903954', '{
  "attr_guid": "27ad8c72-daed-896a-c3d7-176129bbbfe8",
  "attr_lvl": "SUBCLASS",
  "attr_hier": "SUB29030500450100",
  "attr_name": "VENDOR",
  "attr_value": "Crocs",
  "season": "S20201",
  "version": "Pre-Market",
  "gmd": "D",
  "metrics": [
    {
      "time_id": "S20201",
      "time_nm": "SPR 2020",
      "measures": {
        "attr_rec_unt": 50000,
        "attr_rec_rtl": 2000000,
        "attr_sls_unt": 49999,
        "attr_sku_cnt": 25
      }
    }
  ],
  "comments": [
    {
      "said_guid": "dfdfsd64654sdf5",
      "said_type": "attr_value",
      "said_when": "12/4/2019 3:22:59 PM",
      "said_who": "vimyha",
      "said_what": "Can we get a better deal on these shoes?"
    },
    {
      "said_guid": "dfdfsd643423333",
      "said_type": "attr_value",
      "said_when": "12/4/2019 4:22:00 PM",
      "said_who": "davidberlin",
      "said_what": "These shoes are ugly and we should be declining"
    }
  ],
  "status": [
    {
      "stat_type": "attr_plan",
      "stat_value": "Submitted",
      "stat_by": "vimyha",
      "stat_time": "2019-12-16 14:34:36.903954"
    }
  ],
  "attr_grouped": false
}')
ON CONFLICT (attr_guid)
    DO NOTHING;

INSERT INTO mlpdocs.plan_framework_attr_doc(attr_guid, attr_season, attr_hier, update_date, attr_plan_doc)
values ('de49d7d8-1a87-4cd9-a281-bbda11fce1d2', 'henry_', 'henry333', '2019-12-16 14:34:36.903954', '{
  "attr_guid": "test1111111111",
  "attr_lvl": "SUBCLASS",
  "attr_hier": "SUB29030500450100",
  "attr_name": "VENDOR",
  "attr_value": "Crocs",
  "season": "S20201",
  "version": "Pre-Market",
  "gmd": "D",
  "metrics": [
    {
      "time_id": "S20201",
      "time_nm": "SPR 2020",
      "measures": {
        "attr_rec_unt": 50000,
        "attr_rec_rtl": 2000000,
        "attr_sls_unt": 49999,
        "attr_sku_cnt": 25
      }
    }
  ],
  "comments": [
    {
      "said_guid": "dfdfsd64654sdf5",
      "said_type": "attr_value",
      "said_when": "12/4/2019 3:22:59 PM",
      "said_who": "vimyha",
      "said_what": "Can we get a better deal on these shoes?"
    },
    {
      "said_guid": "dfdfsd643423333",
      "said_type": "attr_value",
      "said_when": "12/4/2019 4:22:00 PM",
      "said_who": "davidberlin",
      "said_what": "These shoes are ugly and we should be declining"
    }
  ],
  "status": [
    {
      "stat_type": "attr_plan",
      "stat_value": "Submitted",
      "stat_by": "vimyha",
      "stat_time": "2019-12-16 14:34:36.903954"
    }
  ],
  "attr_grouped": false
}')
ON CONFLICT (attr_guid)
    DO UPDATE
    SET attr_season   = EXCLUDED.attr_season,
        attr_hier     = EXCLUDED.attr_hier,
        update_date   = EXCLUDED.update_date,
        attr_plan_doc = EXCLUDED.attr_plan_doc;


-- attr-guid in attr_plan_doc is unknown until assigned by uuid column
-- update via a trigger, fe, or backend stored proc.
INSERT INTO mlpdocs.plan_framework_attr_doc (attr_guid, attr_season, attr_hier, update_date, attr_plan_doc)
VALUES (DEFAULT, 'S20201', 'SUB29030500450100', current_timestamp,
        '{
          "attr_guid": "tbd-by-uuid",
          "attr_lvl": "SUBCLASS",
          "attr_hier": "SUB29030500450100",
          "attr_name": "VENDOR",
          "attr_value": "Crocs",
          "season": "S20201",
          "version": "Pre-Market",
          "gmd": "D",
          "metrics": [
            {
              "time_id": "S20201",
              "time_nm": "SPR 2020",
              "measures": {
                "attr_rec_unt": 50000,
                "attr_rec_rtl": 2000000.00,
                "attr_sls_unt": 49999,
                "attr_sku_cnt": 25
              }
            }
          ],
          "comments": [
            {
              "said_guid": "dfdfsd64654sdf5",
              "said_type": "attr_value",
              "said_when": "12/4/2019 3:22:59 PM",
              "said_who": "vimyha",
              "said_what": "Can we get a better deal on these shoes?"
            },
            {
              "said_guid": "dfdfsd643423333",
              "said_type": "attr_value",
              "said_when": "12/4/2019 4:22:00 PM",
              "said_who": "davidberlin",
              "said_what": "These shoes are ugly and we should be declining"
            }
          ],
          "status": [
            {
              "stat_type": "attr_plan",
              "stat_value": "Submitted",
              "stat_by": "vimyha",
              "stat_time": "2019-12-16 14:34:36.903954"
            }
          ],
          "attr_grouped": false
        }'),
       ('16b1974d-08bf-424f-81ec-7015590bf102', 'S20201', 'SUB29030500450100', current_timestamp,
        '{
          "attr_guid": "16b1974d-08bf-424f-81ec-7015590bf102",
          "attr_lvl": "SUBCLASS",
          "attr_hier": "SUB29030500450100",
          "attr_name": "VENDOR",
          "attr_value": "Crocs",
          "season": "S20201",
          "version": "Pre-Market",
          "gmd": "D",
          "metrics": [
            {
              "time_id": "S20201",
              "time_nm": "SPR 2020",
              "measures": {
                "attr_rec_unt": 50000,
                "attr_rec_rtl": 2000000.00,
                "attr_sls_unt": 49999,
                "attr_sku_cnt": 30
              }
            }
          ],
          "comments": [
            {
              "said_guid": "dfdfsd64654sdf5",
              "said_type": "attr_value",
              "said_when": "12/4/2019 3:22:59 PM",
              "said_who": "vimyha",
              "said_what": "Can we get a better deal on these shoes?"
            },
            {
              "said_guid": "dfdfsd643423333",
              "said_type": "attr_value",
              "said_when": "12/4/2019 4:22:00 PM",
              "said_who": "davidberlin",
              "said_what": "These shoes are ugly and we should be declining"
            }
          ],
          "status": [
            {
              "stat_type": "attr_plan",
              "stat_value": "Submitted",
              "stat_by": "vimyha",
              "stat_time": "2019-12-16 14:34:36.903954"
            }
          ],
          "attr_grouped": false
        }')
ON CONFLICT (attr_guid) DO UPDATE
    SET attr_plan_doc = EXCLUDED.attr_plan_doc,
        update_date   = EXCLUDED.update_date;
