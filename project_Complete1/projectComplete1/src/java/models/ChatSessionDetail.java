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
public class ChatSessionDetail {
    String timeSendChat, content,sendFrom;
    int chatID;

    public ChatSessionDetail(int chatID, String content, String sendFrom) {
        this.chatID = chatID;
        this.content = content;
        this.sendFrom = sendFrom;
    }

    public int getChatID() {
        return chatID;
    }

    public void setChatID(int chatID) {
        this.chatID = chatID;
    }

    public String getTimeSendChat() {
        return timeSendChat;
    }

    public void setTimeSendChat(String timeSendChat) {
        this.timeSendChat = timeSendChat;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getSendFrom() {
        return sendFrom;
    }

    public void setSendFrom(String sendFrom) {
        this.sendFrom = sendFrom;
    }
    
}
