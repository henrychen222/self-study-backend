
DROP TABLE mlpdocs.plan_framework_attr_doc;

create EXTENSION IF NOT EXISTS "uuid-ossp";
create TABLE mlpdocs.plan_framework_attr_doc
(
    attr_guid uuid DEFAULT uuid_generate_v4 () NOT NULL,
--    attr_guid character(50) COLLATE pg_catalog."default" NOT NULL, -- update to UUID type
    attr_season character(6) COLLATE pg_catalog."default" NOT NULL,
    attr_hier character varying(18) COLLATE pg_catalog."default" NOT NULL,
    update_date timestamp without time zone NOT NULL,
    attr_plan_doc jsonb,
    CONSTRAINT plan_framework_attr_pkey PRIMARY KEY (attr_guid)
)

TABLESPACE pg_default;

alter table mlpdocs.plan_framework_attr_doc
    OWNER to postgres;


--- Index

--create UNIQUE INDEX "PFA_GUID"
--    ON mlp.plan_framework_attr_doc USING btree
--    (attr_guid pg_catalog."default")
--    TABLESPACE pg_default;

create INDEX "PFA_SEASON_HIER"
    ON mlp.plan_framework_attr_doc USING btree
    (attr_season COLLATE pg_catalog."default", attr_hier COLLATE pg_catalog."default")
    TABLESPACE pg_default;


--DROP INDEX mlpdocs."PFA_GUID";
DROP INDEX mlpdocs."PFA_SEASON_HIER";
