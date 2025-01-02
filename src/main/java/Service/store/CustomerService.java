package Service.store;

import dao.store.CustomerDao;
import model.store.Customer;

public class CustomerService {
    private CustomerDao customerDao = new CustomerDao();

    public Customer getCustomerById(int id) {
        return customerDao.getCustomerById(id);
    }
}
