package com.example.demo.repository;

import com.example.demo.models.Event;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EventRepository extends JpaRepository<Event, Long> {

    List<Event> findEventByNameContains(String name);
    Event findEventById(Long id);
}
