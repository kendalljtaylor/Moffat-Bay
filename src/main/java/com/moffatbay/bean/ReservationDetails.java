package com.moffatbay.bean;

//BRAVO TEAM
//MOFFAT BAY LODGE
//CSD440: CAPSTONE Project
//- Jessica Hall
//- Outhayvanh Somchaleun
//- Taylor Kendall
//- Victor Gregory


/**
 * A simple JavaBean to store reservation details
 * such as check-in, check-out, room type, number of guests, and status.
 */
public class ReservationDetails {
    private String checkInDate;
    private String checkOutDate;
    private String roomType;
    private int guests;
    private String status;  // Added status property

    // Getter and setter methods for all properties

    public String getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(String checkInDate) {
        this.checkInDate = checkInDate;
    }

    public String getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(String checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public int getGuests() {
        return guests;
    }

    public void setGuests(int guests) {
        this.guests = guests;
    }

    public String getStatus() {  // Getter for status
        return status;
    }

    public void setStatus(String status) {  // Setter for status
        this.status = status;
    }
}
