package com.kakamusili.andikwa.controllers;

import com.kakamusili.andikwa.model.User;
import com.kakamusili.andikwa.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ApplicationController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/welcome", method = RequestMethod.GET)
    public String welcome(HttpServletRequest request)
    {
        request.setAttribute("mode","MODE_HOME");
        return "welcomepage";
    }

    @RequestMapping("/register")
    public String register(HttpServletRequest request)
    {
        request.setAttribute("mode","MODE_REGISTER");
        return "welcomepage";
    }

    @PostMapping("/save-user")
    public String registerUser(@ModelAttribute User user, BindingResult bindingResult,HttpServletRequest request)
    {
        userService.saveMyUser(user);
        request.setAttribute("mode","MODE_HOME");
        return "welcomepage";
    }

    @GetMapping("/show-users")
    public String showAllUsers(HttpServletRequest request)
    {
        request.setAttribute("users", userService.showAllUsers());
        request.setAttribute("mode","ALL_USERS");
        return "welcomepage";
    }

    @RequestMapping("/delete-user")
    public String deleteUser(@RequestParam int id,HttpServletRequest request)
    {
        userService.deleteMyUser(id);
        request.setAttribute("users", userService.showAllUsers());
        request.setAttribute("mode","ALL_USERS");
        return "welcomepage";
    }

    @RequestMapping("/edit-user")
    public String editUser(@RequestParam int id,HttpServletRequest request)
    {
        //userService.editMyUser(id);
        request.setAttribute("user", userService.editMyUser(id));
        request.setAttribute("mode","MODE_UPDATE");
        return "welcomepage";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest request)
    {
        request.setAttribute("mode","MODE_LOGIN");
        return "welcomepage";
    }

    @RequestMapping("/login-user")
    public String userLogin(@ModelAttribute User user,HttpServletRequest request)
    {
        if(userService.findByUserNameAndPassword(user.getUserName(),user.getPassword())!=null)
        {
            return "homepage";
        }
        else
        {
            request.setAttribute("error","Invalid Username or password " );
            request.setAttribute("mode","MODE_LOGIN");
            return "welcomepage";
        }

    }




}
