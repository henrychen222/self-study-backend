CREATE SCHEMA vendor
    AUTHORIZATION postgres;

DROP SCHEMA vendor
    AUTHORIZATION postgres;


DROP TABLE vendor.VENDORDETAILS;

CREATE TABLE vendor.VENDORDETAILS
(
    version integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    vname character varying(200) COLLATE pg_catalog."default",
    casetalker character varying(200) COLLATE pg_catalog."default",
    accountrepname character varying(200) COLLATE pg_catalog."default",
    vstylename character varying(200) COLLATE pg_catalog."default",
    vstylenumber character varying(200) COLLATE pg_catalog."default",
    vcolordesc character varying(200) COLLATE pg_catalog."default",
    nrfcolorcode character varying(200) COLLATE pg_catalog."default",
    vmaterial character varying(200) COLLATE pg_catalog."default",
    vtypeofpurchase character varying(200) COLLATE pg_catalog."default",
    sizerange character varying(200) COLLATE pg_catalog."default",
    availabledate character varying(200) COLLATE pg_catalog."default",
    msrp character varying(200) COLLATE pg_catalog."default",
    minadvertisedprice character varying(200) COLLATE pg_catalog."default",
    wholesalecost character varying(200) COLLATE pg_catalog."default",
    dswcost character varying(200) COLLATE pg_catalog."default",
    costtype character varying(200) COLLATE pg_catalog."default",
    dropship character varying(200) COLLATE pg_catalog."default",
    casepackinnerpack character varying(200) COLLATE pg_catalog."default",
    mastercarton character varying(200) COLLATE pg_catalog."default",
    vminorderqty character varying(200) COLLATE pg_catalog."default",
    coo character varying(200) COLLATE pg_catalog."default",
    fob character varying(200) COLLATE pg_catalog."default",
    dutyrate character varying(200) COLLATE pg_catalog."default",
    commissionrate character varying(200) COLLATE pg_catalog."default",
    royalty character varying(200) COLLATE pg_catalog."default",
    htscode character varying(200) COLLATE pg_catalog."default",
    featuresbenefits character varying(200) COLLATE pg_catalog."default",
    vnotes character varying(200) COLLATE pg_catalog."default",
    busunit character varying(200) COLLATE pg_catalog."default",
    dept character varying(200) COLLATE pg_catalog."default",
    season character varying(200) COLLATE pg_catalog."default",
    cls character varying(200) COLLATE pg_catalog."default",
    subclass character varying(200) COLLATE pg_catalog."default",
    neworexistingstyle character varying(200) COLLATE pg_catalog."default",
    merchantdecision character varying(200) COLLATE pg_catalog."default",
    dswvendorname character varying(200) COLLATE pg_catalog."default",
    dswcasetalker character varying(200) COLLATE pg_catalog."default",
    dswstyledesc character varying(200) COLLATE pg_catalog."default",
    dswcolor character varying(200) COLLATE pg_catalog."default",
    landedcost character varying(200) COLLATE pg_catalog."default",
    retail character varying(200) COLLATE pg_catalog."default",
    imu character varying(200) COLLATE pg_catalog."default",
    construction character varying(200) COLLATE pg_catalog."default",
    heelheight character varying(200) COLLATE pg_catalog."default",
    catcode character varying(200) COLLATE pg_catalog."default",
    upper1 character varying(200) COLLATE pg_catalog."default",
    detail1 character varying(200) COLLATE pg_catalog."default",
    detail2 character varying(200) COLLATE pg_catalog."default",
    toeshape character varying(200) COLLATE pg_catalog."default",
    material1 character varying(200) COLLATE pg_catalog."default",
    material2 character varying(200) COLLATE pg_catalog."default",
    typeofpurchase character varying(200) COLLATE pg_catalog."default",
    xclusive character varying(200) COLLATE pg_catalog."default",
    phototype character varying(200) COLLATE pg_catalog."default",
    buyercomments character varying(200) COLLATE pg_catalog."default",
    productupload character varying(200) COLLATE pg_catalog."default",
    CONSTRAINT "VENDORDETAILS_pkey" PRIMARY KEY (version)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE vendor.VENDORDETAILS
    OWNER to postgres;


CREATE INDEX vdetailsi1
    ON vendor.VENDORDETAILS USING btree
    (season COLLATE pg_catalog."default", subclass COLLATE pg_catalog."default")
    TABLESPACE pg_default;




select * from vendor.VENDORDETAILS;