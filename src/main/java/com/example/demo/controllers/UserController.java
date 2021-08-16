package com.example.demo.controllers;

import com.example.demo.models.Role;
import com.example.demo.models.User;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    @PreAuthorize("hasAuthority('ADMIN')")
    public String getUserList(Model model){
        List<User> userList = userRepository.findAll();
        model.addAttribute("users", userList);
        return "userList";
    }

    @GetMapping("{user}")
    @PreAuthorize("hasAuthority('ADMIN')")
    public String userEditForm(@PathVariable User user, Model model){
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "userEdit";
    }

    @PostMapping
    @PreAuthorize("hasAuthority('ADMIN')")
    public String userEditSave(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("userId") User user,
            Model model
    ){
        user.setUsername(username);
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());

        user.getRoles().clear();
        for(String key : form.keySet()){
            if(roles.contains(key)){
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
        return "redirect:/user";
    }

    @GetMapping("account")
    public String getAccount(
            @AuthenticationPrincipal User user,
            Model model
    ){
        model.addAttribute("user", user);
        return "account";
    }

    @PostMapping("account")
    public String editAccount(
            @AuthenticationPrincipal User user,
            @RequestParam String username,
            @RequestParam String first_name,
            @RequestParam String last_name,
            @RequestParam String password,
            @RequestParam String email,
            Model model
    ){
        user.setUsername(username);
        user.setFirst_name(first_name);
        user.setLast_name(last_name);
        user.setPassword(password);
        user.setEmail(email);
        model.addAttribute("message", "Изменения успешно сохранены");
        userRepository.save(user);

        System.out.println(user.toString());
        return "account";
    }
}
