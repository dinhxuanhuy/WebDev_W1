package murach.data;

import java.io.*;
import murach.business.User;

public class UserDB {
    private static final String filePath = "C:/data/users.txt";

    public static void insert(User user) {
        System.out.println("Inserting user: " + user);

    }
}
