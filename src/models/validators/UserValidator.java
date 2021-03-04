package models.validators;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;

import models.User;
import utils.DBUtil;

public class UserValidator {
    public static List<String> validate(User u, Boolean nameDuplicateCheckFlag, Boolean passwordCheckFlag) {
        List<String> errors = new ArrayList<String>();

        String name_error = validateName(u.getName(), nameDuplicateCheckFlag);
        if (!name_error.equals("")) {
            errors.add(name_error);
        }
        String password_error = validatePassword(u.getPassword(), passwordCheckFlag);
        if (!password_error.equals("")) {
            errors.add(password_error);
        }
        return errors;
    }

    private static String validateName(String name, Boolean nameDuplicateCheckFlag) {
        if (name == null || name.equals("")) {
            return "ユーザー名を入力してください。";

        }

        if (nameDuplicateCheckFlag) {
            EntityManager em = DBUtil.createEntityManager();
            long users_count = (long) em.createNamedQuery("checkRegisteredName", Long.class).setParameter("name", name)
                    .getSingleResult();
            em.close();
            if (users_count > 0) {
                return "入力されたユーザー名はすでに使われています。";
            }
        }
        return "";
    }

    private static String validatePassword(String password, Boolean passwordCheckFlag) {
        if (passwordCheckFlag && (password == null || password.equals(""))) {
            return "パスワードを入力してください。";
        }
        return "";
    }
}
