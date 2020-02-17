-- CREATE TABLE MLP_ANALYTICS.CHOICE_COUNT_TARGETS_TIER
-- (
--     Grp_Nbr       CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Dept_Nbr      CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Class_Nbr     CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Subclass_Nbr  CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     SC_Nbr        CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Dept_Name     CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Class_Name    CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Subclass_Name CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     FQ            CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Mth           CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Mth_Name      CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Tier          CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     AG            CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     CC_Target     CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL
-- )
--     TABLESPACE pg_default;
--
-- ALTER TABLE MLP_ANALYTICS.CHOICE_COUNT_TARGETS_TIER
--     OWNER TO postgres;

DROP TABLE MLP_ANALYTICS.CHOICE_COUNT_TARGETS_TIER;

TRUNCATE TABLE MLP_ANALYTICS.CHOICE_COUNT_TARGETS_TIER;

SELECT *
FROM MLP_ANALYTICS.CHOICE_COUNT_TARGETS_TIER;


--- New from Jim
CREATE TABLE mlp_analytics.choice_count_targets_tier
(
    grp_nbr       character varying(20) COLLATE pg_catalog."default" NOT NULL,
    dept_nbr      character varying(20) COLLATE pg_catalog."default" NOT NULL,
    class_nbr     character varying(20) COLLATE pg_catalog."default" NOT NULL,
    subclass_nbr  character varying(20) COLLATE pg_catalog."default" NOT NULL,
    sc_nbr        character varying(20) COLLATE pg_catalog."default" NOT NULL,
    dept_name     character varying(20) COLLATE pg_catalog."default" NOT NULL,
    class_name    character varying(20) COLLATE pg_catalog."default" NOT NULL,
    subclass_name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    fq            character varying(20) COLLATE pg_catalog."default" NOT NULL,
    mth           character varying(20) COLLATE pg_catalog."default" NOT NULL,
    mth_name      character varying(20) COLLATE pg_catalog."default" NOT NULL,
    tier          character varying(20) COLLATE pg_catalog."default" NOT NULL,
    ag            character varying(20) COLLATE pg_catalog."default" NOT NULL,
    cc_target     integer                                            NOT NULL
)
    TABLESPACE pg_default;

ALTER TABLE mlp_analytics.choice_count_targets_tier
    OWNER to postgres;

CREATE UNIQUE INDEX choice_count_targets_tier_pk
    ON mlp_analytics.choice_count_targets_tier USING btree
        (grp_nbr COLLATE pg_catalog."default", sc_nbr COLLATE pg_catalog."default", mth COLLATE pg_catalog."default",
         tier COLLATE pg_catalog."default", ag COLLATE pg_catalog."default")
    TABLESPACE pg_default;


--------------------------------------------------------------- retrieve  experiment ----------------------------
SELECT array_agg(cc.Mth_Name), array_agg(cc.CC_Target)
FROM MLP_ANALYTICS.CHOICE_COUNT_TARGETS_TIER AS cc
GROUP BY cc.Tier;

--- A spring season tier 1
SELECT *
FROM MLP_ANALYTICS.CHOICE_COUNT_TARGETS_TIER AS cc
WHERE cc.FQ LIKE '%202001%'
  AND cc.AG LIKE '%1%'
  AND cc.Tier LIKE '%A%';

---total target initial: 6913
SELECT COUNT(ccTotalInitial.CC_Target)
FROM MLP_ANALYTICS.CHOICE_COUNT_TARGETS_TIER AS ccTotalInitial;

--- total target for pg1: 216
SELECT COUNT(pg1A.CC_Target)
FROM (SELECT *
      FROM MLP_ANALYTICS.CHOICE_COUNT_TARGETS_TIER AS cc
      WHERE cc.FQ LIKE '%202001%'
        AND cc.AG LIKE '%1%'
        AND cc.Tier LIKE '%A%') AS pg1A;

------------- From Dave
SELECT *
FROM MLP_ANALYTICS.CHOICE_COUNT_TARGETS_TIER
WHERE dept_name = 'M Athletic'
  AND class_name = 'M Athletic Perform'
  AND subclass_name = 'Basic Running'
  AND fq = '202001'
  AND mth = '202001'
  AND tier = 'A'
  AND ag = '1';

------------- From Jim
SELECT sc_nbr, tier, ag, mth, sum(cc_target)
FROM mlp_analytics.choice_count_targets_tier
WHERE sc_nbr = '030500100125'
GROUP BY ROLLUP (sc_nbr, tier, ag, mth)
ORDER BY sc_nbr, tier, ag, mth;

--- no need to show month but need to group by
SELECT sc_nbr, tier, ag, mth, ceil(avg(cc_target))
FROM mlp_analytics.choice_count_targets_tier
WHERE sc_nbr = '030500100125'
GROUP BY ROLLUP (sc_nbr, tier, ag, mth)
ORDER BY sc_nbr, tier, ag, mth;

---- sum
SELECT sc_nbr,
       tier,
       ag,
       CASE
           WHEN substring(mth, 5, 2) IN ('01', '02', '03') THEN
               substring(mth, 1, 4) || '01'
           WHEN substring(mth, 5, 2) IN ('04', '05', '06') THEN
               substring(mth, 1, 4) || '02'
           WHEN substring(mth, 5, 2) IN ('07', '08', '09') THEN
               substring(mth, 1, 4) || '03'
           WHEN substring(mth, 5, 2) IN ('10', '11', '12') THEN
               substring(mth, 1, 4) || '04'
           ELSE
               '999999'
           END qtr,
       CASE
           WHEN substring(mth, 5, 2) IN ('01', '02', '03', '04', '05', '06') THEN
               substring(mth, 1, 4) || '01'
           WHEN substring(mth, 5, 2) IN ('07', '08', '09', '10', '11', '12') THEN
               substring(mth, 1, 4) || '02'
           ELSE
               '999999'
           END season,
       SUM(cc_target)
FROM mlp_analytics.choice_count_targets_tier
WHERE sc_nbr = '030500100125'
GROUP BY ROLLUP (sc_nbr, tier, ag, qtr, season)
ORDER BY sc_nbr, tier, ag, qtr, season;


-- Avg
SELECT sc_nbr, tier, ag,
    CASE
            WHEN substring( mth, 5, 2 ) IN('01','02','03') THEN
                substring( mth, 1, 4 ) || '01'
            WHEN substring( mth, 5, 2 ) IN('04','05','06') THEN
                substring( mth, 1, 4 ) || '02'
            WHEN substring( mth, 5, 2 ) IN('07','08','09') THEN
                substring( mth, 1, 4 ) || '03'
            WHEN substring( mth, 5, 2 ) IN('10','11','12') THEN
                substring( mth, 1, 4 ) || '04'
            ELSE
                '999999'
    END    qtr,

    CASE
            WHEN substring( mth, 5, 2 ) IN('01','02','03','04','05','06') THEN
                substring( mth, 1, 4 ) || '01'
            WHEN substring( mth, 5, 2 ) IN('07','08','09','10','11','12') THEN
                substring( mth, 1, 4 ) || '02'
            ELSE
                '999999'
    END    season,
    AVG(cc_target) CC_Count_Avg
FROM mlp_analytics.choice_count_targets_tier
WHERE sc_nbr = '030500100125'
GROUP BY ROLLUP(sc_nbr, tier, ag, qtr, season)
ORDER BY sc_nbr, tier, ag, qtr, season;


--------------------------------------------------------------- FUNCTION / STORE PROCEDURE  Experiment ----------------------------
CREATE OR REPLACE FUNCTION ccTargetTotalInitial() RETURNS integer AS
$$
DECLARE
BEGIN
    RETURN (SELECT COUNT(ccTotalInitial.CC_Target)
            FROM MLP_ANALYTICS.CHOICE_COUNT_TARGETS_TIER AS ccTotalInitial);
END;
$$ LANGUAGE plpgsql;

SELECT ccTargetTotalInitial(); --- 6913


-- 216/ 6913
CREATE OR REPLACE FUNCTION getPG1A() RETURNS integer AS
$$
DECLARE
    result INTEGER;
BEGIN
    result = (SELECT COUNT(pg1A.CC_Target)
              FROM (SELECT *
                    FROM MLP_ANALYTICS.CHOICE_COUNT_TARGETS_TIER AS cc
                    WHERE cc.FQ LIKE '%202001%'
                      AND cc.AG LIKE '%1%'
                      AND cc.Tier LIKE '%A%') AS pg1A);
    RETURN result;
END;
$$ LANGUAGE plpgsql;

SELECT getPG1A();






