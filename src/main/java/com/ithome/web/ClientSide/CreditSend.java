package com.ithome.web.ClientSide;

import com.ithome.web.AdminDao.*;
import com.ithome.web.Bean.*;
import com.ithome.web.CompareController.CompareHelper;
import com.ithome.web.Comparision.DepositComDao;
import com.ithome.web.Comparision.MicroComDao;
import com.ithome.web.Comparision.MicroComparing;
import com.ithome.web.Helpers.*;
import com.ithome.web.Localization.CheckLanguageAndCurrency;
import com.ithome.web.counterController.HitCounter;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.time.Month;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

@WebServlet("/CreditSend")
public class CreditSend extends HttpServlet {
    private CheckLanguageAndCurrency checkLanguageAndCurrency = new CheckLanguageAndCurrency();
    private String language = null;
    private String Pagelanguage = null;
    private String pageName = null;
    private String city = null;
    private String pageLanguageName = null;
    private String sessionId = null;
    private String Amount = null;
    private String PageToGo = null;
    private String amoutFiltered = null;
    private String MaxAmount = null;

    private List<DropDowns> dropDownsList = new ArrayList<>();
    private List<DropDowns> dropDownsListWithCurrancy = new ArrayList<>();

    private List<Mortgage> mortgageList = new ArrayList<>();
    private List<ConsumerCredit> consumerCreditList = new ArrayList<>();
    private List<MicroLoans> MicroCreditList = new ArrayList<>();
    private List<AgriculturalCredit> AgList = new ArrayList<>();
    private List<Cards> CardList = new ArrayList<>();
    private List<CarLoans> CarList = new ArrayList<>();
    private List<Deposit> DepositsList = new ArrayList<>();
    private List<Banks> banksList = new ArrayList<>();


    private DropDownCurrancyHelper dropDownCurrancyHelper = new DropDownCurrancyHelper();
    private DropDownHelper dropDownHelper = new DropDownHelper();

    private String pageCurrancy = null;
    private String pageCurrancyFromPage = null;
    private HitCounter hitCounter = new HitCounter();
    private LookUpProgram lookUpProgram = new LookUpProgram();
    private LanguageHelper languageHelper = new LanguageHelper();
    private PageNameHelper pageNameHelper = new PageNameHelper();


    private List<Integer> comparListDeposit = new ArrayList<>();
    private List<Integer> comparListMortgage = new ArrayList<>();
    private static List<Integer> comparListConsumer = new ArrayList<>();
    private static List<Integer> comparListCarLoan = new ArrayList<>();
    private static List<Integer> comparListMicro = new ArrayList<>();
    private static List<Integer> comparListAg = new ArrayList<>();
    private static List<Integer> comparListCard = new ArrayList<>();
    private String WorningMessage = null;
    private int DepositCompareSize = 0;
    private int PercentageSecond = 0;
    private String PageNameToDelete = null;

    private int ProductCode = 0;
    private String FromPageName = null;
    private String Months = null;

    private String rangeTwo = null;
    private String valueTwo = null;

    private float PercentageSecondFloat = 0;

    private int oldAmount = 0;
    private int options = 0;
    private int oldformerrCheck = 0;


    private String UserName = "";
    private String SerName = "";
    private String Phone = "";
    private String Email = "";
    private String Body = "";
    private int BankID = 0;
    private String BankEmail = "";
    private float perc = 0;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            creditSend(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            creditSend(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void creditSend(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException, ServletException {
        request.setCharacterEncoding("UTF-8");
        sessionControlling(request, response);
        getLanguagesFromPage(request);
        getCurancyFromPage(request);
        //  getCityFromUser(request);
        getPageName(request);
        getPageLanguage(language);
        getParameters(request);
        getDepositListByProductCode(ProductCode);

        checkForCompareList();
        getPageRange();
        GetDropDownByCurrancy(dropDownsList, pageCurrancy);
        createRequestes(request);
        gotoPage(request, response);
    }

    private void getDepositListByProductCode(int id) throws SQLException {
        if (FromPageName.equals("Mortgage") || FromPageName.equals("CreditSendMortgage")) {

            mortgageList = new ArrayList<>();
            MortgageDaoController mortgageDaoController = new MortgageDaoController();
            mortgageList = mortgageDaoController.getMortgageByProductCode(id);
            BanksDaoController banksDaoController = new BanksDaoController();
            int bankId = mortgageList.get(0).getBankId();
            banksList = banksDaoController.getBankInfoById(bankId);
        } else if (FromPageName.equals("Consumer") || FromPageName.equals("ՍՊԱՌՈՂԱԿԱՆ") || FromPageName.equals("ConsumerClient") || FromPageName.equals("ConsumerCalculate")) {
            consumerCreditList = new ArrayList<>();
            ConsumerCreditDaoController consumerCreditDaoController = new ConsumerCreditDaoController();
            consumerCreditList = consumerCreditDaoController.getConsumerCreditByCardCode(id);
            BanksDaoController banksDaoController = new BanksDaoController();
            int bankId = consumerCreditList.get(0).getBankId();
            banksList = banksDaoController.getBankInfoById(bankId);
        } else if (FromPageName.equals("Micro")) {
            MicroCreditList = new ArrayList<>();
            MicroLoanDaoController microLoanDaoController = new MicroLoanDaoController();
            MicroCreditList = microLoanDaoController.getMicroLoansByProductCode(id);
            BanksDaoController banksDaoController = new BanksDaoController();
            int bankId = MicroCreditList.get(0).getBankId();
            banksList = banksDaoController.getBankInfoById(bankId);
        } else if (FromPageName.equals("AG") || FromPageName.equals("AgCalculate")) {
            AgList = new ArrayList<>();
            AgriculturalCreditDao agriculturalCreditDao = new AgriculturalCreditDao();
            AgList = agriculturalCreditDao.getAgriculturalCreditByProductCode(id);
            BanksDaoController banksDaoController = new BanksDaoController();
            int bankId = AgList.get(0).getBankId();
            banksList = banksDaoController.getBankInfoById(bankId);
        } else if (FromPageName.equals("Cars") || FromPageName.equals("Car")) {
            CarList = new ArrayList<>();
            CarLoanDao carLoanDao = new CarLoanDao();
            CarList = carLoanDao.getCarLoansByProductCode(id);
            BanksDaoController banksDaoController = new BanksDaoController();
            int bankId = CarList.get(0).getBankId();
            banksList = banksDaoController.getBankInfoById(bankId);
        } else if (FromPageName.equals("Cards")) {
            CardList = new ArrayList<>();
            CardsDao cardsDao = new CardsDao();
            CardList = cardsDao.getCardsByProductCode(id);
            BanksDaoController banksDaoController = new BanksDaoController();
            int bankId = CardList.get(0).getBankId();
            banksList = banksDaoController.getBankInfoById(bankId);

        } else if (FromPageName.equals("Deposit")) {
            DepositsList = new ArrayList<>();
            DepositDaoController depositDaoController = new DepositDaoController();
            DepositsList = depositDaoController.getDepositByCardCode(id);
            BanksDaoController banksDaoController = new BanksDaoController();
            int bankId = DepositsList.get(0).getBankId();
            banksList = banksDaoController.getBankInfoById(bankId);
        }
    }

    private void gotoPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (FromPageName.equals("Consumer") || FromPageName.equals("ՍՊԱՌՈՂԱԿԱՆ") || FromPageName.equals("ConsumerClient") || FromPageName.equals("ConsumerCalculate")) {
            request.getRequestDispatcher("/CreditsSendC.jsp").forward(request, response);
        } else if (FromPageName.equals("Micro")) {
            request.getRequestDispatcher("/CreditsSendMi.jsp").forward(request, response);
        } else if (FromPageName.equals("Mortgage") || FromPageName.equals("CreditSendMortgage")) {
            request.getRequestDispatcher("/CreditsSendM.jsp").forward(request, response);
        } else if (FromPageName.equals("AG") || FromPageName.equals("AgCalculate")) {
            request.getRequestDispatcher("/CreditsSendAG.jsp").forward(request, response);
        } else if (FromPageName.equals("Cars") || FromPageName.equals("Car")) {
            request.getRequestDispatcher("/CreditsSendCar.jsp").forward(request, response);
        } else if (FromPageName.equals("Cards")) {
            request.getRequestDispatcher("/CreditsSendCa.jsp").forward(request, response);
        } else if (FromPageName.equals("Deposit")) {
            request.getRequestDispatcher("/Credits.jsp").forward(request, response);
        }
    }


    private void GetDropDownByCurrancy(List<DropDowns> dropDownsList, String pageCurrancy) throws SQLException {
        dropDownsListWithCurrancy = dropDownCurrancyHelper.getDropDownWithCurrancy(dropDownsList, pageCurrancy);
    }

    private void createRequestes(HttpServletRequest request) {
        request.setAttribute("Pagelanguage", Pagelanguage);
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("PageCurrancy", pageCurrancy);
        request.setAttribute("PageName", pageName);
        request.setAttribute("city", city);
        request.setAttribute("pageLanguageName", pageLanguageName);
        request.setAttribute("dropDownsListWithCurrancy", dropDownsListWithCurrancy);


        request.setAttribute("Amountfiltered", amoutFiltered);
        request.setAttribute("Amount", Amount);
        request.setAttribute("range", Amount);
        request.setAttribute("months", Months);

        request.setAttribute("minAmount", amoutFiltered);
        request.setAttribute("maxAmount", MaxAmount);
        request.setAttribute("MaxAmount", MaxAmount);
        request.setAttribute("WorningMessage", WorningMessage);
        request.setAttribute("DepositCompareSize", DepositCompareSize);
        request.setAttribute("name", "deposit");
        request.setAttribute("ProductCode", ProductCode);

        request.setAttribute("comparListDeposit", comparListDeposit);
        request.setAttribute("comparListMortgage", comparListMortgage);
        request.setAttribute("comparListConsumer", comparListConsumer);
        request.setAttribute("comparListCarLoan", comparListCarLoan);
        request.setAttribute("comparListMicro", comparListMicro);
        request.setAttribute("comparListAg", comparListAg);
        request.setAttribute("comparListCard", comparListCard);
        request.setAttribute("TheListM", mortgageList);
        request.setAttribute("TheListCC", consumerCreditList);
        request.setAttribute("TheListMicro", MicroCreditList);
        request.setAttribute("TheListAg", AgList);
        request.setAttribute("CardList", CardList);
        request.setAttribute("CarList", CarList);
        request.setAttribute("TheList", DepositsList);
        request.setAttribute("rangeTwo", rangeTwo);
        request.setAttribute("valueTwo", valueTwo);
        request.setAttribute("PercentageSecond", PercentageSecond);
        request.setAttribute("Per", perc);

        request.setAttribute("bankList", banksList);
    }

    private boolean sendEmail(String emailOfSender, String userName, String serName, String PhoneNumber, String body) {
        // Recipient's email ID needs to be mentioned.
        String to = BankEmail;
        // Sender's email ID needs to be mentioned
        String from = "info@oferta.am";
        // Assuming you are sending email from localhost
        String host = "mail.oferta.am";
        // Get system properties
        Properties properties = System.getProperties();
        // Setup mail server
        properties.setProperty("mail.smtp.host", host);
        // Get the default Session object.
        Session session = Session.getDefaultInstance(properties);
        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));
            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            // Set Subject: header field
            message.setSubject("Հայտ oferta.am -ից " + userName + " " + SerName);
            // Now set the actual message
            String finalBody = userName + " " + SerName + " հեռախոսահամար " + PhoneNumber + " Հասցէ " + emailOfSender + "\n" + body;
            message.setText(finalBody);
            Transport.send(message);
            System.out.println("Done");
            return true;
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
        return false;

    }

    private void getBankEmail(HttpServletRequest request) throws SQLException {
        if (request.getParameter("Bankid") != null) {
            BankID = Integer.parseInt(request.getParameter("Bankid"));
            BanksDaoController banksDaoController = new BanksDaoController();
            List<Banks> banksList = banksDaoController.getBankInfoById(BankID);
            for (int i = 0; i < banksList.size(); i++) {
                BankEmail = banksList.get(i).getBankEmailAddress();
            }
        } else {
            BankID = 0;
        }
    }


    private void getParameters(HttpServletRequest request) throws SQLException {


        if (request.getParameter("Email") != null) {
            getBankEmail(request);
            UserName = request.getParameter("userName");
            SerName = request.getParameter("serName");
            Phone = request.getParameter("phone");
            Email = request.getParameter("email");
            Body = request.getParameter("body");

            if (sendEmail(Email, UserName, SerName, Phone, Body)) {
                request.setAttribute("message", "Ձեր էլեկտրոնային փոստը հաջողությամբ ուղարկվեց:");
            } else {
                request.setAttribute("message", "ինչ-որ բան չհաջողվեց, կրկին փորձեք:");
            }

        } else {
            UserName = "";
            SerName = "";
            Phone = "";
            Email = "";
            Body = "";
        }

        if (request.getParameter("percentageSecond") != null) {
            String percentagetoCover = "";
            percentagetoCover = request.getParameter("percentageSecond");
            if (percentagetoCover.contains("%")) {
                StringBuilder sb = new StringBuilder(request.getParameter("percentageSecond"));
                sb.deleteCharAt(sb.length() - 1);
                int percentage2 = 0;
                percentage2 = (int) Float.parseFloat(String.valueOf(sb));
                PercentageSecond = checkPercentageRange(percentage2);
            }
        } else if (request.getAttribute("percentageSecond") != null) {
            String percentagetoCover = "";
            percentagetoCover = String.valueOf(request.getAttribute("percentageSecond"));
            if (percentagetoCover.contains("%")) {
                StringBuilder sb = new StringBuilder(request.getParameter("percentageSecond"));
                sb.deleteCharAt(sb.length() - 1);
                int percentage2 = (int) Float.parseFloat(String.valueOf(sb));
                PercentageSecond = checkPercentageRange(percentage2);
            }
        } else {
            PercentageSecond = 10;
        }


        if (request.getParameter("percentage") != null) {
            perc = 0;
            perc = Float.parseFloat(String.valueOf(request.getParameter("percentage")));
        } else {
            perc = 0;
        }
        if (request.getParameter("options") != null) {
            options = Integer.parseInt(request.getParameter("options"));
        } else {
            options = 0;
        }


        if (request.getParameter("value_two") != null) {
            valueTwo = request.getParameter("value_two");
        } else {
            valueTwo = "";
        }

        if (request.getParameter("range_two") != null) {
            valueTwo = request.getParameter("range_two");
        } else {
            valueTwo = "";

        }


        if (request.getParameter("FromPageName") != null) {
            FromPageName = "";
            FromPageName = request.getParameter("FromPageName");
        } else if (request.getParameter("PageToGo") != null) {
            FromPageName = "";
            FromPageName = request.getParameter("PageToGo");
        } else if (request.getParameter("PageToGo") != null) {
            FromPageName = "";
            FromPageName = request.getParameter("PageName");
        } else {
            FromPageName = "";
        }

        if (request.getParameter("months") != null) {
            Months = request.getParameter("months");
            if (FromPageName.equals("Deposit")) {
                int MonthConverted = Integer.parseInt(Months) / 30;
                Months = "";
                Months = String.valueOf(MonthConverted);
            }
        } else {
            Months = "1";
        }



    /* if (request.getParameter("MaxAmount") != null) {
         MaxAmount = request.getParameter("MaxAmount");
     } else if (request.getParameter("maxAmount") != null) {
         MaxAmount = request.getParameter("maxAmount");
     } else if (request.getParameter("MaxAmounr") != null) {
         MaxAmount = request.getParameter("MaxAmounr");
     } else {
         getMaxAmount();
     }*/
        getMaxAmount();


        if (request.getParameter("range") != null) {
            Amount = "";
            Amount = request.getParameter("range");
            filterAmount(Amount);
        } else if (request.getParameter("Amount") != null) {
            Amount = "";
            Amount = request.getParameter("Amount");
            filterAmount(Amount);
        }

        if (request.getParameter("ProductCode") != null) {
            ProductCode = 0;
            ProductCode = Integer.parseInt(request.getParameter("ProductCode"));
        }
        if (request.getParameter("id") != null) {
            ProductCode = 0;
            ProductCode = Integer.parseInt(request.getParameter("id"));
        }
        if (request.getParameter("range_two") != null) {
            valueTwo = request.getParameter("range_two");
            if (oldAmount != Integer.parseInt(valueTwo)) {
                CalculateALL(request);
                oldAmount = Integer.parseInt(valueTwo);
            } else {
                if (request.getParameter("percentageSecond") != null) {
                    StringBuilder sb = new StringBuilder(request.getParameter("percentageSecond"));
                    sb.deleteCharAt(sb.length() - 1);
                    int percentage2 = (int) Float.parseFloat(String.valueOf(sb));
                    getPercentageValue(percentage2, request);
                }
            }
        } else {
            valueTwo = "";
        }

        if (request.getParameter("pageNameToDelete") != null) {
            PageNameToDelete = request.getParameter("pageNameToDelete");
            deleteList(PageNameToDelete);
        } else {
            PageNameToDelete = "";
        }


    }

    private int checkPercentageRange(int percentage2) {
        if (percentage2 <= 10) {
            return 10;
        } else if(percentage2 >= 80){
            return 80;
        }
        return percentage2;
    }


    private void CalculateALL(HttpServletRequest request) {
        if (Amount != null) {
            PercentageSecondFloat = ((Float.parseFloat(valueTwo) / Float.parseFloat(Amount)) * 100);
        }

        if (PercentageSecond < 10|| PercentageSecondFloat < 10) {
            PercentageSecond = 10;
        } else if (PercentageSecond > 80 || PercentageSecondFloat > 80) {
            PercentageSecond = 80;
        } else {
            PercentageSecond = (int) PercentageSecondFloat;
            valueTwo = request.getParameter("range_two");
        }
    }

    private void getPercentageValue(int percentage2, HttpServletRequest request) {

        if (percentage2 >= 10 && percentage2 <= 80) {
            PercentageSecond = percentage2;
            valueTwo = String.valueOf(((Float.parseFloat(valueTwo) / percentage2 * 100)));
        }

    }

    private void filterAmount(String amount) {
        if (amount.contains(",")) {
            amoutFiltered = amount.replace(",", "");
        } else {
            amoutFiltered = amount;
        }
        System.out.println("amoutFiltered " + amoutFiltered);
    }


    private String getPageNameArm(String pageName) {
        return pageNameHelper.ArmPageName(pageName);
    }

    private void getPageRange() throws SQLException {
        if (FromPageName.equals("Consumer") || FromPageName.equals("ՍՊԱՌՈՂԱԿԱՆ") || FromPageName.equals("ConsumerClient") || FromPageName.equals("ConsumerCalculate")) {
            dropDownsList = dropDownHelper.getPageName("ՍՊԱՌՈՂԱԿԱՆ");
        } else if (FromPageName.equals("Mortgage") || FromPageName.equals("CreditSendMortgage")) {
            dropDownsList = dropDownHelper.getPageName("ՀԻՓՈԹԵՔ");
        } else if (FromPageName.equals("Micro")) {
            dropDownsList = dropDownHelper.getPageName("ՄԻԿՐՈՎԱՐԿ");
        } else if (FromPageName.equals("AG") || FromPageName.equals("AgCalculate")) {
            dropDownsList = dropDownHelper.getPageName("ԳՅՈՒՂԱՏՆՏԵՍԱԿԱՆ");
        } else if (FromPageName.equals("Cars") || FromPageName.equals("Car")) {
            dropDownsList = dropDownHelper.getPageName("ԱՎՏՈՎԱՐԿ");
        } else if (FromPageName.equals("Cards")) {
            dropDownsList = dropDownHelper.getPageName("ԳԼԽԱՎՈՐ");
        } else if (FromPageName.equals("Deposit")) {
            dropDownsList = dropDownHelper.getPageName("ԱՎԱՆԴՆԵՐ");
        }
    }

    private void getMaxAmount() throws SQLException {
        getPageRange();
        dropDownsListWithCurrancy = dropDownCurrancyHelper.getDropDownWithCurrancy(dropDownsList, pageCurrancy);
        for (int i = 0; i < dropDownsListWithCurrancy.size(); i++) {
            MaxAmount = dropDownsListWithCurrancy.get(i).getMaxAmount();
            System.out.println(dropDownsListWithCurrancy.get(i).getMinAmount());
        }
    }

    private void getPageLanguage(String language) {
        Pagelanguage = checkLanguageAndCurrency.checkLanguage(language);
        pageLanguageName = checkLanguageAndCurrency.checkLanguageName(language);
    }

    private void sessionControlling(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        sessionId = session.getId();
        CompareHelper.sendSession(sessionId);
    }

    private String getLanguagesFromPage(HttpServletRequest request) {
        if (request.getParameter("Pagelanguage") == null) {
            language = languageHelper.Pagelanguage(request, Pagelanguage);
        } else {
            language = languageHelper.Pagelanguage(request, request.getParameter("Pagelanguage"));
        }
        return language;
    }

    private void getCurancyFromPage(HttpServletRequest request) {
        if (request.getParameter("Currancy") == null) {
            pageCurrancy = checkLanguageAndCurrency.checkCurrency(pageCurrancyFromPage);
        } else {
            pageCurrancy = checkLanguageAndCurrency.checkCurrency(request.getParameter("Currancy"));
        }
    }

    private void getCityFromUser(HttpServletRequest request) throws IOException {
    /*    if (request.getParameter("city") == null) {
            city = lookUpProgram.start(request);
        } else {
            city = request.getParameter("city");
        }*/
    }

    private void getPageName(HttpServletRequest request) {
        pageName = pageNameHelper.pageName(request);
        System.out.println("Page name : " + pageName);
    }

    private void checkForCompareList() {
        comparListDeposit = CompareHelper.getDepositList(sessionId);
        comparListMortgage = CompareHelper.getMortgageList(sessionId);
        comparListConsumer = CompareHelper.getConsumerList(sessionId);
        comparListCarLoan = CompareHelper.getCarLoanList(sessionId);
        comparListMicro = CompareHelper.getMicroList(sessionId);
        comparListAg = CompareHelper.getAgList(sessionId);
        comparListCard = CompareHelper.getCardList(sessionId);
    }

    private void deleteList(String pageNameToDelete) throws SQLException {
        switch (pageNameToDelete) {
            case "Ավանդ":
                CompareHelper.DeleteDepositList(sessionId);

                break;
            case "Հիփոթեք":
                CompareHelper.DeleteMortgag(sessionId);
                break;
            case "Ավտովարկ":
                CompareHelper.DeleteCarLoan(sessionId);
                break;
            case "ՄԻԿՐՈՎԱՐԿ":
                CompareHelper.DeleteMicro(sessionId);
                break;
            case "Գյուղատնտեսական":
                CompareHelper.DeleteAg(sessionId);
                break;
            case "Սպարողական":
                CompareHelper.DeleteConsumer(sessionId);
                break;
            case "Քարտեր":
                CompareHelper.DeleteCard();
                break;
        }
    }


}

