package com.persistance.factory;

public class DAOFactory {
    /**
     * Static method that return MySQLFactory
     *
     * @return instance of MySQLFactory
     */
    public static DAOMySQLFactory getMySQLFactory() {
        return new DAOMySQLFactory();
    }

}
