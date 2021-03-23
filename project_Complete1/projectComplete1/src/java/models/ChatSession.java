/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 * Model Chat Session
 *
 * @author Mitto
 */
public class ChatSession {

    private String IDCard1, IDCard2;
    int chatID;

    /**
     * Empty Constructor
     */
    public ChatSession() {
    }

    /**
     * Constructor
     *
     * @param IDCard1
     * @param IDCard2
     * @param chatID
     */
    public ChatSession(String IDCard1, String IDCard2, int chatID) {
        this.IDCard1 = IDCard1;
        this.IDCard2 = IDCard2;
        this.chatID = chatID;
    }

    /**
     * Get Id Card 1
     *
     * @return
     */
    public String getIDCard1() {
        return IDCard1;
    }

    /**
     * Set Id Card 2
     *
     * @param IDCard1
     */
    public void setIDCard1(String IDCard1) {
        this.IDCard1 = IDCard1;
    }

    /**
     * Get Id card 2
     *
     * @return
     */
    public String getIDCard2() {
        return IDCard2;
    }

    /**
     * Set id Card 2
     *
     * @param IDCard2
     */
    public void setIDCard2(String IDCard2) {
        this.IDCard2 = IDCard2;
    }

    /**
     * Get chat ID
     *
     * @return
     */
    public int getChatID() {
        return chatID;
    }

    /**
     * Set Chat ID
     *
     * @param chatID
     */
    public void setChatID(int chatID) {
        this.chatID = chatID;
    }

}
