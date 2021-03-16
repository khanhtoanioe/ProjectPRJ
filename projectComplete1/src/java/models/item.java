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
public class item {

    int itemID;
    String ownerID, Name;
    boolean status;
    String description, category;

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
