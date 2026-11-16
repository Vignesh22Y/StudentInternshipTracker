package com.studenttracker.thread;

public class InternshipCheckThread extends Thread {

    private String task;
    private String result;

    public InternshipCheckThread(String task) {
        this.task = task;
    }

    @Override
    public void run() {

        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            System.out.println("Thread interrupted.");
        }

        result = task + " completed by " + Thread.currentThread().getName();

        System.out.println(result);
    }

    public String getResult() {
        return result;
    }
}