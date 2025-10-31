/* Guest Business Object */
package com.portfolio;

public class GuestBO {
    private String guestID;
    private String PW;
    private String phoneNumber;
    
    public GuestBO(String guestID, String phoneNumber) {
        this.guestID = guestID;
        this.phoneNumber = phoneNumber;
    }

    public GuestBO() {
        this.guestID = "";
        this.phoneNumber = "";
    }
    
    public String getGuestID() {
        return guestID;
    }
    
    public void setGuestID(String guestID) {
        this.guestID = guestID;
    }
    
    public String getPhoneNumber() {
        return phoneNumber;
    }
    
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPW() {
        return PW;
    }
    
    public void setPW(String PW) {
        this.PW = PW;
    }

    public void viewGuestInfo() {
        System.out.println("Guest ID: " + guestID);
        System.out.println("Phone Number: " + phoneNumber);
    }
}

