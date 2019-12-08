package com.ithome.web.ClientSide;

import com.ithome.web.AdminDao.*;
import com.ithome.web.Bean.*;
import com.ithome.web.CompareController.CompareHelper;
import com.ithome.web.Comparision.ConsumerComDao;
import com.ithome.web.Comparision.ConsumerComparing;
import com.ithome.web.Helpers.*;
import com.ithome.web.Localization.CheckLanguageAndCurrency;
import com.ithome.web.counterController.HitCounter;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@WebServlet("/ConsumerClient")
public class ConsumerClient extends HttpServlet {
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
    private List<Deposit> depositListOffer = new ArrayList();
    private List<ProductName> productNameList = new ArrayList<>();
    private List<Mortgage> mortgageListOffer = new ArrayList();
    private List<ConsumerCredit> consumerCreditListoffer = new ArrayList();
    private List<CarLoans> carLoansListoffer = new ArrayList();
    private List<AgriculturalCredit> agriculturalCreditListoffer = new ArrayList();
    private List<Cards> cardsListOffer = new ArrayList();
    private List<Banks> banksList = new ArrayList<>();
    private List<UsefulArticles> usefulArticlesList = new ArrayList<>();

    private List<ConsumerCredit> depositeAseList = new ArrayList<>();

    private MortgageSpecialOfferHelper mortgageSpecialOfferHelper = new MortgageSpecialOfferHelper();
    private ConsumerSpecialOfferHelper consumerSpecialOfferHelper = new ConsumerSpecialOfferHelper();
    private CarLoanSpecialOfferHelper carLoanSpecialOfferHelper = new CarLoanSpecialOfferHelper();
    private DepositSpecialOfferHelper depositSpecialOfferHelper = new DepositSpecialOfferHelper();
    private AgSpecialOfferHelper agSpecialOfferHelper = new AgSpecialOfferHelper();
    private CardsSpecialOfferHelper cardsSpecialOfferHelper = new CardsSpecialOfferHelper();
    private DropDownCurrancyHelper dropDownCurrancyHelper = new DropDownCurrancyHelper();
    private DropDownHelper dropDownHelper = new DropDownHelper();
    private ConsumerCreditDaoController consumerCreditDaoController = new ConsumerCreditDaoController();

    private String pageCurrancy = null;
    private String pageCurrancyFromPage = null;
    private HitCounter hitCounter = new HitCounter();
    private LookUpProgram lookUpProgram = new LookUpProgram();
    private LanguageHelper languageHelper = new LanguageHelper();
    private PageNameHelper pageNameHelper = new PageNameHelper();

    private List<ConsumerCredit> depositAllInRage = new ArrayList<>();
    private List<ConsumerCredit> depositAllInSubRage = new ArrayList<>();

    private String Sorting = null;
    private int arrow = 0;
    private int arrow2 = 0;
    private int ID = 0;

    private List<Integer> comparListDeposit = new ArrayList<>();
    private List<Integer> comparListMortgage = new ArrayList<>();
    private static List<Integer> comparListConsumer = new ArrayList<>();
    private static List<Integer> comparListCarLoan = new ArrayList<>();
    private static List<Integer> comparListMicro = new ArrayList<>();
    private static List<Integer> comparListAg = new ArrayList<>();
    private static List<Integer> comparListCard = new ArrayList<>();
    private String WorningMessage = null;
    private int DepositCompareSize = 0;
    private String PageNameToDelete = null;

    List<ConsumerCredit> depositStartFilter = new ArrayList<>();
    List<ConsumerCredit> depositAmountFilter = new ArrayList<>();
    List<ConsumerCredit> depositCurrancyFilter = new ArrayList<>();
    List<ConsumerCredit> searchUpList = new ArrayList<>();

    List<ConsumerCredit> subDepositStartFilter = new ArrayList<>();
    List<ConsumerCredit> subDepositAmountFilter = new ArrayList<>();
    List<ConsumerCredit> subDepositCurrancyFilter = new ArrayList<>();

    List<Comments> commentsList = new ArrayList<>();
    List<ConsumerCredit> ccControllerList = new ArrayList<>();

    String productName = null;
    int BankId = 0;
    int Service = 0;
    int months = 0;
    double percentage = 0;
    String BankLink = null;


    int getAgList = 0;
    int getDpList = 0;
    int getMoList = 0;
    int getCoList = 0;
    int getCaList = 0;
    int getMiList = 0;


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            consumerClient(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            consumerClient(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void consumerClient(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        sessionControlling(request, response);
        getLanguagesFromPage(request);
        getCurancyFromPage(request);
        // getCityFromUser(request);
        getPageName(request);
        getPageLanguage(language);
        getParameters(request);
        checkForCompareList();
        countHit();
        getPageRange();
        getApperance();

        GetDropDownByCurrancy(dropDownsList, pageCurrancy);
        getDepositSpecialOffers();
        getProductnamesList();
        getMortgageSpecialOffers();
        getConsumerSpecialOffers();
        getCarLoanSpecialOffers();
        getCardsSpecialOffers();
        getAgSpecialOffers();
        createRequestes(request);
        gotoPageConsumerPage(request, response);
    }

    private void checkForCompareList() {
        comparListDeposit = CompareHelper.getDepositList(sessionId);
        comparListMortgage = CompareHelper.getMortgageList(sessionId);
        comparListConsumer = CompareHelper.getConsumerList(sessionId);
        comparListCarLoan = CompareHelper.getCarLoanList(sessionId);
        comparListMicro = CompareHelper.getMicroList(sessionId);
        comparListAg = CompareHelper.getAgList(sessionId);
        getAgList = CompareHelper.getAgListSize();
        getDpList = CompareHelper.getDepositListSize();
        getMoList = CompareHelper.getMortgageListSize();
        getCoList = CompareHelper.getConsumerListSize();
        getCaList = CompareHelper.getCarLoanListSize();
        getMiList = CompareHelper.getMicroListSize();

        comparListCard = CompareHelper.getCardList(sessionId);


    }

    private void getMaxAmount() throws SQLException {
        getPageRange();
        dropDownsListWithCurrancy = dropDownCurrancyHelper.getDropDownWithCurrancy(dropDownsList, pageCurrancy);
        for (int i = 0; i < dropDownsListWithCurrancy.size(); i++) {
            MaxAmount = dropDownsListWithCurrancy.get(i).getMaxAmount();
        }
        CommentDaoComtroller commentDaoComtroller = new CommentDaoComtroller();
        commentsList = commentDaoComtroller.getAllComments();

        ConsumerCreditDaoController consumerCreditDaoController = new ConsumerCreditDaoController();
        ccControllerList = consumerCreditDaoController.getAllCardsList();
    }

    private void getParameters(HttpServletRequest request) throws SQLException {
        if (request.getParameter("months") != null) {
            months = Integer.parseInt(request.getParameter("months"));
        } else {
            months = 0;
        }

        if (request.getParameter("range") != null) {
            Amount = request.getParameter("range");
            filterAmount(Amount);
        } else if (request.getParameter("Amount") != null) {
            Amount = request.getParameter("Amount");
            filterAmount(Amount);
        }
        if (request.getParameter("MaxAmount") != null) {
            MaxAmount = request.getParameter("MaxAmount");
        } else if (request.getParameter("maxAmount") != null) {
            MaxAmount = request.getParameter("maxAmount");
        } else if (request.getParameter("MaxAmounr") != null) {
            MaxAmount = request.getParameter("MaxAmounr");
        } else {
            getMaxAmount();
        }

        if (request.getParameter("PageToGo") != null) {
            PageToGo = request.getParameter("PageToGo");
        } else {
            PageToGo = pageName;
        }

        if (request.getParameter("id") != null) {
            ID = Integer.parseInt(request.getParameter("id"));
            startCompare(ID, request);

        } else {
            WorningMessage = "";
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("WorningMessage", WorningMessage);
            String s = jsonObject.toString();
            request.getSession().setAttribute("jsonArray", s);
            ID = 0;
        }
        if (request.getParameter("pageNameToDelete") != null) {
            PageNameToDelete = request.getParameter("pageNameToDelete");
            deleteList(PageNameToDelete);
        } else {
            PageNameToDelete = "";
        }

        if (request.getParameter("sorting") != null) {
            Sorting = request.getParameter("sorting");
            try {
                SotringMachanizm(Sorting);
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println(e);
            }
        } else {
            Sorting = "DescAmount";
            try {
                SotringMachanizm(Sorting);
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println(e);
            }
        }
    }


    private void SotringMachanizm(String sorting) throws SQLException {
        switch (sorting) {
            case "DescAmount":
                depositeFilter();
                depositeFilterSub();
                break;
            case "AsecAmount":
                AmountAsec();
                AmountAsecSub();
                break;
            case "DescPercent":
                PercentageDesc();
                PercentageDescSub();
                break;
            case "AsecPercent":
                PercentageAsec();
                PercentageAsecSub();
                break;
        }
    }

    private List<ConsumerCredit> FilteredList(int id) throws SQLException {
        return consumerCreditDaoController.getConsumerCreditById(id);
    }

    /* Forth section sub Starts */
    private void PercentageAsecSub() throws SQLException {
        subDepositStartFilter = consumerCreditDaoController.getAllCardsList();
        subDepositAmountFilter = new ArrayList<>();
        subDepositAmountFilter = consumerCreditDaoController.getAllCardsList();

        FilterCurrancyListSub3(subDepositAmountFilter);
    }

    private void FilterCurrancyListSub3(List<ConsumerCredit> subDepositAmountFilter) throws SQLException {
        subDepositCurrancyFilter = new ArrayList<>();
        for (int i = 0; i < subDepositAmountFilter.size(); i++) {
            String CurrancyFilter = subDepositAmountFilter.get(i).getCurrancy();
            if (CurrancyFilter.equals(pageCurrancy)) {
                int id = Integer.parseInt(String.valueOf(subDepositAmountFilter.get(i).getCLId()));
                subDepositCurrancyFilter.addAll(FilteredList(id));
            }
        }
        FilterByRange8(subDepositCurrancyFilter);
    }

    private void FilterByRange8(List<ConsumerCredit> depositAmountFilter) throws SQLException {
        depositCurrancyFilter = new ArrayList<>();
        System.out.println(pageCurrancy);
        for (int i = 0; i < depositAmountFilter.size(); i++) {
            int minAmount = depositAmountFilter.get(i).getCCMinAmount();
            if (Integer.parseInt(Amount) >= minAmount  || Integer.parseInt(Amount) <= minAmount && Integer.parseInt(MaxAmount) <= minAmount) {
                int id = Integer.parseInt(String.valueOf(depositAmountFilter.get(i).getCLId()));
                depositCurrancyFilter.addAll(FilteredList(id));
            }
        }
        FilterOrderApperanceListSub3(depositCurrancyFilter);
    }

    private void FilterOrderApperanceListSub3(List<ConsumerCredit> subDepositCurrancyFilter) throws SQLException {
        depositAllInSubRage = new ArrayList<>();
        for (int i = 0; i < subDepositCurrancyFilter.size(); i++) {
            int orderOfAppearance = subDepositCurrancyFilter.get(i).getOrderOfAppearance();
            if (orderOfAppearance > 1) {
                int id = Integer.parseInt(String.valueOf(subDepositCurrancyFilter.get(i).getCLId()));
                depositAllInSubRage.addAll(FilteredList(id));
            }
        }
        Collections.sort(depositAllInSubRage, new DepositComarator());
        arrow = 0;
        arrow2 = 0;
    }
    /* Forth section sub Starts */


    /* Forth section  Starts */
    private void PercentageAsec() throws SQLException {
        depositStartFilter = consumerCreditDaoController.getAllCardsList();
        depositAmountFilter = new ArrayList<>();
        depositAmountFilter = consumerCreditDaoController.getAllCardsList();
        FilterCurrancyList2(depositAmountFilter);
    }

    private void FilterCurrancyList2(List<ConsumerCredit> depositAmountFilter) throws SQLException {
        depositCurrancyFilter = new ArrayList<>();
        for (int i = 0; i < depositAmountFilter.size(); i++) {
            String CurrancyFilter = depositAmountFilter.get(i).getCurrancy();
            if (CurrancyFilter.equals(pageCurrancy)) {
                int id = Integer.parseInt(String.valueOf(depositAmountFilter.get(i).getCLId()));
                depositCurrancyFilter.addAll(FilteredList(id));
            }
        }
        FilterByRange7(depositCurrancyFilter);
    }

    private void FilterByRange7(List<ConsumerCredit> depositAmountFilter) throws SQLException {
        depositCurrancyFilter = new ArrayList<>();
        System.out.println(pageCurrancy);
        for (int i = 0; i < depositAmountFilter.size(); i++) {
            int minAmount = depositAmountFilter.get(i).getCCMinAmount();
            if (Integer.parseInt(Amount) >= minAmount  || Integer.parseInt(Amount) <= minAmount && Integer.parseInt(MaxAmount) <= minAmount) {
                int id = Integer.parseInt(String.valueOf(depositAmountFilter.get(i).getCLId()));
                depositCurrancyFilter.addAll(FilteredList(id));
            }
        }
        FilterOrderApperanceList2(depositCurrancyFilter);
    }

    private void FilterOrderApperanceList2(List<ConsumerCredit> depositCurrancyFilter) throws SQLException {
        depositAllInRage = new ArrayList<>();
        for (int i = 0; i < depositCurrancyFilter.size(); i++) {
            int orderOfAppearance = depositCurrancyFilter.get(i).getOrderOfAppearance();
            if (orderOfAppearance == 1) {
                int id = Integer.parseInt(String.valueOf(depositCurrancyFilter.get(i).getCLId()));
                depositAllInRage.addAll(FilteredList(id));
            }
        }
        Collections.sort(depositAllInRage, new DepositComarator());
        arrow = 0;
        arrow2 = 0;
    }

    /* Forth section  Ends */

    /* Third section sub Starts */
    private void PercentageDescSub() throws SQLException {
        subDepositStartFilter = consumerCreditDaoController.getAllCardsList();
        subDepositAmountFilter = new ArrayList<>();
        subDepositAmountFilter = consumerCreditDaoController.getAllCardsList();

        FilterCurrancyListSub6(subDepositAmountFilter);
    }

    private void FilterCurrancyListSub6(List<ConsumerCredit> subDepositAmountFilter) throws SQLException {
        subDepositCurrancyFilter = new ArrayList<>();
        for (int i = 0; i < subDepositAmountFilter.size(); i++) {
            String CurrancyFilter = subDepositAmountFilter.get(i).getCurrancy();
            if (CurrancyFilter.equals(pageCurrancy)) {
                int id = Integer.parseInt(String.valueOf(subDepositAmountFilter.get(i).getCLId()));
                subDepositCurrancyFilter.addAll(FilteredList(id));
            }
        }
        FilterByRange6(subDepositCurrancyFilter);
    }

    private void FilterByRange6(List<ConsumerCredit> depositAmountFilter) throws SQLException {
        depositCurrancyFilter = new ArrayList<>();
        System.out.println(pageCurrancy);
        for (int i = 0; i < depositAmountFilter.size(); i++) {
            int minAmount = depositAmountFilter.get(i).getCCMinAmount();
            if (Integer.parseInt(Amount) >= minAmount  || Integer.parseInt(Amount) <= minAmount && Integer.parseInt(MaxAmount) <= minAmount) {
                int id = Integer.parseInt(String.valueOf(depositAmountFilter.get(i).getCLId()));
                depositCurrancyFilter.addAll(FilteredList(id));
            }
        }
        FilterOrderApperanceListSub6(depositCurrancyFilter);
    }

    private void FilterOrderApperanceListSub6(List<ConsumerCredit> subDepositCurrancyFilter) throws SQLException {
        depositAllInSubRage = new ArrayList<>();
        for (int i = 0; i < subDepositCurrancyFilter.size(); i++) {
            int orderOfAppearance = subDepositCurrancyFilter.get(i).getOrderOfAppearance();
            if (orderOfAppearance > 1) {
                int id = Integer.parseInt(String.valueOf(subDepositCurrancyFilter.get(i).getCLId()));
                depositAllInSubRage.addAll(FilteredList(id));
            }
        }
        Collections.sort(depositAllInSubRage, new DepositComarator2());
        arrow = 1;
        arrow2 = 1;
    }

    /* Third section sub Ends */

    /* Third section Starts */
    private void PercentageDesc() throws SQLException {
        depositStartFilter = consumerCreditDaoController.getAllCardsList();
        depositAmountFilter = new ArrayList<>();
        depositAmountFilter = consumerCreditDaoController.getAllCardsList();
        FilterCurrancyList5(depositAmountFilter);

    }

    private void FilterCurrancyList5(List<ConsumerCredit> depositAmountFilter) throws SQLException {
        depositCurrancyFilter = new ArrayList<>();
        for (int i = 0; i < depositAmountFilter.size(); i++) {
            String CurrancyFilter = depositAmountFilter.get(i).getCurrancy();
            if (CurrancyFilter.equals(pageCurrancy)) {
                int id = Integer.parseInt(String.valueOf(depositAmountFilter.get(i).getCLId()));
                depositCurrancyFilter.addAll(FilteredList(id));
            }
        }
        FilterByRange5(depositCurrancyFilter);
    }

    private void FilterByRange5(List<ConsumerCredit> depositAmountFilter) throws SQLException {
        depositCurrancyFilter = new ArrayList<>();
        System.out.println(pageCurrancy);
        for (int i = 0; i < depositAmountFilter.size(); i++) {
            int minAmount = depositAmountFilter.get(i).getCCMinAmount();
            if (Integer.parseInt(Amount) >= minAmount  || Integer.parseInt(Amount) <= minAmount && Integer.parseInt(MaxAmount) <= minAmount) {
                int id = Integer.parseInt(String.valueOf(depositAmountFilter.get(i).getCLId()));
                depositCurrancyFilter.addAll(FilteredList(id));
            }
        }
        FilterOrderApperanceList5(depositCurrancyFilter);
    }

    private void FilterOrderApperanceList5(List<ConsumerCredit> depositCurrancyFilter) throws SQLException {
        depositAllInRage = new ArrayList<>();
        for (int i = 0; i < depositCurrancyFilter.size(); i++) {
            int orderOfAppearance = depositCurrancyFilter.get(i).getOrderOfAppearance();
            if (orderOfAppearance == 1) {
                int id = Integer.parseInt(String.valueOf(depositCurrancyFilter.get(i).getCLId()));
                depositAllInRage.addAll(FilteredList(id));
            }
        }
        Collections.sort(depositAllInRage, new DepositComarator2());
        arrow = 1;
        arrow2 = 1;
    }


    /* Third section Ends */

    /* second section Starts  */

    private void AmountAsec() throws SQLException {

        depositStartFilter = consumerCreditDaoController.getAllCardsList();
        depositAmountFilter = new ArrayList<>();
        depositAmountFilter = consumerCreditDaoController.getAllCardsList();
        FilterCurrancyList3(depositAmountFilter);

    }

    private void FilterCurrancyList3(List<ConsumerCredit> depositAmountFilter) throws SQLException {
        depositCurrancyFilter = new ArrayList<>();
        for (int i = 0; i < depositAmountFilter.size(); i++) {
            String CurrancyFilter = depositAmountFilter.get(i).getCurrancy();
            if (CurrancyFilter.equals(pageCurrancy)) {
                int id = Integer.parseInt(String.valueOf(depositAmountFilter.get(i).getCLId()));
                depositCurrancyFilter.addAll(FilteredList(id));
            }
        }
        FilterByRange3(depositCurrancyFilter);
    }

    private void FilterByRange3(List<ConsumerCredit> depositAmountFilter) throws SQLException {
        depositCurrancyFilter = new ArrayList<>();
        System.out.println(pageCurrancy);
        for (int i = 0; i < depositAmountFilter.size(); i++) {
            int minAmount = depositAmountFilter.get(i).getCCMinAmount();
            if (Integer.parseInt(Amount) >= minAmount  || Integer.parseInt(Amount) <= minAmount && Integer.parseInt(MaxAmount) <= minAmount) {
                int id = Integer.parseInt(String.valueOf(depositAmountFilter.get(i).getCLId()));
                depositCurrancyFilter.addAll(FilteredList(id));
            }
        }
        FilterOrderApperanceList3(depositCurrancyFilter);
    }

    private void FilterOrderApperanceList3(List<ConsumerCredit> depositCurrancyFilter) throws SQLException {
        depositAllInRage = new ArrayList<>();
        for (int i = 0; i < depositCurrancyFilter.size(); i++) {
            int orderOfAppearance = depositCurrancyFilter.get(i).getOrderOfAppearance();
            if (orderOfAppearance == 1) {
                int id = Integer.parseInt(String.valueOf(depositCurrancyFilter.get(i).getCLId()));
                depositAllInRage.addAll(FilteredList(id));
            }
        }
        Collections.sort(depositAllInRage, new DepositComaratorAmount());
        arrow = 0;
        arrow2 = 0;
    }

    /* second section Ends  */

    /* Second Section sub Starts */
    private void AmountAsecSub() throws SQLException {
        subDepositStartFilter = consumerCreditDaoController.getAllCardsList();
        subDepositAmountFilter = new ArrayList<>();
        subDepositAmountFilter = consumerCreditDaoController.getAllCardsList();

        FilterCurrancyListSub4(subDepositAmountFilter);
    }

    private void FilterCurrancyListSub4(List<ConsumerCredit> subDepositAmountFilter) throws SQLException {
        subDepositCurrancyFilter = new ArrayList<>();
        for (int i = 0; i < subDepositAmountFilter.size(); i++) {
            String CurrancyFilter = subDepositAmountFilter.get(i).getCurrancy();
            if (CurrancyFilter.equals(pageCurrancy)) {
                int id = Integer.parseInt(String.valueOf(subDepositAmountFilter.get(i).getCLId()));
                subDepositCurrancyFilter.addAll(FilteredList(id));
            }
        }
        FilterByRange4(subDepositCurrancyFilter);
    }

    private void FilterByRange4(List<ConsumerCredit> depositAmountFilter) throws SQLException {
        depositCurrancyFilter = new ArrayList<>();
        System.out.println(pageCurrancy);
        for (int i = 0; i < depositAmountFilter.size(); i++) {
            int minAmount = depositAmountFilter.get(i).getCCMinAmount();
            if (Integer.parseInt(Amount) >= minAmount  || Integer.parseInt(Amount) <= minAmount && Integer.parseInt(MaxAmount) <= minAmount) {
                int id = Integer.parseInt(String.valueOf(depositAmountFilter.get(i).getCLId()));
                depositCurrancyFilter.addAll(FilteredList(id));
            }
        }
        FilterOrderApperanceListSub4(depositCurrancyFilter);
    }

    private void FilterOrderApperanceListSub4(List<ConsumerCredit> subDepositCurrancyFilter) throws SQLException {
        depositAllInSubRage = new ArrayList<>();
        for (int i = 0; i < subDepositCurrancyFilter.size(); i++) {
            int orderOfAppearance = subDepositCurrancyFilter.get(i).getOrderOfAppearance();
            if (orderOfAppearance > 1) {
                int id = Integer.parseInt(String.valueOf(subDepositCurrancyFilter.get(i).getCLId()));
                depositAllInSubRage.addAll(FilteredList(id));
            }
        }
        Collections.sort(depositAllInSubRage, new DepositComaratorAmount());
        arrow = 0;
        arrow2 = 0;
    }

    /* Second Section sub Starts  */

    /* FirstSection Start */
    private void depositeFilter() throws SQLException {
        depositStartFilter = consumerCreditDaoController.getAllCardsList();
        depositAmountFilter = new ArrayList<>();
        depositAmountFilter = consumerCreditDaoController.getAllCardsList();
        FilterCurrancyList(depositAmountFilter);

    }

    private void FilterCurrancyList(List<ConsumerCredit> depositAmountFilter) throws SQLException {
        depositCurrancyFilter = new ArrayList<>();
        for (int i = 0; i < depositAmountFilter.size(); i++) {
            String CurrancyFilter = depositAmountFilter.get(i).getCurrancy();
            if (CurrancyFilter.equals(pageCurrancy)) {
                int id = Integer.parseInt(String.valueOf(depositAmountFilter.get(i).getCLId()));
                depositCurrancyFilter.addAll(FilteredList(id));
            }
        }
        FilterByRange(depositCurrancyFilter);
    }

    private void FilterByRange(List<ConsumerCredit> depositAmountFilter) throws SQLException {
        depositCurrancyFilter = new ArrayList<>();
        List<ConsumerCredit> depositminAmountFilter = new ArrayList<>();
        System.out.println(pageCurrancy);
        for (int i = 0; i < depositAmountFilter.size(); i++) {
            int minAmount = depositAmountFilter.get(i).getCCMinAmount();
            if (Integer.parseInt(Amount) >= minAmount  || Integer.parseInt(Amount) <= minAmount && Integer.parseInt(MaxAmount) <= minAmount) {
                int id = Integer.parseInt(String.valueOf(depositAmountFilter.get(i).getCLId()));
                depositCurrancyFilter.addAll(FilteredList(id));

            } else {
                continue;
            }
        }
        FilterOrderApperanceList(depositCurrancyFilter);
    }

    private void FilterOrderApperanceList(List<ConsumerCredit> depositCurrancyFilter) throws SQLException {
        depositAllInRage = new ArrayList<>();
        for (int i = 0; i < depositCurrancyFilter.size(); i++) {
            int orderOfAppearance = depositCurrancyFilter.get(i).getOrderOfAppearance();
            if (orderOfAppearance == 1) {
                int id = Integer.parseInt(String.valueOf(depositCurrancyFilter.get(i).getCLId()));
                depositAllInRage.addAll(FilteredList(id));
            }
        }
        Collections.sort(depositAllInRage, new DepositComaratorAmount2());
        arrow = 1;
        arrow2 = 1;
    }

    /* FirstSection Ends */

    /* first Section sub Starts */
    private void depositeFilterSub() throws SQLException {
        subDepositStartFilter = consumerCreditDaoController.getAllCardsList();
        subDepositAmountFilter = new ArrayList<>();
        subDepositAmountFilter = consumerCreditDaoController.getAllCardsList();

        FilterCurrancyListSub(subDepositAmountFilter);
    }

    private void FilterCurrancyListSub(List<ConsumerCredit> subDepositAmountFilter) throws SQLException {
        subDepositCurrancyFilter = new ArrayList<>();
        for (int i = 0; i < subDepositAmountFilter.size(); i++) {
            String CurrancyFilter = subDepositAmountFilter.get(i).getCurrancy();
            if (CurrancyFilter.equals(pageCurrancy)) {
                int id = Integer.parseInt(String.valueOf(subDepositAmountFilter.get(i).getCLId()));
                subDepositCurrancyFilter.addAll(FilteredList(id));
            }
        }
        FilterByRange2(subDepositCurrancyFilter);
    }

    private void FilterByRange2(List<ConsumerCredit> depositAmountFilter) throws SQLException {
        depositCurrancyFilter = new ArrayList<>();
        System.out.println(pageCurrancy);
        for (int i = 0; i < depositAmountFilter.size(); i++) {
            int minAmount = depositAmountFilter.get(i).getCCMinAmount();
            if (Integer.parseInt(Amount) >= minAmount  || Integer.parseInt(Amount) <= minAmount && Integer.parseInt(MaxAmount) <= minAmount) {
                int id = Integer.parseInt(String.valueOf(depositAmountFilter.get(i).getCLId()));
                depositCurrancyFilter.addAll(FilteredList(id));
            }
        }
        FilterOrderApperanceListSub(depositCurrancyFilter);
    }

    private void FilterOrderApperanceListSub(List<ConsumerCredit> subDepositCurrancyFilter) throws SQLException {
        depositAllInSubRage = new ArrayList<>();
        for (int i = 0; i < subDepositCurrancyFilter.size(); i++) {
            int orderOfAppearance = subDepositCurrancyFilter.get(i).getOrderOfAppearance();
            if (orderOfAppearance > 1) {
                int id = Integer.parseInt(String.valueOf(subDepositCurrancyFilter.get(i).getCLId()));
                depositAllInSubRage.addAll(FilteredList(id));
            }
        }
        Collections.sort(depositAllInRage, new DepositComaratorAmount2());
        arrow = 1;
        arrow2 = 1;
    }
    /* first Section sub Ends */

    class DepositComarator implements Comparator<ConsumerCredit> {
        @Override
        public int compare(ConsumerCredit o1, ConsumerCredit o2) {
            return Double.compare(o2.getCCFactual(), o1.getCCFactual());
        }
    }

    class DepositComaratorAmount implements Comparator<ConsumerCredit> {
        @Override
        public int compare(ConsumerCredit o1, ConsumerCredit o2) {
            return Integer.compare(o2.getCCMinAmount(), o1.getCCMinAmount());
        }
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

    private void filterAmount(String amount) {
        if (amount.contains(",")) {
            amoutFiltered = amount.replace(",", "");
        } else {
            amoutFiltered = amount;
        }
        System.out.println("amoutFiltered " + amoutFiltered);
    }

    private void startCompare(int id, HttpServletRequest request) throws SQLException {
        List<ConsumerCredit> getDeposit = new ArrayList<>();
        boolean isSizeInRange = CompareHelper.ConsumerCheckOutOfBound();
        boolean isIdAlreadyHad = CompareHelper.CheckIfIdExsistConsumer(id);
        if (!isSizeInRange && !isIdAlreadyHad) {
            CompareHelper.AddConsumerToArrayById(id);
            getDeposit = consumerCreditDaoController.getByproductId(id);
            for (int i = 0; i < getDeposit.size(); i++) {
                productName = getDeposit.get(i).getProductName();
                BankId = getDeposit.get(i).getBankId();
                percentage = getDeposit.get(i).getCCFactual();
                Service = getDeposit.get(i).getCCMaxServiceFee();
            }
            ConsumerComDao consumerComDao = new ConsumerComDao();
            int done = consumerComDao.Add(CreateObjects());
            if (done == 0) {
                System.out.println("Something wrong");
            } else {
                System.out.println("success");
            }
            comparListDeposit = CompareHelper.getConsumerList(sessionId);
            WorningMessage = "";
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("WorningMessage", WorningMessage);
            String s = jsonObject.toString();
            request.getSession().setAttribute("jsonArray", s);
            DepositCompareSize = CompareHelper.GetSizeConsumer();
        } else {
            if (DepositCompareSize > 3) {
                WorningMessage = "";
                WorningMessage = "Դուք չեք կարող 4 ից ավել համեմատել։";
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("WorningMessage", WorningMessage);
                String s = jsonObject.toString();
                request.getSession().setAttribute("jsonArray", s);
            } else {
                WorningMessage = "";
                WorningMessage = "Դուք արդեն ունեք նույն ID-ին";
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("WorningMessage", WorningMessage);
                String s = jsonObject.toString();
                request.getSession().setAttribute("jsonArray", s);
            }
        }
    }

    private ConsumerComparing CreateObjects() {
        if (months == 0) {
            months = 1;
        }
        return new ConsumerComparing(ID, sessionId, Integer.parseInt(amoutFiltered), 1, BankId, productName, percentage, Service);
    }

    private void gotoPageConsumerPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.getRequestDispatcher("/Consumer.jsp").forward(request, response);
    }

    private void createRequestes(HttpServletRequest request) {
        request.setAttribute("Pagelanguage", Pagelanguage);
        request.setAttribute("sessionId", sessionId);
        request.setAttribute("PageCurrancy", pageCurrancy);
        request.setAttribute("PageName", pageName);
        request.setAttribute("city", city);
        request.setAttribute("pageLanguageName", pageLanguageName);
        request.setAttribute("dropDownsListWithCurrancy", dropDownsListWithCurrancy);

        request.setAttribute("depositListOffer", depositListOffer);
        request.setAttribute("cardsListOffer", cardsListOffer);
        request.setAttribute("agriculturalCreditListoffer", agriculturalCreditListoffer);
        request.setAttribute("carLoansListoffer", carLoansListoffer);
        request.setAttribute("consumerCreditListoffer", consumerCreditListoffer);
        request.setAttribute("MortgageListOffer", mortgageListOffer);
        request.setAttribute("productNameList", productNameList);
        request.setAttribute("BanksList", banksList);
        request.setAttribute("usefulArticlesList", usefulArticlesList);

        request.setAttribute("Amountfiltered", amoutFiltered);
        request.setAttribute("Amount", Amount);
        request.setAttribute("range", Amount);

        request.setAttribute("depositeAseList", depositeAseList);
        request.setAttribute("depositAllInRage", depositAllInRage);
        request.setAttribute("depositAllInSubRage", depositAllInSubRage);
        request.setAttribute("minAmount", amoutFiltered);
        request.setAttribute("maxAmount", MaxAmount);
        request.setAttribute("MaxAmounr", MaxAmount);
        request.setAttribute("arrow", arrow);
        request.setAttribute("arrow2", arrow2);
        request.setAttribute("WorningMessage", WorningMessage);
        request.setAttribute("DepositCompareSize", DepositCompareSize);
        request.setAttribute("name", "deposit");
        request.setAttribute("PageToGo", PageToGo);

        request.setAttribute("comparListDeposit", comparListDeposit);
        request.setAttribute("comparListMortgage", comparListMortgage);
        request.setAttribute("comparListConsumer", comparListConsumer);
        request.setAttribute("comparListCarLoan", comparListCarLoan);
        request.setAttribute("comparListMicro", comparListMicro);
        request.setAttribute("comparListAg", comparListAg);
        request.setAttribute("comparListCard", comparListCard);


        request.setAttribute("depositeAseList", depositeAseList);
        request.setAttribute("months", months);
        request.setAttribute("commentsList", commentsList);
        request.setAttribute("ccControllerList", ccControllerList);
      /*  request.setAttribute("getAgList", getAgList);
        request.setAttribute("getDpList", getDpList);
        request.setAttribute("getMoList", getMoList);
        request.setAttribute("getCoList", getCoList);
        request.setAttribute("getCaList", getCaList);
        request.setAttribute("getMiList", getMiList);*/
    }


    private void GetDropDownByCurrancy(List<DropDowns> dropDownsList, String pageCurrancy) throws SQLException {
        dropDownsListWithCurrancy = dropDownCurrancyHelper.getDropDownWithCurrancy(dropDownsList, pageCurrancy);
    }


    private void getApperance() throws SQLException {

        searchUpList = new ArrayList<>();
        depositeAseList = new ArrayList<>();

        searchUpList = searchDatabase();
        for (int i = 0; i < searchUpList.size(); i++) {
            int firstSearch = searchUpList.get(i).getCCMinAmount();
            String firstSearchCurrancy = searchUpList.get(i).getCurrancy();
            if (Integer.parseInt(amoutFiltered) >= firstSearch && firstSearchCurrancy.equals(pageCurrancy)) {
                int id = Integer.parseInt(String.valueOf(searchUpList.get(i).getCLId()));
                depositeAseList.addAll(FilteredList(id));
            }
        }

    }

    private List<ConsumerCredit> searchDatabase() throws SQLException {
        return consumerSpecialOfferHelper.getAppearnace();
    }

    private void getPageRange() throws SQLException {
        dropDownsList = dropDownHelper.getPageName(getPageNameArm(pageName));
    }

    private String getPageNameArm(String pageName) {
        return pageNameHelper.ArmPageName(pageName);
    }

    private void getMainPageRange() throws SQLException {
        dropDownsList = dropDownHelper.getPageName(pageName);
    }

    private void getPageLanguage(String language) {
        Pagelanguage = checkLanguageAndCurrency.checkLanguage(language);
        pageLanguageName = checkLanguageAndCurrency.checkLanguageName(language);
    }

    private void getPageName(HttpServletRequest request) {
        if (pageName == null) {
            pageName = "ՍՊԱՌՈՂԱԿԱՆ";
        } else {
            pageName = pageNameHelper.pageName(request);
        }
    }

    private void getCityFromUser(HttpServletRequest request) throws IOException {
        if (request.getParameter("city") == null) {
            city = lookUpProgram.start(request);
        } else {
            city = request.getParameter("city");
        }
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

    private void sessionControlling(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession(false);
        sessionId = session.getId();
        CompareHelper.sendSession(sessionId);
    }


    private void countHit() throws SQLException {
        hitCounter.countingHits(pageName, pageCurrancy, city, language, sessionId);
    }


    private void getProductnamesList() throws SQLException {
        ProductNameDaoController productNameDaoController = new ProductNameDaoController();
        productNameList = productNameDaoController.getAllProductNames();
    }

    private void getCardsSpecialOffers() throws SQLException {
        cardsListOffer = cardsSpecialOfferHelper.getStarted();
    }

    private void getAgSpecialOffers() throws SQLException {
        agriculturalCreditListoffer = agSpecialOfferHelper.getStarted();
    }

    private void getCarLoanSpecialOffers() throws SQLException {
        carLoansListoffer = carLoanSpecialOfferHelper.getStarted();
    }

    private void getConsumerSpecialOffers() throws SQLException {
        consumerCreditListoffer = consumerSpecialOfferHelper.getStarted();
    }

    private void getMortgageSpecialOffers() throws SQLException {
        mortgageListOffer = mortgageSpecialOfferHelper.getStarted();
    }

    private void getDepositSpecialOffers() throws SQLException {
        depositListOffer = depositSpecialOfferHelper.getStarted();
    }

    class DepositComaratorAmount2 implements Comparator<ConsumerCredit> {

        @Override
        public int compare(ConsumerCredit o1, ConsumerCredit o2) {
            return Integer.compare(o1.getCCMinAmount(), o2.getCCMinAmount());
        }
    }


    class DepositComarator2 implements Comparator<ConsumerCredit> {

        @Override
        public int compare(ConsumerCredit o1, ConsumerCredit o2) {
            return Double.compare(o1.getCCFactual(), o2.getCCFactual());
        }
    }

}
