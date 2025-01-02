package javaBean;

import java.sql.Blob;
import java.util.Base64;

public class Goods{
    private String name;
    private Blob photo;
    private float price;
    private String introduction;

    public Goods() {
    }

    public Goods(String name, Blob photo, float price, String introduction) {
        this.name = name;
        this.photo = photo;
        this.price = price;
        this.introduction = introduction;
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

    public String toString() {
        return "Goods{name = " + name + ", photo = " + photo + ", price = " + price + ", introduction = " + introduction + "}";
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
