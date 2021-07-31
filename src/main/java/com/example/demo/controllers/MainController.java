package com.example.demo.controllers;

import com.example.demo.models.Event;
import com.example.demo.models.User;
import com.example.demo.repository.EventRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;
import java.util.Map;


@Controller
public class MainController {

    private EventRepository eventRepository;

    @Autowired
    public MainController(EventRepository eventRepository) {
        this.eventRepository = eventRepository;
    }

    @GetMapping()
    public String getAll(Map<String, Object> model){
        Iterable<Event> events = eventRepository.findAll();
        System.out.println(events);
        model.put("events", events);
        return "main";
    }

    @PostMapping
    public String addEvent(@AuthenticationPrincipal User user,
                           @RequestParam String name,
                           @RequestParam String description,
                           @RequestParam Date date,
                           Map<String, Object> model){
        Event newEvent = new Event(user, name, date, description);

        eventRepository.save(newEvent);

        Iterable<Event> events = eventRepository.findAll();
        model.put("events", events);
        return "main";
    }

}
