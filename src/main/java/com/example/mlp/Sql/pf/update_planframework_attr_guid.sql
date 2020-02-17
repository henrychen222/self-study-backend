-- For new plans saved, attr_guid is still blank in body, update via stored proc or trigger?
UPDATE mlpdocs.plan_framework_attr_doc
	SET attr_plan_doc = jsonb_set("attr_plan_doc", '{attr_guid}',to_jsonb(plan_framework_attr_doc.attr_guid), FALSE)
	WHERE attr_plan_doc->'attr_guid' = '""'

CREATE OR REPLACE FUNCTION retrieveGuidComboKey() RETURNS void AS $$
DECLARE
BEGIN
   UPDATE mlpdocs.plan_framework_attr_doc
   SET attr_plan_doc = jsonb_set("attr_plan_doc", '{attr_guid}',to_jsonb(plan_framework_attr_doc.attr_guid), FALSE)
   WHERE attr_plan_doc->'attr_guid' = '""';
   COMMIT;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION IF EXISTS retrieveGuidComboKey();

SELECT * FROM retrieveGuidComboKey();
SELECT 'retrieveGuidComboKey';



CREATE OR REPLACE PROCEDURE getPlans()
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE mlpdocs.plan_framework_attr_doc
    SET attr_plan_doc = jsonb_set("attr_plan_doc", '{attr_guid}',to_jsonb(plan_framework_attr_doc.attr_guid), FALSE)
    WHERE attr_plan_doc->'attr_guid' = '""';
    COMMIT;
END;
$$;

CALL getPlans();

--- show user-defined store procedure
SELECT  proname
FROM    pg_catalog.pg_namespace n
JOIN    pg_catalog.pg_proc p
ON      pronamespace = n.oid
WHERE   nspname = 'public';

DROP PROCEDURE getPlans();
