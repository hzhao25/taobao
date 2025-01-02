package model.store;

import java.util.Date;

public class Store {
    private int id;
    private String storeName;
    private String description;
    private int storeDuration;
    private String location;
    private Date openingTime;

    public Store(int id, String storeName, String description, int storeDuration, String location, Date openingTime) {
        this.id = id;
        this.storeName = storeName;
        this.description = description;
        this.storeDuration = storeDuration;
        this.location = location;
        this.openingTime = openingTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStoreName() {
        return storeName;
    }

    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStoreDuration() {
        return storeDuration;
    }

    public void setStoreDuration(int storeDuration) {
        this.storeDuration = storeDuration;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getOpeningTime() {
        return openingTime;
    }

    public void setOpeningTime(Date openingTime) {
        this.openingTime = openingTime;
    }

    @Override
    public String toString() {
        return "Store{" +
                "id=" + id +
                ", storeName='" + storeName + '\'' +
                ", description='" + description + '\'' +
                ", storeDuration=" + storeDuration +
                ", location='" + location + '\'' +
                ", openingTime=" + openingTime +
                '}';
    }
}
