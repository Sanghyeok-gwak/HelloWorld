package com.gd.hw.user.cotroller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SMTPMailSendTest
 */
@WebServlet("/smtp.do")
public class UserSMTPMailSendController extends HttpServlet {
   private static final long serialVersionUID = 1L;
   
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserSMTPMailSendController() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
	   String userEmail = request.getParameter("email");
	   
	   System.out.println(userEmail);
	   
	   if(userEmail == null || userEmail.isEmpty()) {
		   response.getWriter().write("fail");
		   return;
	   }
	   
	  // 인증번호 생성 (4자리 랜덤숫자)
	   String verificationCode = generateVerificationCode();
	   
       // 세션에 인증번호 저장 (나중에 인증번호 확인에 사용)
       HttpSession session1 = request.getSession();
       session1.setAttribute("verificationCode", verificationCode);
      // activation-1.1.jar , mail-1.4.7.jar 라이브러리 필요
      
      // Property 객체에 SMTP 서버 정보 설정 
      Properties props = new Properties();
      props.put("mail.smtp.host", "smtp.naver.com");
      props.put("mail.smtp.port", "465");      // SMTP 포트 
      props.put("mail.smtp.auth", "true");
      props.put("mail.smtp.ssl.enable", "true");
      props.put("mail.smtp.ssl.trust", "smtp.naver.com");
      props.put("mail.smtp.ssl.protocols", "TLSv1.2");

      // SMTP 서버 정보와 사용자 정보를 기반으로 Session 클래스의 인스턴스를 생성
       Session session2 = Session.getDefaultInstance(props, new Authenticator() {
           protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication("shasha401@naver.com", "gnsska7266!");
           }
       });

      // Message 객체에 수신자와 내용, 제목의 메시지를 작성 
       try {

           Message message = new MimeMessage(session2);
             
           // 발신자 설정
           message.setFrom(new InternetAddress("shasha401@naver.com"));

           // 수신자 메일주소 설정
           message.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));

           // 메일 제목 설정
           message.setSubject("[HELLO WORLD] 회원가입 인증번호");
           // 메일 내용 설정
           message.setText("인증번호는 [" + verificationCode + "] 입니다.");

           // Send the message
           Transport.send(message);

           System.out.println(" NaverMailSend : Email sent successfully.");
       } catch (MessagingException e) {
           e.printStackTrace();
       } 
         
       System.out.println(" NaverMailSend : sendEmail() 종료");
       
       response.getWriter().print("send");
    
   }
   private String generateVerificationCode() {
       Random random = new Random();
       return String.format("%04d", random.nextInt(10000)); // 4자리 인증번호 생성
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}
