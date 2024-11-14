package com.empmanagement.util;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class JsonUtil {

    private static final String FILE_PATH = "C:\\Users\\MadhuryaB\\eclipse-workspace\\EmployeeManagement\\employees.json"; // Update with your actual path

    public static JSONArray readJSONFromFile() {
        JSONArray jsonArray = new JSONArray();

        try (FileReader fileReader = new FileReader(FILE_PATH)) {
            jsonArray = new JSONArray(new JSONTokener(fileReader));
        } catch (IOException e) {
            e.printStackTrace();
        }

        return jsonArray;
    }

    public static void writeJSONToFile(JSONArray jsonArray) {
        try (FileWriter fileWriter = new FileWriter(FILE_PATH)) {
            fileWriter.write(jsonArray.toString(4)); // Indent with 4 spaces for readability
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}




