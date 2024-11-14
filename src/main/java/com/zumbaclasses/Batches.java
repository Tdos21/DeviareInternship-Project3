package com.zumbaclasses;

import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

public class Batches {
	
	private String batchId;
    private String batchName;
    private Time startTime;
    private Time endTime;
    private List<Participants> participants;
    
    // Constructor
    public Batches(String batchId, String batchName, Time startTime, Time endTime) {
        this.batchId = batchId;
        this.batchName = batchName;
        this.startTime = startTime;
        this.endTime = endTime;
        this.participants = new ArrayList<>();
    }

    // Getters and Setters
    public String getBatchId() {
        return batchId;
    }

    public void setBatchId(String batchId) {
        this.batchId = batchId;
    }

    public String getBatchName() {
        return batchName;
    }

    public void setBatchName(String batchName) {
        this.batchName = batchName;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public Time getEndTime() {
        return endTime;
    }

    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    public List<Participants> getParticipants() {
        return participants;
    }

    // Method to add a participant to the batch
    public void addParticipant(Participants participant) {
        participants.add(participant);
    }

    // Method to remove a participant from the batch
    public void removeParticipant(Participants participant) {
        participants.remove(participant);
    }
    
//    @Override
//    public String toString() {
//        return "Batch [batchId=" + batchId + ", batchName=" + batchName + 
//               ", startDate=" + startDate + ", endDate=" + endDate + 
//               ", participants=" + participants + "]";
//    }
//
//	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//
//	}

}
