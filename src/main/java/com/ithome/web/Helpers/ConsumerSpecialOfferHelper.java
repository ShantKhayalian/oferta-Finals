package com.ithome.web.Helpers;

import com.ithome.web.AdminDao.ConsumerCreditDaoController;
import com.ithome.web.Bean.ConsumerCredit;

import java.sql.SQLException;
import java.util.List;

public class ConsumerSpecialOfferHelper implements SpecialOfferHellper<ConsumerCredit> {
    private ConsumerCreditDaoController consumerCreditDaoController = new ConsumerCreditDaoController();
    @Override
    public List<ConsumerCredit> getStarted() throws SQLException {
        return consumerCreditDaoController.getConsumerWithSpecialOffer();
    }

    @Override
    public List<ConsumerCredit> getAppearnace() throws SQLException {
        return consumerCreditDaoController.getConsumerCreditAppearance();
    }



}
