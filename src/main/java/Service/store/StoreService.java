package Service.store;

import dao.store.StoreDao;
import model.store.Store;

public class StoreService {
    private StoreDao storeDao = new StoreDao();

    public Store getStore(int id) {
        return storeDao.getStoreById(id);
    }

    public void updateStore(Store store) {
        storeDao.updateStore(store);
    }
}
