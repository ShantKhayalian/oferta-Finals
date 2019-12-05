package com.ithome.web.Bean;

import com.ithome.web.AdminDao.BanksDaoController;
import com.ithome.web.Helpers.PojoHelper;

import java.sql.SQLException;
import java.util.List;

public class Mortgage extends PojoHelper {
    private long MId;
    private String productName;
    private int MMinAmount;
    private int MMaxAmount;
    private double MMinLoan;
    private double MMaxLoan;
    private double MFatual;
    private int MMinDownPayment;
    private int MMaxDownPayment;
    private int MMinPeriodMonth;
    private int MMaxPeriodMonth;
    private int MMinServiceFee;
    private int MMaxServiceFee;
    private int MRepaymentId;
    private String MRepayment;
    private int lastLogic;
    private String BankLink;
    private BanksDaoController banksDaoController = new BanksDaoController();

    public Mortgage(int productCode, int bankId, String bankName, String bankWebSite, int minAge, int maxAge, int orderOfAppearance, int specialOffer, int firstSearchList,
                    int sendRequest, String currancy, int gotoPage, long MId, String productName, int MMinAmount, int MMaxAmount, double MMinLoan, double MMaxLoan, double MFatual, int MMinDownPayment, int MMaxDownPayment, int MMinPeriodMonth, int MMaxPeriodMonth, int MMinServiceFee, int MMaxServiceFee, int MRepaymentId, String MRepayment,int lastlogic) {
        super(productCode, bankId, bankName, bankWebSite, minAge, maxAge, orderOfAppearance, specialOffer, firstSearchList, sendRequest, currancy, gotoPage);
        this.MId = MId;
        this.productName = productName;
        this.MMinAmount = MMinAmount;
        this.MMaxAmount = MMaxAmount;
        this.MMinLoan = MMinLoan;
        this.MMaxLoan = MMaxLoan;
        this.MFatual = MFatual;
        this.MMinDownPayment = MMinDownPayment;
        this.MMaxDownPayment = MMaxDownPayment;
        this.MMinPeriodMonth = MMinPeriodMonth;
        this.MMaxPeriodMonth = MMaxPeriodMonth;
        this.MMinServiceFee = MMinServiceFee;
        this.MMaxServiceFee = MMaxServiceFee;
        this.MRepaymentId = MRepaymentId;
        this.MRepayment = MRepayment;
        this.lastLogic=lastlogic;
    }

    public Mortgage() {
    }


    public Mortgage(int productCode, int bankId, String bankName, String bankWebSite,
                    int minAge, int maxAge, String currancy, String productName,
                    int MMinAmount, int MMaxAmount, double MMinLoan,
                    double MMaxLoan, double MFatual, int MMinDownPayment,
                    int MMaxDownPayment, int MMinPeriodMonth, int MMaxPeriodMonth,
                    int MMinServiceFee, int MMaxServiceFee, int MRepaymentՕptionId, String MRepaymentՕption,String BankLink) {

        super(productCode, bankId, bankName, bankWebSite, minAge, maxAge,  currancy);
        this.productName = productName;
        this.MMinAmount = MMinAmount;
        this.MMaxAmount = MMaxAmount;
        this.MMinLoan = MMinLoan;
        this.MMaxLoan = MMaxLoan;
        this.MFatual = MFatual;
        this.MMinDownPayment = MMinDownPayment;
        this.MMaxDownPayment = MMaxDownPayment;
        this.MMinPeriodMonth = MMinPeriodMonth;
        this.MMaxPeriodMonth = MMaxPeriodMonth;
        this.MMinServiceFee = MMinServiceFee;
        this.MMaxServiceFee = MMaxServiceFee;
        this.MRepaymentId = MRepaymentՕptionId;
        this.MRepayment = MRepaymentՕption;
        this.BankLink = BankLink;
    }

    public Mortgage(String productName, String bankName,
                    String bankWebSite, long mId, int bankId,
                    int productCode, int MMinAmount, int MMaxAmount, int minAge, int maxAge, double MMinLoan,
                    double MMaxLoan, int MMinDownPayment, int MMaxDownPayment, int MMinPeriodMonth,
                    int MMaxPeriodMonth, int MMinServiceFee, int MMaxServiceFee, String currancy) {
        super(productCode, bankId, bankName, bankWebSite, minAge, maxAge,  currancy);
        this.MId=maxAge;
        this.productName = productName;
        this.MMinAmount = MMinAmount;
        this.MMaxAmount = MMaxAmount;
        this.MMinLoan = MMinLoan;
        this.MMaxLoan = MMaxLoan;
        this.MMinDownPayment = MMinDownPayment;
        this.MMaxDownPayment = MMaxDownPayment;
        this.MMinPeriodMonth = MMinPeriodMonth;
        this.MMaxPeriodMonth = MMaxPeriodMonth;
        this.MMinServiceFee = MMinServiceFee;
        this.MMaxServiceFee = MMaxServiceFee;

    }

    public String getBanksList() throws SQLException {
        return banksDaoController.getBankImageById(super.getBankId());

    }

    public String setBanksList(List<Mortgage> mortgageList) throws SQLException {
        String bankImage = null;
        int bankid = 0;
        for (int i = 0; i < mortgageList.size(); i++) {
            bankid = mortgageList.get(i).getBankId();
            bankImage = banksDaoController.getBankImageById(bankid);
        }
        return bankImage;
    }

    public Mortgage(int orderOfAppearance, int specialOffer, int firstSearchList, int sendRequest, int gotoPage) {
        super(orderOfAppearance, specialOffer, firstSearchList, sendRequest, gotoPage);
    }

    public Mortgage(int orderOfAppearance, int specialOffer, int firstSearchList, int sendRequest, int gotoPage,int lastlogic) {
        super(orderOfAppearance, specialOffer, firstSearchList, sendRequest, gotoPage);
        this.lastLogic=lastlogic;
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

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public long getMId() {
        return MId;
    }

    public void setMId(long MId) {
        this.MId = MId;
    }

    public int getMMinAmount() {
        return MMinAmount;
    }

    public void setMMinAmount(int MMinAmount) {
        this.MMinAmount = MMinAmount;
    }

    public int getMMaxAmount() {
        return MMaxAmount;
    }

    public void setMMaxAmount(int MMaxAmount) {
        this.MMaxAmount = MMaxAmount;
    }

    public double getMMinLoan() {
        return MMinLoan;
    }

    public void setMMinLoan(double MMinLoan) {
        this.MMinLoan = MMinLoan;
    }

    public double getMMaxLoan() {
        return MMaxLoan;
    }

    public void setMMaxLoan(double MMaxLoan) {
        this.MMaxLoan = MMaxLoan;
    }

    public double getMFatual() {
        return MFatual;
    }

    public void setMFatual(double MFatual) {
        this.MFatual = MFatual;
    }

    public int getMMinDownPayment() {
        return MMinDownPayment;
    }

    public void setMMinDownPayment(int MMinDownPayment) {
        this.MMinDownPayment = MMinDownPayment;
    }

    public int getMMaxDownPayment() {
        return MMaxDownPayment;
    }

    public void setMMaxDownPayment(int MMaxDownPayment) {
        this.MMaxDownPayment = MMaxDownPayment;
    }

    public int getMMinPeriodMonth() {
        return MMinPeriodMonth;
    }

    public void setMMinPeriodMonth(int MMinPeriodMonth) {
        this.MMinPeriodMonth = MMinPeriodMonth;
    }

    public int getMMaxPeriodMonth() {
        return MMaxPeriodMonth;
    }

    public void setMMaxPeriodMonth(int MMaxPeriodMonth) {
        this.MMaxPeriodMonth = MMaxPeriodMonth;
    }

    public int getMMinServiceFee() {
        return MMinServiceFee;
    }

    public void setMMinServiceFee(int MMinServiceFee) {
        this.MMinServiceFee = MMinServiceFee;
    }

    public int getMMaxServiceFee() {
        return MMaxServiceFee;
    }

    public void setMMaxServiceFee(int MMaxServiceFee) {
        this.MMaxServiceFee = MMaxServiceFee;
    }

    public int getMRepaymentId() {
        return MRepaymentId;
    }

    public void setMRepaymentId(int MRepaymentId) {
        this.MRepaymentId = MRepaymentId;
    }

    public String getMRepayment() {
        return MRepayment;
    }

    public void setMRepayment(String MRepayment) {
        this.MRepayment = MRepayment;
    }
}