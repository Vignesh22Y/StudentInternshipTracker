package com.studenttracker.model;

public class Skill {

    private int skillId;
    private int studentId;
    private String skillName;
    private String skillLevel;

    public Skill() {
    }

    public Skill(int studentId, String skillName, String skillLevel) {
        this.studentId = studentId;
        this.skillName = skillName;
        this.skillLevel = skillLevel;
    }

    public int getSkillId() {
        return skillId;
    }

    public void setSkillId(int skillId) {
        this.skillId = skillId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getSkillName() {
        return skillName;
    }

    public void setSkillName(String skillName) {
        this.skillName = skillName;
    }

    public String getSkillLevel() {
        return skillLevel;
    }

    public void setSkillLevel(String skillLevel) {
        this.skillLevel = skillLevel;
    }
}