/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author Asus
 */
public class ChatSession {
    private String IDCard1, IDCard2;
    int chatID;

    public ChatSession() {
    }

    public ChatSession(String IDCard1, String IDCard2, int chatID) {
        this.IDCard1 = IDCard1;
        this.IDCard2 = IDCard2;
        this.chatID = chatID;
    }

    public String getIDCard1() {
        return IDCard1;
    }

    public void setIDCard1(String IDCard1) {
        this.IDCard1 = IDCard1;
    }

    public String getIDCard2() {
        return IDCard2;
    }

    public void setIDCard2(String IDCard2) {
        this.IDCard2 = IDCard2;
    }

    public int getChatID() {
        return chatID;
    }

    public void setChatID(int chatID) {
        this.chatID = chatID;
    }
    
}
