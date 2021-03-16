/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author Admin
 */
public class rate {

    String IDRated, IDRater, rateStar,rateComment,dateComment;
    
    public void setDateComment(String dateComment) {
        this.dateComment = dateComment;
    }

    public String getDateComment() {
        return dateComment;
    }
    

    public rate(String IDRated, String IDRater, String rateStar, String rateComment) {
        this.IDRated = IDRated;
        this.IDRater = IDRater;
        this.rateComment = rateComment;
        this.rateStar = rateStar;
    }

    public void setIDRated(String IDRated) {
        this.IDRated = IDRated;
    }

    public void setIDRater(String IDRater) {
        this.IDRater = IDRater;
    }

    public void setRateComment(String rateComment) {
        this.rateComment = rateComment;
    }

    public void setRateStar(String rateStar) {
        this.rateStar = rateStar;
    }

    public String getIDRated() {
        return IDRated;
    }

    public String getIDRater() {
        return IDRater;
    }

    public String getRateComment() {
        return rateComment;
    }

    public String getRateStar() {
        return rateStar;
    }
}
