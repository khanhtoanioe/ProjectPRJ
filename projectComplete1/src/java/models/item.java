/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import java.sql.Blob;

/**
 *
 * @author Admin
 */
public class item {

    int itemID;
    String ownerID, Name;
    boolean status;
    String description, category;
    Blob image1,image2,image3,image4;

    public void setImage1(Blob image1) {
        this.image1 = image1;
    }

    public void setImage2(Blob image2) {
        this.image2 = image2;
    }

    public void setImage3(Blob image3) {
        this.image3 = image3;
    }

    public void setImage4(Blob image4) {
        this.image4 = image4;
    }

    public boolean isStatus() {
        return status;
    }

    public Blob getImage1() {
        return image1;
    }

    public Blob getImage2() {
        return image2;
    }

    public Blob getImage3() {
        return image3;
    }

    public Blob getImage4() {
        return image4;
    }

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

    public item() {
    }

    public item(int itemID, String ownerID, String Name, boolean status, String description, String category) {
        this.itemID = itemID;
        this.ownerID = ownerID;
        this.Name = Name;
        this.status = status;
        this.description = description;
        this.category = category;
    }

    public int getItemID() {
        return itemID;
    }

    public String getOwnerID() {
        return ownerID;
    }

    public String getName() {
        return Name;
    }

    public boolean isAvailable() {
        return status;
    }

    public int getStatus() {
        int status;
        if (this.status == true) {
            status = 1;
        } else {
            status = 0;
        }
        return status;
    }

    public String getDescription() {
        return description;
    }

    public String getCategory() {
        return category;
    }

    public void setItemID(int itemID) {
        this.itemID = itemID;
    }

    public void setOwnerID(String ownerID) {
        this.ownerID = ownerID;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public void setStatus(int status) {
        if (status == 1) {
            this.status = true;
        } else if (status == 0) {
            this.status = false;
        }
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setCategory(String category) {
        this.category = category;
    }
}
