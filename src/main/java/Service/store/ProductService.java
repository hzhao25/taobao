package Service.store;

import dao.store.ProductDao;
import model.store.Product;

import java.util.List;

public class ProductService {
    private ProductDao productDao = new ProductDao();

    public void addProduct(Product product) {
        productDao.addProduct(product);
    }

    public void deleteProduct(int id) {
        productDao.deleteProduct(id);
    }

    public void updateProduct(Product product) {
        productDao.updateProduct(product);
    }

    public List<Product> getAllProducts() {
        return productDao.getAllProducts();
    }

    public void setProductAvailability(int id, boolean isAvailable) {
        productDao.setProductAvailability(id, isAvailable);
    }
}
