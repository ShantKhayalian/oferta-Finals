package com.ithome.web.Bean;

import com.ithome.web.AdminDao.BanksDaoController;
import com.ithome.web.Helpers.PojoHelper;

import java.sql.SQLException;
import java.util.List;

public class ConsumerCredit extends PojoHelper {
    private long CLId;
    private String productName;
    private int CCMinAmount;
    private int CCMaxAmount;
    private double CCMinLoan;
    private double CCMaxLoan;
    private double CCFactual;
    private int CCMinPeriodMonth;
    private int CCMaxPeriodMonth;
    private int CCMinServiceFee;
    private int CCMaxServiceFee;
    private int lastLogic;
    private String BankLink;
    private BanksDaoController banksDaoController = new BanksDaoController();

    public ConsumerCredit(int productCode, int bankId, String bankName, String bankWebSite,  int minAge, int maxAge, int orderOfAppearance, int specialOffer, int firstSearchList,
                          int sendRequest, String currancy, int gotoPage, long CLId, String productName, int CCMinAmount, int CCMaxAmount, double CCMinLoan, double CCMaxLoan, double CCFactual, int CCMinPeriodMonth, int CCMaxPeriodMonth, int CCMinServiceFee, int CCMaxServiceFee,int lastlogic) {
        super(productCode, bankId, bankName, bankWebSite, minAge, maxAge, orderOfAppearance, specialOffer, firstSearchList, sendRequest, currancy, gotoPage);
        this.CLId = CLId;
        this.productName = productName;
        this.CCMinAmount = CCMinAmount;
        this.CCMaxAmount = CCMaxAmount;
        this.CCMinLoan = CCMinLoan;
        this.CCMaxLoan = CCMaxLoan;
        this.CCFactual = CCFactual;
        this.CCMinPeriodMonth = CCMinPeriodMonth;
        this.CCMaxPeriodMonth = CCMaxPeriodMonth;
        this.CCMinServiceFee = CCMinServiceFee;
        this.CCMaxServiceFee = CCMaxServiceFee;
        this.lastLogic=lastlogic;
    }

    public ConsumerCredit(int orderOfAppearance, int specialOffer, int firstSearchList, int sendRequest, int gotoPage,int lastlogic) {
        super(orderOfAppearance, specialOffer, firstSearchList, sendRequest, gotoPage);
        this.lastLogic=lastlogic;
    }

    public ConsumerCredit(int orderOfAppearance, int specialOffer, int firstSearchList, int sendRequest, int gotoPage) {
        super(orderOfAppearance, specialOffer, firstSearchList, sendRequest, gotoPage);

    }


    public ConsumerCredit() {
    }


    public ConsumerCredit(int productCode, int bankId, String bankName, String bankWebSite, int minAge, int maxAge,
                          String currancy, String productName, int coCMinAmount, int coCMaxAmount, double coCMinCredit,
                          double coCMaxCredit, double coCPerFactual, int coCMinPeriodMonths, int coCMaxPeriodMonth,
                          int coCMaxServiceFee, int coCMinServiceFee,String bankLink) {
        super(productCode, bankId, bankName, bankWebSite, minAge, maxAge, currancy);
        this.productName = productName;
        this.CCMinAmount = coCMinAmount;
        this.CCMaxAmount = coCMaxAmount;
        this.CCMinLoan = coCMinCredit;
        this.CCMaxLoan = coCMaxCredit;
        this.CCFactual = coCPerFactual;
        this.CCMinPeriodMonth = coCMinPeriodMonths;
        this.CCMaxPeriodMonth = coCMaxPeriodMonth;
        this.CCMinServiceFee = coCMinServiceFee;
        this.CCMaxServiceFee = coCMaxServiceFee;
        this.BankLink = bankLink;

    }

    public ConsumerCredit(String productName, String bankName, String bankWebSite,
                          long clId, int bankId, int productCode, int minAge,
                          int maxAge, int coCMinAmount, int coCMaxAmount,
                          int ccMinServiceFee, int ccMaxServiceFee, double ccMinLoan,
                          double ccMaxLoan, int ccMinPeriodMonth, int ccMaxPeriodMonth,String currancy) {
        super(productCode, bankId, bankName, bankWebSite, minAge, maxAge, currancy);
        this.productName = productName;
        this.CCMinAmount = coCMinAmount;
        this.CCMaxAmount = coCMaxAmount;
        this.CLId=clId;
        this.CCMinServiceFee = ccMinServiceFee;
        this.CCMaxServiceFee = ccMaxServiceFee;
        this.CCMinLoan =ccMinLoan;
        this.CCMaxLoan=ccMaxLoan;
        this.CCMinPeriodMonth = ccMinPeriodMonth;
        this.CCMaxPeriodMonth = ccMaxPeriodMonth;

    }

    public String getBanksList() throws SQLException {
        return banksDaoController.getBankImageById(super.getBankId());

    }

    public String setBanksList(List<ConsumerCredit> depositList) throws SQLException {
        String bankImage = null;
        int bankid = 0;
        for (int i = 0; i < depositList.size(); i++) {
            bankid = depositList.get(i).getBankId();
            bankImage = banksDaoController.getBankImageById(bankid);
        }
        return bankImage;
    }

    public int getLastLogic() {
        return lastLogic;
    }

    public void setLastLogic(int lastLogic) {
        this.lastLogic = lastLogic;
    }

    public String getBankLink() {
        return BankLink;
    }

    public void setBankLink(String bankLink) {
        BankLink = bankLink;
    }

    public int getLastlogic() {
        return lastLogic;
    }

    public void setLastlogic(int lastlogic) {
        this.lastLogic = lastlogic;
    }

    public long getCLId() {
        return CLId;
    }

    public void setCLId(long CLId) {
        this.CLId = CLId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getCCMinAmount() {
        return CCMinAmount;
    }

    public void setCCMinAmount(int CCMinAmount) {
        this.CCMinAmount = CCMinAmount;
    }

    public int getCCMaxAmount() {
        return CCMaxAmount;
    }

    public void setCCMaxAmount(int CCMaxAmount) {
        this.CCMaxAmount = CCMaxAmount;
    }

    public double getCCMinLoan() {
        return CCMinLoan;
    }

    public void setCCMinLoan(double CCMinLoan) {
        this.CCMinLoan = CCMinLoan;
    }

    public double getCCMaxLoan() {
        return CCMaxLoan;
    }

    public void setCCMaxLoan(double CCMaxLoan) {
        this.CCMaxLoan = CCMaxLoan;
    }

    public double getCCFactual() {
        return CCFactual;
    }

    public void setCCFactual(double CCFactual) {
        this.CCFactual = CCFactual;
    }

    public int getCCMinPeriodMonth() {
        return CCMinPeriodMonth;
    }

    public void setCCMinPeriodMonth(int CCMinPeriodMonth) {
        this.CCMinPeriodMonth = CCMinPeriodMonth;
    }

    public int getCCMaxPeriodMonth() {
        return CCMaxPeriodMonth;
    }

    public void setCCMaxPeriodMonth(int CCMaxPeriodMonth) {
        this.CCMaxPeriodMonth = CCMaxPeriodMonth;
    }

    public int getCCMinServiceFee() {
        return CCMinServiceFee;
    }

    public void setCCMinServiceFee(int CCMinServiceFee) {
        this.CCMinServiceFee = CCMinServiceFee;
    }

    public int getCCMaxServiceFee() {
        return CCMaxServiceFee;
    }

    public void setCCMaxServiceFee(int CCMaxServiceFee) {
        this.CCMaxServiceFee = CCMaxServiceFee;
    }
}