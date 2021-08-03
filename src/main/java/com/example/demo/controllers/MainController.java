package com.example.demo.controllers;

import com.example.demo.models.Event;
import com.example.demo.models.User;
import com.example.demo.repository.EventRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.Map;
import java.util.UUID;

@Controller
public class MainController {

    private EventRepository eventRepository;

    @Value("${upload.path}")
    private String uploadPath;

    @Autowired
    public MainController(EventRepository eventRepository) {
        this.eventRepository = eventRepository;
    }

    @GetMapping
    public String getAll(Map<String, Object> model){
        Iterable<Event> events = eventRepository.findAll();
        model.put("events", events);
        return "main";
    }

    @PostMapping("/main")
    public String addEvent(@AuthenticationPrincipal User user,
                           @RequestParam String name,
                           @RequestParam String description,
                           @RequestParam Date date,
                           @RequestParam("file") MultipartFile file,
                           Map<String, Object> model) throws IOException {

        Event newEvent = new Event(user, name, date, description);

        if(file != null && !file.getOriginalFilename().isEmpty()){
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }
            String uuidFile = UUID.randomUUID().toString();
            String resultFileName = uuidFile + "_" + file.getOriginalFilename();

            file.transferTo(new File(uploadPath+"/"+resultFileName));
            newEvent.setFilename(resultFileName);

        }
        eventRepository.save(newEvent);

        Iterable<Event> events = eventRepository.findAll();
        model.put("events", events);
        return "main";
    }

}
