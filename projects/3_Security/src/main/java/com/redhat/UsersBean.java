package com.redhat;

import javax.inject.Named;
import javax.inject.Singleton;
import java.util.ArrayList;

@Singleton
@Named("usersBean")
public class UsersBean {

    ArrayList<User> users = new ArrayList<User>();

    public ArrayList<User> getUsers() {
        return users;
    }

    public User getUser(Integer id) {
        for (User user:users)
            if (user.getId().equals(id))
                return user;

        return null;
    }

    public User createUser(User user) {
        users.add(user);

        return user;
    }

    public User updateUser(User userToUpdate) {
        for (User user:users)
            if (user.getId().equals(userToUpdate.getId())) {
                user.setUsername(userToUpdate.getUsername());

                return user;
            }

        return null;
    }

    public boolean deleteUser(Integer id) {
        for (User user:users)
            if (user.getId().equals(id)) {
                return users.remove(user);
            }

        return false;
    }
}
