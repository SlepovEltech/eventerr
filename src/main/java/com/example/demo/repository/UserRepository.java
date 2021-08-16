package com.example.demo.repository;

import com.example.demo.models.Event;
import com.example.demo.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    User findUserById(Long id);
}
