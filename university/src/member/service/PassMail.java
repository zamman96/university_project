package member.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import member.vo.MemberVO;

public class PassMail {
	


	public void sendMail(String id, String bir, String newPassword) {
		// TODO Auto-generated method stub
				IMemberService memberService = MemberServiceImpl.getInstance();
			

				
				// 받아온 데이터를 Map에 저장
				Map<String, Object> map = new HashMap<>();

				
				// 서비스를 호출하여 해당하는 사용자 정보를 가져옴
			
				
				map.put("uId", id);
				map.put("bir", bir);
				
				

				// 임시 비밀번호 생성
				  
				  String mail = memberService.findMail(map);
//				  
				//메일 찾기

				
				String host = "smtp.naver.com";            
				final String user = "whalwn0317@naver.com";   
				final String password = "alfn317!";          


//				String to = "whalwn0408@gmail.com";
				String to = mail;

				// Get the session object
				Properties props = new Properties();
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.auth", "true");
//				props.put("mail.smtp.host", "smtp.gmail.com"); 
				props.put("mail.smtp.port", 587); 
//				props.put("mail.smtp.ssl.enable", "true"); 
//				props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

				props.put("mail.smtp.socketFactory.port", "465");
				props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.port", "465");

				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(user, password);
					}
				});

				// Compose the message
				try {
					MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(user));
					
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

					// Subject
					message.setSubject("대덕대학교 학사관리 임시 비밀번호 설정>>"); //메일제목

					// Text
					message.setText(">>>임시비밀번호: "  + newPassword ); //메일내용

					// send the message
					Transport.send(message);
					System.out.println("message sent successfully...");

				   } catch (AddressException e) {
			            // TODO Auto-generated catch block
			            e.printStackTrace();
			        } catch (MessagingException e) {
			            // TODO Auto-generated catch block
			            e.printStackTrace();
			        }
			
				

	}
/*
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		IMemberService memberService = MemberServiceImpl.getInstance();
	

		
		// 받아온 데이터를 Map에 저장
		Map<String, Object> map = new HashMap<>();

		
		// 서비스를 호출하여 해당하는 사용자 정보를 가져옴
	
		
		
		
		

		// 임시 비밀번호 생성
		  String tempPassword = memberService.findPw(map);
		  String mail = memberService.findMail(map);
//		  
		//메일 찾기

		
		String host = "smtp.naver.com";            
		final String user = "whalwn0317@naver.com";   
		final String password = "alfn317!";          


		String to = "whalwn0408@gmail.com";
//		String to = mail;

		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
//		props.put("mail.smtp.host", "smtp.gmail.com"); 
		props.put("mail.smtp.port", 587); 
//		props.put("mail.smtp.ssl.enable", "true"); 
//		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "465");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Subject
			message.setSubject("대덕대학교 학사관리 임시 비밀번호 설정"); //메일제목

			// Text
			message.setText("임시비밀번호: "  + tempPassword ); //메일내용

			// send the message
			Transport.send(message);
			System.out.println("message sent successfully...");

		   } catch (AddressException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (MessagingException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	
		
	}*/

}