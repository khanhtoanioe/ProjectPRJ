/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 * Customer Model
 *
 * @author Mitto
 */
public class customer {

    private String IDCard, passWord, name, phoneNumber, address, dateOfBirth, email;

    /**
     * Empty Constructor
     */
    public customer() {
    }

    /**
     * Constructor for create new customer (create new user name and password,
     * other field will be filled in later)
     *
     * @param IDCard
     * @param passWord
     */
    public customer(String IDCard, String passWord) {
        this.IDCard = IDCard;
        this.passWord = passWord;
    }

    /**
     * Constructor
     *
     * @param IDCard
     * @param passWord
     * @param name
     * @param phoneNumber
     * @param address
     * @param dateOfBirth
     * @param email
     */
    public customer(String IDCard, String passWord, String name, String phoneNumber, String address, String dateOfBirth, String email) {
        this.IDCard = IDCard;
        this.passWord = passWord;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
    }

    public customer(String IDCard, String name, String phoneNumber, String address, String dateOfBirth, String email) {
        this.IDCard = IDCard;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.dateOfBirth = dateOfBirth;
        this.email = email;
    }

    /**
     * Get ID Card
     *
     * @return
     */
    public String getIDCard() {
        return IDCard;
    }

    /**
     * Set ID Card
     *
     * @param IDCard
     */
    public void setIDCard(String IDCard) {
        this.IDCard = IDCard;
    }

    /**
     * Set password
     *
     * @param passWord
     */
    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    /**
     * Set name
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * Set Phone number
     *
     * @param phoneNumber
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * Set address
     *
     * @param address
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * Set Date of birth
     *
     * @param dateOfBirth
     */
    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    /**
     * Set email
     *
     * @param email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Get password
     *
     * @return
     */
    public String getPassWord() {
        return passWord;
    }

    /**
     * Get name
     *
     * @return
     */
    public String getName() {
        return name;
    }

    /**
     * Get Phone number
     *
     * @return
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * Get address
     *
     * @return
     */
    public String getAddress() {
        return address;
    }

    /**
     * Get date of birth
     *
     * @return
     */
    public String getDateOfBirth() {
        return dateOfBirth;
    }

    /**
     * Get email
     *
     * @return
     */
    public String getEmail() {
        return email;
    }
}
