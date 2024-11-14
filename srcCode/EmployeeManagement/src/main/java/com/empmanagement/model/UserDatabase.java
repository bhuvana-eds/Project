package com.empmanagement.model;

import com.empmanagement.util.JsonUtil;
import com.empmanagement.util.User;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

public class UserDatabase {

    private static JSONArray usersArray = JsonUtil.readJSONFromFile();

    public static boolean isValidUser(String username, String password) {
        for (int i = 0; i < usersArray.length(); i++) {
            JSONObject userObj = usersArray.getJSONObject(i);
            if (userObj.getString("username").equals(username) && userObj.getString("password").equals(password)) {
                return true;
            }
        }
        return false;
    }

    public static void addUser(String username, String password) {
        JSONObject newUser = new JSONObject();
        newUser.put("username", username);
        newUser.put("password", password);

        usersArray.put(newUser);
        JsonUtil.writeJSONToFile(usersArray);
    }

    public static List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        for (int i = 0; i < usersArray.length(); i++) {
            JSONObject userObj = usersArray.getJSONObject(i);
            String username = userObj.getString("username");
            String password = userObj.getString("password");
            users.add(new User(username, password));
        }
        return users;
    }
}
