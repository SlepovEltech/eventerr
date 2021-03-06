package com.example.demo.models;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Entity
public class Event {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    @JoinColumn(name = "user_id")
    private User author;

    private String name;
    private Date date;
    private String description;

    private String filename;

    @Column(columnDefinition="TEXT")
    private String maptag;

    @Fetch(FetchMode.JOIN)
    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    @JoinTable(
            name= "registration",
            joinColumns = {@JoinColumn(name="event_id")},
            inverseJoinColumns =  {@JoinColumn(name="user_id")}
    )
    private Set<User> registrations = new HashSet<>();

    public Event(){

    }

    public Event(User author, String name, Date date, String description, String filename, String maptag) {
        this.author = author;
        this.name = name;
        this.date = date;
        this.description = description;
        this.filename = filename;
        this.maptag = maptag;

    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Event event = (Event) o;
        return id.equals(event.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAuthorName(){
        return (author.getLast_name() != null) ? (author.getFirst_name()+" "+author.getLast_name()) : author.getUsername();
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public Set<User> getRegistrations() {
        return registrations;
    }

    public void setRegistrations(Set<User> registrations) {
        this.registrations = registrations;
    }

    public String getMaptag() {
        return maptag;
    }

    public void setMaptag(String maptag) {
        this.maptag = maptag;
    }
}
