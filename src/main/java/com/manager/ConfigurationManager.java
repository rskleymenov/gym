package com.manager;

import java.util.ResourceBundle;

public class ConfigurationManager {
    //all constants for reproducing paths to jsp
    public static final String ERROR_PAGE_PATH = "ERROR_PAGE_PATH";
    public static final String LOGIN_PAGE_PATH = "LOGIN_PAGE_PATH";
    public static final String USER_INFO_PATH = "USER_INFO_PATH";
    public static final String ADMIN_INFO_PATH = "ADMIN_INFO_PATH";
    public static final String FIND_USER_PATH = "FIND_USER_PATH";
    public static final String ADMIN_ADD_PAYMENT = "ADMIN_ADD_PAYMENT";
    public static final String ADMIN_ADD_COST = "ADMIN_ADD_COST";
    public static final String ADMIN_PAYMENT_INFO = "ADMIN_PAYMENT_INFO";
    public static final String ADMIN_STATISTIC_PATH = "ADMIN_STATISTIC_PATH";
    public static final String ADMIN_ADD_USER_PATH = "ADMIN_ADD_USER_PATH";
    public static final String ADMIN_UPDATE_USER_PATH = "ADMIN_UPDATE_USER_PATH";
    public static final String ADMIN_CHOOSED_USER_PATH = "ADMIN_CHOOSED_USER_PATH";
    public static final String USER_CHANGE_PASSWORD_PATH = "USER_CHANGE_PASSWORD_PATH";
    

    //path to config.properties that contains paths
    private static final String BUNDLE_NAME = "com.manager.config";

    // singleton of ConfigurationManager
    private static ConfigurationManager configurationManager = null;

    // resource bundle that return bundle
    private ResourceBundle resourceBundle = null;

    /**
     * Method that return same instance during all time
     * @return instance of ConfigurationManager
     */
    public static ConfigurationManager getInstance() {
        if (configurationManager == null) {
            configurationManager = new ConfigurationManager();
            configurationManager.resourceBundle = ResourceBundle.getBundle(BUNDLE_NAME);
        }
        return configurationManager;
    }

    public String getProperty(String key) {
        return (String) resourceBundle.getObject(key);
    }
}
