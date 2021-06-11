package models.validators;

import java.util.ArrayList;
import java.util.List;

import models.Menu;

public class MenuValidator {
    public static List<String> validate(Menu m) {
        List<String> errors = new ArrayList<String>();

        String menu_name_error = _validateMenuName(m.getMenu_name());
        if (!menu_name_error.equals("")) {
            errors.add(menu_name_error);
        }
        return errors;
    }

    private static String _validateMenuName(String menu_name) {
        if (menu_name == null || menu_name.equals("")) {
            return "メニュー名を入力してください。";
        }
        return "";

    }

}
