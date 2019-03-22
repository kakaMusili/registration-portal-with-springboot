package com.kakamusili.andikwa.controllers;

import com.kakamusili.andikwa.model.User;
import com.kakamusili.andikwa.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@org.springframework.web.bind.annotation.RestController
public class RestController {

    @Autowired
    private UserService userService;

    @GetMapping("/")
    public String sayHello() {
        return "this is homepage";
    }

    @GetMapping("/saveuser")
    public String saveUser(@RequestParam String userName, @RequestParam String firstName,
                           @RequestParam String lastName, @RequestParam int age, @RequestParam String password) {
        User user = new User(userName, firstName, lastName, age, password);
        userService.saveMyUser(user);
        return "user saved";
    }
}
