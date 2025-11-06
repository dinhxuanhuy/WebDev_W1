package murach.data;

import java.io.*;
import murach.business.User;

public class UserDB {
    private static final String filePath = "C:/data/users.txt";

    public static void insert(User user) {
        try (PrintWriter out = new PrintWriter(
                new FileWriter(filePath, true))) {
            out.println(user.getEmail() + "|" +
                    user.getFirstName() + "|" +
                    user.getLastName());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
