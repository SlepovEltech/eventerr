package com.example.demo.controllers;

import com.example.demo.models.Event;
import com.example.demo.models.User;
import com.example.demo.repository.EventRepository;
import com.example.demo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.Optional;
import java.util.UUID;


@Controller
public class EventController {

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    private EventRepository eventRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping("/my-events")
    public String getEventManager(
            @AuthenticationPrincipal User currentUser,
            Model model
    ){
        currentUser = userRepository.findUserById(currentUser.getId());
        model.addAttribute("eventManager", currentUser.getEvents());
        model.addAttribute("events", currentUser.getRegistrations());
        return "myEvents";
    }

    @GetMapping("/event/{event}")
    public String getEventLanding(
            @PathVariable Event event,
            @AuthenticationPrincipal User user,
            Model model){
        Event eventFromDB = eventRepository.findEventById(event.getId());
        model.addAttribute("event", eventFromDB);
        model.addAttribute("isSubscriber", eventFromDB.getRegistrations().contains(user));
        model.addAttribute("isAuthor", eventFromDB.getAuthor().equals(user));
        model.addAttribute("guestID", user.getId());
        model.addAttribute("users", eventFromDB.getRegistrations());
        return "event";
    }

    @PostMapping("/event/{event}/edit")
    public String editEvent(
            @AuthenticationPrincipal User user,
            @PathVariable Event event,
            @RequestParam String name,
            @RequestParam String description,
            @RequestParam Date date,
            //@RequestParam("file") MultipartFile file,
            @RequestParam String file,
            @RequestParam String maptag,
            Model model
    ) throws IOException {
        if(user.equals(event.getAuthor()))
        {
//            if(file != null && !file.getOriginalFilename().isEmpty()){
//                File uploadDir = new File(uploadPath);
//                if(!uploadDir.exists()){
//                    uploadDir.mkdir();
//                }
//                String uuidFile = UUID.randomUUID().toString();
//                String resultFileName = uuidFile + "_" + file.getOriginalFilename();
//
//                file.transferTo(new File(uploadPath+"/"+resultFileName));
//                event.setFilename(resultFileName);
//            }
            event.setDate(date);
            event.setDescription(description);
            event.setName(name);
            event.setFilename(file);
            event.setMaptag(maptag);
            eventRepository.save(event);
        }
        return "redirect:/event/"+event.getId();
    }

    @GetMapping("/event/{event}/subscribe")
    //@Transactional(propagation=Propagation.REQUIRES_NEW)
    public String subscribe(
            @AuthenticationPrincipal User user,
            @PathVariable Event event,
            Model model
    ){
        //Event eventFromDb = eventRepository.findEventById(event.getId());
        //event.getRegistrations().add(user);
        //eventRepository.save(event);
        user.getRegistrations().add(event);
        userRepository.save(user);
        return "redirect:/event/"+event.getId();
    }

    @GetMapping("/event/{event}/unsubscribe")
    @Transactional(propagation= Propagation.REQUIRES_NEW)
    public String unsubscribe(
            @AuthenticationPrincipal User user,
            @PathVariable Event event,
            Model model
    ){
        //Event eventFromDb = eventRepository.findEventById(event.getId());
        //event.getRegistrations().remove(user);
        //eventRepository.save(event);
        user.getRegistrations().remove(event);
        userRepository.save(user);
        return "redirect:/event/"+event.getId();
    }

    @GetMapping("/event/{event}/delete")
    @Transactional(propagation= Propagation.REQUIRES_NEW)
    public String delete(
            @AuthenticationPrincipal User user,
            @PathVariable Event event,
            Model model
    ){
        eventRepository.delete(event);
        //user.getRegistrations().remove(event);
        //userRepository.save(user);
        return "redirect:/event";
    }

    @GetMapping("/event/{event}/{guest}")
    public String getUserRegistration(
            @PathVariable Event event,
            @PathVariable User guest,
            @AuthenticationPrincipal User user,
            Model model){
        Event eventFromDB = eventRepository.findEventById(event.getId());

        if(eventFromDB.getAuthor().equals(user)){
            model.addAttribute("guest", guest);
            model.addAttribute("event", event);
            return "guestsubmit";
        }
        else {
            return "redirect:/event/" + eventFromDB.getId();
        }
    }

    @GetMapping("/event/{event}/{guest}/submit")
    public String getUserRegisSubmit(
            @PathVariable Event event,
            @PathVariable User guest,
            @AuthenticationPrincipal User user,
            Model model){
        Event eventFromDB = eventRepository.findEventById(event.getId());
        return "redirect:/event/" + eventFromDB.getId();
    }

}
