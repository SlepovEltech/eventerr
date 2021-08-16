package com.example.demo.controllers;

import com.example.demo.models.Event;
import com.example.demo.models.User;
import com.example.demo.repository.EventRepository;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.UUID;


@Controller
public class EventController {

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private EventRepository eventRepository;

    @GetMapping("/my-events")
    public String getEventManager(
            @AuthenticationPrincipal User currentUser,
            Model model
    ){
        model.addAttribute("eventManager", currentUser.getEvents());
        model.addAttribute("events", currentUser.getRegistrations());
        return "myEvents";
    }

    @GetMapping("/event/{event}")
    public String getEventLanding(
            @PathVariable Event event,
            @AuthenticationPrincipal User user,
            Model model){
        model.addAttribute("event", event);
        model.addAttribute("isSubscriber", event.getRegistrations().contains(user));
        model.addAttribute("isAuthor", event.getAuthor().equals(user));
        model.addAttribute("users", event.getRegistrations());
        return "event";
    }

    @PostMapping("/event/{event}/edit")
    public String editEvent(
            @AuthenticationPrincipal User user,
            @PathVariable Event event,
            @RequestParam String name,
            @RequestParam String description,
            @RequestParam Date date,
            @RequestParam("file") MultipartFile file,
            Model model
    ) throws IOException {
        if(user.equals(event.getAuthor()))
        {
            if(file != null && !file.getOriginalFilename().isEmpty()){
                File uploadDir = new File(uploadPath);
                if(!uploadDir.exists()){
                    uploadDir.mkdir();
                }
                String uuidFile = UUID.randomUUID().toString();
                String resultFileName = uuidFile + "_" + file.getOriginalFilename();

                file.transferTo(new File(uploadPath+"/"+resultFileName));
                event.setFilename(resultFileName);
            }
            event.setDate(date);
            event.setDescription(description);
            event.setName(name);
            eventRepository.save(event);
        }
        return "redirect:/event/"+event.getId();
    }

    @GetMapping("/event/{event}/subscribe")
    public String subscribe(
            @AuthenticationPrincipal User user,
            @PathVariable Event event,
            Model model
    ){
        System.out.println("Test sub: "+event.getRegistrations().contains(user));
        event.getRegistrations().add(user);
        System.out.println("Подписка "+user.getUsername()+" "+event.getName());
        System.out.println("Test sub: "+event.getRegistrations().contains(user));

        eventRepository.save(event);
        return "redirect:/event/"+event.getId();
    }

    @GetMapping("/event/{event}/unsubscribe")
    public String unsubscribe(
            @AuthenticationPrincipal User user,
            @PathVariable Event event,
            Model model
    ){
        System.out.println("Test unsub: "+event.getRegistrations().contains(user));

        event.getRegistrations().remove(user);
        System.out.println("Отписка "+user.getUsername()+" "+event.getName());

        System.out.println("Test unsub: "+event.getRegistrations().contains(user));

        eventRepository.save(event);
        return "redirect:/event/"+event.getId();
    }

}
