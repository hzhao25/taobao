package module.individual;

import dao.individual.CRUD;
import javaBean.*;
import dao.individual.*;

import java.sql.SQLException;
import java.util.List;

public class Service {
    public static List<Goods> searchAllGoods() throws SQLException, ClassNotFoundException {
        List<Goods> goods= CRUD.selectAllGoods();
        return goods;
    }

}
