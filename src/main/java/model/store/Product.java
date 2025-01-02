package model.store;

public class Product {
    private int id;
    private String name;
    private double price;
    private String description;
    private String shippingInfo; // 配送信息
    private byte[] image;        // 图片
    private boolean isAvailable;  // 上架状态
    private boolean isDelete; //删除状态

    public Product(int id, String name, double price, String description, String shippingInfo, byte[] image, boolean isAvailable,boolean isDelete) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.description = description;
        this.shippingInfo = shippingInfo;
        this.image = image;
        this.isAvailable = isAvailable;
        this.isDelete = isDelete;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getShippingInfo() {
        return shippingInfo;
    }

    public void setShippingInfo(String shippingInfo) {
        this.shippingInfo = shippingInfo;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean available) {
        isAvailable = available;
    }

    public boolean isDelete() {
        return isDelete;
    }

    public void setDelete(boolean delete) {
        isDelete = delete;
    }
}
