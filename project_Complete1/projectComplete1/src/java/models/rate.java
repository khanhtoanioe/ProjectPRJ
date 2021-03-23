/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 * Rate model
 *
 * @author Mitto
 */
public class rate {

    String IDRated, IDRater, rateStar, rateComment, dateComment;

    /**
     * Set comment date
     *
     * @param dateComment
     */
    public void setDateComment(String dateComment) {
        this.dateComment = dateComment;
    }

    /**
     * Get comment date
     *
     * @return comment date
     */
    public String getDateComment() {
        return dateComment;
    }

    /**
     * Constructor
     *
     * @param IDRated
     * @param IDRater
     * @param rateStar
     * @param rateComment
     */
    public rate(String IDRated, String IDRater, String rateStar, String rateComment) {
        this.IDRated = IDRated;
        this.IDRater = IDRater;
        this.rateComment = rateComment;
        this.rateStar = rateStar;
    }

    /**
     * Set ID rated
     *
     * @param IDRated
     */
    public void setIDRated(String IDRated) {
        this.IDRated = IDRated;
    }

    /**
     * Set ID rater
     *
     * @param IDRater
     */
    public void setIDRater(String IDRater) {
        this.IDRater = IDRater;
    }

    /**
     * Set comment
     *
     * @param rateComment
     */
    public void setRateComment(String rateComment) {
        this.rateComment = rateComment;
    }

    /**
     * Set rate star
     *
     * @param rateStar
     */
    public void setRateStar(String rateStar) {
        this.rateStar = rateStar;
    }

    /**
     * Get ID rated
     *
     * @return ID rated
     */
    public String getIDRated() {
        return IDRated;
    }

    /**
     * Get ID rater
     *
     * @return ID rater
     */
    public String getIDRater() {
        return IDRater;
    }

    /**
     * Get comment
     *
     * @return comment
     */
    public String getRateComment() {
        return rateComment;
    }

    /**
     * Get rate star
     *
     * @return rate star
     */
    public String getRateStar() {
        return rateStar;
    }
}
