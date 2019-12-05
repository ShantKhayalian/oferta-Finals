package com.ithome.web.Helpers;

import com.ithome.web.Constances.Constance;
import com.ithome.web.ExChangeRateController.ApiService;
import com.ithome.web.ExChangeRateController.GetCurrentRateController;

import java.util.Arrays;
import java.util.LinkedHashSet;
import java.util.Set;

public class getCurrancyRates {
    private String[] myArray;
    private Set<String> setingSet = new LinkedHashSet<>();

    String [] filteringNames ={ "<soap:Envelope xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">",
            "<?xml version=\"1.0\" encoding=\"UTF-16\"?>",
            "<soap:Body>",
            "<ExchangeRatesLatestResponse>",
            "<ExchangeRatesLatestResult>",
            "<CurrentDate>",
            "</CurrentDate>",
            "<NextAvailableDate xsi:nil=\"true\"/>",
            "<PreviousAvailableDate>",
            "</PreviousAvailableDate>",
            "<Rates>",
            "</Rates>",
            "</ExchangeRatesLatestResult>",
            "</ExchangeRatesLatestResponse>",
            "</soap:Body>",
            "</soap:Envelope>",
            "<ISO>",
            "</ISO>",
            "<Amount>",
            "</Amount>",
            "<Rate>",
            "</Rate>",
            "<ExchangeRate>",
            "</ExchangeRate>",
            "<Difference>",
            "</Difference>"};

    private GetCurrentRateController rateController = new GetCurrentRateController();


    public String readExcange(){
        return rateController.getCurrentRate(ApiService.getCurrentRate, Constance.XML_BODY);
    }
    public String[] getReadExChange()  {
        String node = readExcange();
        String str = node;
        filterXml(str);
        FilterTheArray();
        addToSet();
        return GetFinalArray();
    }

    private void FilterTheArray() {
        GetFinalArray();
    }

    private String [] GetFinalArray() {
        return setingSet.toArray(new String[setingSet.size()]);
    }

    private void addToSet() {
        setingSet.addAll(Arrays.asList(myArray));
    }

    private void ConvertToStringArray(String str) {
        myArray = str.trim().split("    ");
    }
    private void filterXml(String str) {
       for (int i = 0; i <filteringNames.length ; i++) {
            String nameToRemove = filteringNames[i];
            String toReplace ="    ";
            str = str.replace(nameToRemove,toReplace);
            ConvertToStringArray(str);
        }

    }
}

