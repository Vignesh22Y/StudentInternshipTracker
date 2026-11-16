package com.studenttracker.model;

public class Internship {

    private int internshipId;
    private String company;
    private String title;
    private String requiredSkills;
    private String duration;
    private String description;

    public Internship() {
    }

    public Internship(String company, String title, String requiredSkills,
                      String duration, String description) {
        this.company = company;
        this.title = title;
        this.requiredSkills = requiredSkills;
        this.duration = duration;
        this.description = description;
    }

    public int getInternshipId() {
        return internshipId;
    }

    public void setInternshipId(int internshipId) {
        this.internshipId = internshipId;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getRequiredSkills() {
        return requiredSkills;
    }

    public void setRequiredSkills(String requiredSkills) {
        this.requiredSkills = requiredSkills;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}