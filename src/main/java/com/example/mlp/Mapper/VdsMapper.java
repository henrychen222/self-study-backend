package com.example.mlp.Mapper;

import com.example.mlp.Model.Vds;

import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class VdsMapper implements RowMapper<Vds> {

    @Override
    public Vds mapRow(ResultSet rs, int rowNum) throws SQLException {
        Vds vds = new Vds();

        vds.setVname(rs.getString("vname"));
        vds.setCasetalker(rs.getString("casetalker"));
        vds.setAccountrepname(rs.getString("accountrepname"));
        vds.setVstylename(rs.getString("vstylename"));
        vds.setVstylenumber(rs.getString("vstylenumber"));
        vds.setVcolordesc(rs.getString("vcolordesc"));
        vds.setNrfcolorcode(rs.getString("nrfcolorcode"));
        vds.setVmaterial(rs.getString("vmaterial"));
        vds.setVtypeofpurchase(rs.getString("vtypeofpurchase"));
        vds.setSizerange(rs.getString("sizerange"));
        vds.setAvailabledate(rs.getString("availabledate"));
        vds.setMsrp(rs.getString("msrp"));
        vds.setMinadvertisedprice(rs.getString("minadvertisedprice"));
        vds.setWholesalecost(rs.getString("wholesalecost"));
        vds.setDswcost(rs.getString("dswcost"));
        vds.setCosttype(rs.getString("costtype"));
        vds.setDropship(rs.getString("dropship"));
        vds.setCasepackinnerpack(rs.getString("casepackinnerpack"));
        vds.setVminorderqty(rs.getString("vminorderqty"));
        vds.setCoo(rs.getString("coo"));
        vds.setFob(rs.getString("fob"));
        vds.setDutyrate(rs.getString("dutyrate"));
        vds.setCommissionrate(rs.getString("commissionrate"));
        vds.setRoyalty(rs.getString("royalty"));
        vds.setHtscode(rs.getString("htscode"));
        vds.setFeaturesbenefits(rs.getString("featuresbenefits"));
        vds.setVnotes(rs.getString("vnotes"));
        vds.setBusunit(rs.getString("busunit"));
        vds.setDept(rs.getString("dept"));
        vds.setSeason(rs.getString("season"));
        vds.setCls(rs.getString("cls"));
        vds.setSubclass(rs.getString("subclass"));
        vds.setNeworexistingstyle(rs.getString("neworexistingstyle"));
        vds.setMerchantdecision(rs.getString("merchantdecision"));
        vds.setDswvendorname(rs.getString("dswvendorname"));
        vds.setDswcasetalker(rs.getString("dswcasetalker"));
        vds.setDswstyledesc(rs.getString("dswstyledesc"));
        vds.setDswcolor(rs.getString("dswcolor"));
        vds.setLandedcost(rs.getString("landedcost"));
        vds.setRetail(rs.getString("retail"));
        vds.setImu(rs.getString("imu"));
        vds.setConstruction(rs.getString("construction"));
        vds.setHeelheight(rs.getString("heelheight"));
        vds.setCatcode(rs.getString("catcode"));
        vds.setUpper1(rs.getString("upper1"));
        vds.setDetail1(rs.getString("detail1"));
        vds.setDetail2(rs.getString("detail2"));
        vds.setToeshape(rs.getString("toeshape"));
        vds.setMaterial1(rs.getString("material1"));
        vds.setMaterial2(rs.getString("material2"));
        vds.setTypeofpurchase(rs.getString("typeofpurchase"));
        vds.setXclusive(rs.getString("xclusive"));
        vds.setPhototype(rs.getString("phototype"));
        vds.setBuyercomments(rs.getString("buyercomments"));
        vds.setProductupload(rs.getString("productupload"));

        return vds;
    }

}
