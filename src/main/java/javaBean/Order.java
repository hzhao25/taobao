package javaBean;

import java.sql.Blob;
import java.util.Base64;

public class Order {
    private String name;
    private Blob photo;
    private float price;
    private String introduction;
    private boolean isDispatch;
    private boolean isArrive;
    private boolean isEvaluate;

    public Order() {
    }

    public Order(String name, Blob photo, float price, String introduction) {
        this.name = name;
        this.photo = photo;
        this.price = price;
        this.introduction = introduction;
        this.isDispatch = false;
        this.isArrive = false;
        this.isEvaluate = false;
    }

    /**
     * 获取
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * 设置
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取
     * @return photo
     */
    public Blob getPhoto() {
        return photo;
    }

    /**
     * 设置
     * @param photo
     */
    public void setPhoto(Blob photo) {
        this.photo = photo;
    }

    /**
     * 获取
     * @return price
     */
    public float getPrice() {
        return price;
    }

    /**
     * 设置
     * @param price
     */
    public void setPrice(float price) {
        this.price = price;
    }

    /**
     * 获取
     * @return introduction
     */
    public String getIntroduction() {
        return introduction;
    }

    /**
     * 设置
     * @param introduction
     */
    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    /**
     * 获取
     * @return isDispatch
     */
    public boolean isIsDispatch() {
        return isDispatch;
    }

    /**
     * 设置
     * @param isDispatch
     */
    public void setIsDispatch(boolean isDispatch) {
        this.isDispatch = isDispatch;
    }

    /**
     * 获取
     * @return isArrive
     */
    public boolean isIsArrive() {
        return isArrive;
    }

    /**
     * 设置
     * @param isArrive
     */
    public void setIsArrive(boolean isArrive) {
        this.isArrive = isArrive;
    }

    /**
     * 获取
     * @return isEvaluate
     */
    public boolean isIsEvaluate() {
        return isEvaluate;
    }

    /**
     * 设置
     * @param isEvaluate
     */
    public void setIsEvaluate(boolean isEvaluate) {
        this.isEvaluate = isEvaluate;
    }

    public String toString() {
        return "Order{name = " + name + ", photo = " + photo + ", price = " + price + ", introduction = " + introduction + ", isDispatch = " + isDispatch + ", isArrive = " + isArrive + ", isEvaluate = " + isEvaluate + "}";
    }

    public String convertBlobToBase64(Blob photoBlob) {
        try {
            byte[] photoBytes = photoBlob.getBytes(1, (int) photoBlob.length());
            return Base64.getEncoder().encodeToString(photoBytes);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
