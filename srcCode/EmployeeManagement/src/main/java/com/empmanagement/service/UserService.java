package com.empmanagement.service;
import com.empmanagement.model.Employee;
import com.empmanagement.model.User;
import com.empmanagement.util.JsonUtil;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;

public class UserService {

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
    public static User getUserByUsername(String username) {
        for (int i = 0; i < usersArray.length(); i++) {
            JSONObject userObj = usersArray.getJSONObject(i);
            if (userObj.getString("username").equals(username)) {
                String foundUsername = userObj.getString("username");
                String email = userObj.getString("email");
                String password = userObj.getString("password");
                return new User(foundUsername, email, password);
            }
        }
        return null; // Return null if user not found
    }
	public static List<Employee> getAllEmployees() {
		// TODO Auto-generated method stub
		return null;
	}
}
