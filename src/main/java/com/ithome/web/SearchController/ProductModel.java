package com.ithome.web.SearchController;

import com.ithome.web.AdminDao.*;
import com.ithome.web.Bean.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductModel {
    private List<Product> products;
    private List<Banks> BankList = new ArrayList<>();
    private List<Deposit> DepositList = new ArrayList<>();
    private List<Mortgage>MortgageList = new ArrayList<>();
    private List<ConsumerCredit> ConsumerList = new ArrayList<>();
    private List<MicroLoans> MicroList = new ArrayList<>();
    private List<CarLoans> CarLoanList = new ArrayList<>();
    private List<AgriculturalCredit> agriculturalCreditList = new ArrayList<>();
    private List<Cards> cardsList = new ArrayList<>();

    private BanksDaoController banksDaoController = new BanksDaoController();
    private DepositDaoController depositDaoController = new DepositDaoController();
    private MortgageDaoController mortgageDaoController = new MortgageDaoController();
    private ConsumerCreditDaoController consumerCreditDaoController = new ConsumerCreditDaoController();
    private MicroLoanDaoController microLoanDaoController = new MicroLoanDaoController();
    private CarLoanDao carLoanDao = new CarLoanDao();
    private AgriculturalCreditDao agriculturalCreditDao = new AgriculturalCreditDao();
    private CardsDao cardsDao = new CardsDao();

    public ProductModel() throws SQLException {
        products = new ArrayList<>();
        getBanksLists();
        getDepositsLists();
        getMortgagesLists();
        getConsumerLists();
        getMicroLists();
        getCarLists();
        getAgLists();
        getCardsLists();

    }

    private void getCardsLists() throws SQLException {
        cardsList = new ArrayList<>();
        cardsList = cardsDao.getAllCardsList();
        for (int i = 0; i <cardsList.size() ; i++) {
            String id= String.valueOf(cardsList.get(i).getProductCode());
            String Name = cardsList.get(i).getCardName();

            products.add(new Product(id, Name, "", "Քարտեր"));
        }
    }

    private void getAgLists() throws SQLException {
        agriculturalCreditList = new ArrayList<>();
        agriculturalCreditList = agriculturalCreditDao.getAllAgriculturalCreditList();
        for (int i = 0; i <agriculturalCreditList.size() ; i++) {
            String id= String.valueOf(agriculturalCreditList.get(i).getProductCode());
            String Name = agriculturalCreditList.get(i).getProductName();
            products.add(new Product(id, Name, "","Գյուղատնտեսական"));
        }
    }

    private void getCarLists() throws SQLException {
        CarLoanList = new ArrayList<>();
        CarLoanList = carLoanDao.getAllCarLoans();
        for (int i = 0; i <CarLoanList.size() ; i++) {
            String id= String.valueOf(CarLoanList.get(i).getProductCode());
            String Name = CarLoanList.get(i).getProductName();
            products.add(new Product(id, Name, "","Ավտովարկ"));
        }
    }

    private void getMicroLists() throws SQLException {
        MicroList = new ArrayList<>();
        MicroList = microLoanDaoController.getAllMicroLoans();
        for (int i = 0; i <MicroList.size() ; i++) {
            String id= String.valueOf(MicroList.get(i).getProductCode());
            String Name = MicroList.get(i).getProductName();
            products.add(new Product(id, Name, "","Միկրովարկ"));
        }
    }

    private void getConsumerLists() throws SQLException {
        ConsumerList = new ArrayList<>();
        ConsumerList = consumerCreditDaoController.getAllCardsList();
        for (int i = 0; i <ConsumerList.size() ; i++) {
            String id= String.valueOf(ConsumerList.get(i).getProductCode());
            String Name = ConsumerList.get(i).getProductName();
            products.add(new Product(id, Name, "","Սպարողական"));
        }
    }

    private void getMortgagesLists() throws SQLException {
        MortgageList = new ArrayList<>();
        MortgageList = mortgageDaoController.getAllMortage();
        for (int i = 0; i <MortgageList.size() ; i++) {
            String id= String.valueOf(MortgageList.get(i).getProductCode());
            String Name = MortgageList.get(i).getProductName();
            products.add(new Product(id, Name, "","Հիփոթեք"));
        }
    }

    private void getDepositsLists() throws SQLException {
        DepositList = new ArrayList<>();
        DepositList = depositDaoController.getAllDepositeList();
        for (int i = 0; i <DepositList.size() ; i++) {
            String id= String.valueOf(DepositList.get(i).getProductCode());
            String Name = DepositList.get(i).getProductName();
            products.add(new Product(id, Name, "","Ավանդներ"));
        }
    }

    private void getBanksLists() throws SQLException {
        BankList = new ArrayList<>();
        BankList = banksDaoController.getAllBanksList();
        for (int i = 0; i <BankList.size() ; i++) {
            String id= String.valueOf(BankList.get(i).getBankId());
            String Name = BankList.get(i).getBankName();
            String phone = BankList.get(i).getBankPhoneNumber();
            products.add(new Product(id, Name, phone,"Բանկեր"));
        }
    }

    public List<String> search(String keyword, HttpServletRequest request , HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        List<String> names = new ArrayList<String>();
        List<String> namesId = new ArrayList<>();
        for (Product product : products) {

            if (product.getName().toLowerCase().contains(keyword.toLowerCase())) {
                String strings = "";
                String strings2 = "";
                String strings3 = "";
                String str = "";
                String str2 = "";
                String str3 = "-ում";

                Charset charset = StandardCharsets.UTF_8;
                str =product.getName();
                str2 =product.getPageName();
                byte[] chars = str.getBytes(charset);
                byte[] chars2 = str2.getBytes(charset);
                byte[] chars3 = str3.getBytes(charset);

                strings = new String(chars, StandardCharsets.ISO_8859_1);
                strings2 = new String(chars2, StandardCharsets.ISO_8859_1);
                strings3= new String(chars3, StandardCharsets.ISO_8859_1);
                System.out.println(strings + " " + strings2 + "" + strings3 + " ID " + product.getId());
                names.add(strings + " " + strings2 + "" + strings3 + " ID " + product.getId());

            }
        }
        return names;
    }

    public List<String> search2(String keyword, HttpServletRequest request , HttpServletResponse response) {
        response.setCharacterEncoding("UTF-8");
        List<String> names = new ArrayList<String>();
        List<String> namesId = new ArrayList<>();
        for (Product product : products) {

            if (product.getName().toLowerCase().contains(keyword.toLowerCase())) {
                String strings = "";
                String strings2 = "";
                String strings3 = "";
                String str = "";
                String str2 = "";
                String str3 = "-ում";

                Charset charset = StandardCharsets.UTF_8;
                str =product.getName();
                str2 =product.getPageName();
                byte[] chars = str.getBytes(charset);
                byte[] chars2 = str2.getBytes(charset);
                byte[] chars3 = str3.getBytes(charset);

                strings = new String(chars, StandardCharsets.ISO_8859_1);
                strings2 = new String(chars2, StandardCharsets.ISO_8859_1);
                strings3= new String(chars3, StandardCharsets.ISO_8859_1);
                System.out.println(strings + " " + strings2 + "" + strings3 + " ID " + product.getId());
                names.add(strings + " " + strings2 + "" + strings3 + " ID " + product.getId());


            }
        }
        return names;
    }
}
