package com.zumbaclasses;

public class Participants {
    private String id;
    private String partName;
    private String partLastName;
    private int partPhone;
    private String partEmail;
    private String partAddress;
    private String password;
    private boolean isEmployed;
    
    // Constructor
   public Participants(String id, String name,String lastName, String email, 
    		int phone, String address, String password, boolean isEmployed) {
        this.id = id;
        this.partName = name;
        this.partLastName = lastName;
        this.partPhone = phone;
        this.partEmail = email;
        this.partAddress = address;
        this.password = password;
        this.isEmployed = isEmployed;
    }
    
   public String getId() {
       return id;
   }

   public void setId(String id) {
       this.id = id;
   }

   public String getName() {
       return partName;
   }

   public void setName(String name) {
       this.partName = name;
   }
   
   public String getLastName() {
       return partLastName;
   }

   public void setLastName(String lastname) {
       this.partLastName = lastname;
   }

   public String getEmail() {
       return partEmail;
   }

   public void setEmail(String email) {
       this.partEmail = email;
   }

   public int getPhone() {
       return partPhone;
   }

   public void setPhone(int phone) {
       this.partPhone = phone;
   }

   public String getAddress() {
       return partAddress;
   }

   public void setAddress(String address) {
       this.partAddress = address;
   }
   
   public boolean getEmployment() {
       return isEmployed;
   }

   public void setEmplyment(boolean emply) {
       this.isEmployed = emply;
   }
   
   /*@Override
   public String toString() {
       return "Participant [id=" + id + ", name=" + name + ", email=" + email + 
              ", phone=" + phone + ", address=" + address + "]";
   }*/
    
    
}
