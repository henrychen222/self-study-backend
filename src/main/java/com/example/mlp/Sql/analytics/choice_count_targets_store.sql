-- CREATE TABLE MLP_ANALYTICS.CHOICE_COUNT_TARGETS_STORE
-- (
--     Grp_Nbr       CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Dept_Nbr      CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Class_Nbr     CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Subclass_Nbr  CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     SC_Nbr        CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Dept_Name     CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Class_Name    CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Subclass_Name CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Location_Nbr  CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     FQ            CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Mth           CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Mth_Name      CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Tier          CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     AG            CHARACTER VARYING(20) COLLATE pg_catalog."default" NOT NULL,
--     Space_Units   INTEGER NOT NULL
-- )
--     TABLESPACE pg_default;
--
-- ALTER TABLE MLP_ANALYTICS.CHOICE_COUNT_TARGETS_STORE
--     OWNER TO postgres;

DROP TABLE MLP_ANALYTICS.CHOICE_COUNT_TARGETS_STORE;

TRUNCATE TABLE MLP_ANALYTICS.CHOICE_COUNT_TARGETS_STORE;

SELECT *
FROM MLP_ANALYTICS.CHOICE_COUNT_TARGETS_STORE;


--- New from Jim
CREATE TABLE mlp_analytics.choice_count_targets_store
(
    grp_nbr       character varying(20) COLLATE pg_catalog."default" NOT NULL,
    dept_nbr      character varying(20) COLLATE pg_catalog."default" NOT NULL,
    class_nbr     character varying(20) COLLATE pg_catalog."default" NOT NULL,
    subclass_nbr  character varying(20) COLLATE pg_catalog."default" NOT NULL,
    sc_nbr        character varying(20) COLLATE pg_catalog."default" NOT NULL,
    dept_name     character varying(20) COLLATE pg_catalog."default" NOT NULL,
    class_name    character varying(20) COLLATE pg_catalog."default" NOT NULL,
    subclass_name character varying(20) COLLATE pg_catalog."default" NOT NULL,
    location_nbr  character varying(20) COLLATE pg_catalog."default" NOT NULL,
    fq            character varying(20) COLLATE pg_catalog."default" NOT NULL,
    mth           character varying(20) COLLATE pg_catalog."default" NOT NULL,
    mth_name      character varying(20) COLLATE pg_catalog."default" NOT NULL,
    tier          character varying(20) COLLATE pg_catalog."default" NOT NULL,
    ag            character varying(20) COLLATE pg_catalog."default" NOT NULL,
    space_units   integer                                            NOT NULL
)
    TABLESPACE pg_default;

ALTER TABLE mlp_analytics.choice_count_targets_store
    OWNER to postgres;

CREATE UNIQUE INDEX choice_count_targets_store_pk
    ON mlp_analytics.choice_count_targets_store USING btree
        (grp_nbr COLLATE pg_catalog."default", sc_nbr COLLATE pg_catalog."default", location_nbr
         COLLATE pg_catalog."default", mth COLLATE pg_catalog."default", tier COLLATE pg_catalog."default", ag
         COLLATE pg_catalog."default")
    TABLESPACE pg_default;


---------- Jim
SELECT sc_nbr, tier, ag, sum(space_units)
FROM mlp_analytics.choice_count_targets_store
WHERE sc_nbr = '030500100125'
GROUP BY ROLLUP (sc_nbr, tier, ag)
ORDER BY sc_nbr, tier, ag;

SELECT sc_nbr, tier, ag, mth, sum(space_units)
FROM mlp_analytics.choice_count_targets_store
WHERE sc_nbr = '030500100125'
GROUP BY ROLLUP (sc_nbr, tier, ag, mth)
ORDER BY sc_nbr, tier, ag, mth;
