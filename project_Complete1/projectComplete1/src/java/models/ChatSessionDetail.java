/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 * Chat Session Detail model
 *
 * @author Mitto
 */
public class ChatSessionDetail {

    String timeSendChat, content, sendFrom;
    int chatID;

    /**
     * Constructor
     *
     * @param chatID
     * @param content
     * @param sendFrom
     */
    public ChatSessionDetail(int chatID, String content, String sendFrom) {
        this.chatID = chatID;
        this.content = content;
        this.sendFrom = sendFrom;
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
     * Set chat ID
     *
     * @param chatID
     */
    public void setChatID(int chatID) {
        this.chatID = chatID;
    }

    /**
     * Get time send chat
     *
     * @return
     */
    public String getTimeSendChat() {
        return timeSendChat;
    }

    /**
     * Set time send chat
     *
     * @param timeSendChat
     */
    public void setTimeSendChat(String timeSendChat) {
        this.timeSendChat = timeSendChat;
    }

    /**
     * Get content of the chat
     *
     * @return
     */
    public String getContent() {
        return content;
    }

    /**
     * Set content of the chat
     *
     * @param content
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * Get sender
     *
     * @return
     */
    public String getSendFrom() {
        return sendFrom;
    }

    /**
     * Set sender
     *
     * @param sendFrom
     */
    public void setSendFrom(String sendFrom) {
        this.sendFrom = sendFrom;
    }

}
