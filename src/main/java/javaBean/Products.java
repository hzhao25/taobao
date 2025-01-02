package javaBean;
import java.math.BigDecimal;
import java.util.Date;

public class Products {

    private String name;            // 商品名称
    private BigDecimal price;       // 商品价格
    private Date createTime;        // 商品创建时间
    private Date updateTime;        // 商品更新时间
    private String description;     // 商品描述
    private String shippingInfo;    // 配送描述
    private byte[] image;           // 商品图片，存储为二进制数据（BLOB）

    // 构造函数
    public Products(String name, BigDecimal price, Date createTime, Date updateTime, String description, String shippingInfo, byte[] image) {
        this.name = name;
        this.price = price;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.description = description;
        this.shippingInfo = shippingInfo;
        this.image = image;
    }

    // 默认构造函数
    public Products() {
    }

    // Getter 和 Setter 方法
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
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

    @Override
    public String toString() {
        return "Product{" +
                "name='" + name + '\'' +
                ", price=" + price +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", description='" + description + '\'' +
                ", shippingInfo='" + shippingInfo + '\'' +
                ", image=" + (image != null ? "存在" : "无") +
                '}';
    }
}
