package javaBean;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Base64;

public class MyComment {
    private String name;
    private Blob photo;
    private float price;
    private String introduction;
    private int comment_score;
    private String comment;

    public MyComment() {
    }

    public MyComment(String name, Blob photo, float price, String introduction, int comment_score, String comment) {
        this.name = name;
        this.photo = photo;
        this.price = price;
        this.introduction = introduction;
        this.comment_score = comment_score;
        this.comment = comment;
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
     * @return comment_score
     */
    public int getComment_score() {
        return comment_score;
    }

    /**
     * 设置
     * @param comment_score
     */
    public void setComment_score(int comment_score) {
        this.comment_score = comment_score;
    }

    /**
     * 获取
     * @return comment
     */
    public String getComment() {
        return comment;
    }

    /**
     * 设置
     * @param comment
     */
    public void setComment(String comment) {
        this.comment = comment;
    }

    public String toString() {
        return "MyComment{name = " + name + ", photo = " + photo + ", price = " + price + ", introduction = " + introduction + ", comment_score = " + comment_score + ", comment = " + comment + "}";
    }
}
