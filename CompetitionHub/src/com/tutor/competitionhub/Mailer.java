package com.tutor.competitionhub;

import java.util.Properties;    
import javax.mail.*;    
import javax.mail.internet.*;    
class Mailer{  
    public static boolean send(final String from,final String password,String to,String sub,String msg){  
       // System.out.println(from+""+password+""+to+""+msg+""+sub);  
    	boolean flag=false;
        //Get properties object    
          Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "465");    
          props.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");    
          //get Session   
          Session session = Session.getDefaultInstance(props,    
           new javax.mail.Authenticator() {    
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(from,password);  
           }    
          });    
          //compose message    
          try {    
           MimeMessage message = new MimeMessage(session);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
           message.setSubject(sub);    
           message.setText(" Hi CompetitionHub,\n\n This is for u.\n\n Name : "+msg.split("_")[0]+"\n\n Email : "+msg.split("_")[1]+"\n\n Message : "+msg.split("_")[2]);
           //send message  
           Transport.send(message);    
           System.out.println("message sent successfully");   
           flag = true;
          } catch (MessagingException e) {
        	  throw new RuntimeException(e);
        	//  flag=false;
        	 }  
          
            return flag; 
    }  
}      
