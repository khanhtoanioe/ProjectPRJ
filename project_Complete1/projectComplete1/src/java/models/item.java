/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Blob;

/**
 * Item model
 *
 * @author Mitto
 */
public class item {

    int itemID;
    String ownerID, Name;
    boolean status;
    String description, category;
    Blob image1, image2, image3, image4;

    /**
     * Set image 1
     *
     * @param image1
     */
    public void setImage1(Blob image1) {
        this.image1 = image1;
    }

    /**
     * Set image 2
     *
     * @param image2
     */
    public void setImage2(Blob image2) {
        this.image2 = image2;
    }

    /**
     * Set image 3
     *
     * @param image3
     */
    public void setImage3(Blob image3) {
        this.image3 = image3;
    }

    /**
     * Set image 4
     *
     * @param image4
     */
    public void setImage4(Blob image4) {
        this.image4 = image4;
    }

    /**
     * Get status
     *
     * @return status boolean value
     */
    public boolean isStatus() {
        return status;
    }

    /**
     * Get image 1
     *
     * @return image 1
     */
    public Blob getImage1() {
        return image1;
    }

    /**
     * Get image 2
     *
     * @return image 2
     */
    public Blob getImage2() {
        return image2;
    }

    /**
     * Get image 3
     *
     * @return image 3
     */
    public Blob getImage3() {
        return image3;
    }

    /**
     * Get image 4
     *
     * @return image 4
     */
    public Blob getImage4() {
        return image4;
    }

    /**
     * Constructor
     *
     * @param itemID
     * @param ownerID
     * @param Name
     * @param status
     * @param description
     * @param category
     * @param image1
     * @param image2
     * @param image3
     * @param image4
     */
    public item(int itemID, String ownerID, String Name, boolean status, String description, String category, Blob image1, Blob image2, Blob image3, Blob image4) {
        this.itemID = itemID;
        this.ownerID = ownerID;
        this.Name = Name;
        this.status = status;
        this.description = description;
        this.category = category;
        this.image1 = image1;
        this.image2 = image2;
        this.image3 = image3;
        this.image4 = image4;
    }

    /**
     * Empty Constructor
     */
    public item() {
    }

    /**
     * Constructor
     *
     * @param itemID
     * @param Name
     * @param description
     * @param category
     */
    public item(int itemID, String Name, String description, String category) {
        this.itemID = itemID;
        this.Name = Name;
        this.description = description;
        this.category = category;
    }

    /**
     * Constructor
     *
     * @param itemID
     * @param ownerID
     * @param Name
     * @param status
     * @param description
     * @param category
     */
    public item(int itemID, String ownerID, String Name, boolean status, String description, String category) {
        this.itemID = itemID;
        this.ownerID = ownerID;
        this.Name = Name;
        this.status = status;
        this.description = description;
        this.category = category;
    }

    /**
     * Get item id
     *
     * @return item id
     */
    public int getItemID() {
        return itemID;
    }

    /**
     * Get owner id
     *
     * @return owner id
     */
    public String getOwnerID() {
        return ownerID;
    }

    /**
     * Get name
     *
     * @return name
     */
    public String getName() {
        return Name;
    }

    /**
     * Get status
     *
     * @return status boolean value
     */
    public boolean isAvailable() {
        return status;
    }

    /**
     * Get status
     *
     * @return status integer value
     */
    public int getStatus() {
        int status;
        if (this.status == true) {
            status = 1;
        } else {
            status = 0;
        }
        return status;
    }

    /**
     * Get description
     *
     * @return description
     */
    public String getDescription() {
        return description;
    }

    /**
     * Get Category
     *
     * @return Category
     */
    public String getCategory() {
        return category;
    }

    /**
     * Set item ID
     *
     * @param itemID
     */
    public void setItemID(int itemID) {
        this.itemID = itemID;
    }

    /**
     * Set owner ID
     *
     * @param ownerID
     */
    public void setOwnerID(String ownerID) {
        this.ownerID = ownerID;
    }

    /**
     * Set name
     *
     * @param Name
     */
    public void setName(String Name) {
        this.Name = Name;
    }

    /**
     * Set status
     *
     * @param status
     */
    public void setStatus(boolean status) {
        this.status = status;
    }

    /**
     * Set status
     *
     * @param status
     */
    public void setStatus(int status) {
        if (status == 1) {
            this.status = true;
        } else if (status == 0) {
            this.status = false;
        }
    }

    /**
     * Set description
     *
     * @param description
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * Set category
     *
     * @param category
     */
    public void setCategory(String category) {
        this.category = category;
    }
}
