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

import com.gd.hw.user.model.service.UserService;

/**
 * Servlet implementation class SMTPMailSendTest
 */
@WebServlet("/smtp.do")
public class UserSMTPMailSendController extends HttpServlet {
   private static final long serialVersionUID = 1L;
   private UserService userService = new UserService();

   public UserSMTPMailSendController() {
        super();
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
       String action = request.getParameter("action");
       String userEmail = request.getParameter("email");
       String nameOrId = request.getParameter("nameOrId"); // 이름 또는 아이디

       if (userEmail == null || userEmail.isEmpty()) {
           response.getWriter().write("fail");
           return;
       }

       String result = null;

       // 아이디 찾기 또는 비밀번호 찾기 로직
       if ("findId".equals(action)) {
           // DB에서 사용자 이름과 이메일이 일치하는 사용자의 아이디 찾기
           result = userService.findUserIdByNameAndEmail(nameOrId, userEmail); // 여기에 DB 조회 로직 추가 필요
           if (result != null) {
               sendEmail(userEmail, "[HELLO WORLD] 아이디 찾기 결과", "회원님의 아이디는: " + result + "입니다.");
               response.getWriter().write("send");
           } else {
               response.getWriter().write("fail");
           }
       } else if ("findPassword".equals(action)) {
           // DB에서 사용자 아이디와 이메일이 일치하는 사용자의 비밀번호 찾기
           result = userService.findUserPasswordByIdAndEmail(nameOrId, userEmail); // 여기에 DB 조회 로직 추가 필요
           if (result != null) {
               sendEmail(userEmail, "[HELLO WORLD] 비밀번호 찾기 결과", "회원님의 비밀번호는: " + result + "입니다.");
               response.getWriter().write("send");
           } else {
               response.getWriter().write("fail");
           }
       } else {
           // 기존 랜덤 인증번호 생성 로직
           String verificationCode = generateVerificationCode();

           // 세션에 인증번호 저장 (나중에 인증번호 확인에 사용)
           HttpSession session1 = request.getSession();
           session1.setAttribute("verificationCode", verificationCode);

           // 인증번호 이메일 전송
           sendEmail(userEmail, "[HELLO WORLD] 회원가입 인증번호", "인증번호는 [" + verificationCode + "] 입니다.");
           response.getWriter().write("send");
       }
   }

   // 아이디 찾기 로직 (이름과 이메일을 기반으로 사용자 아이디를 찾음)
   private String findUserIdByNameAndEmail(String name, String email) {
       // 이 부분에 DB 조회 로직을 추가하여 사용자 아이디를 찾습니다.
       // 예시:
       // SELECT userId FROM Users WHERE name = ? AND email = ?
       return "sampleUserId";  // 찾은 아이디를 반환
   }

   // 비밀번호 찾기 로직 (아이디와 이메일을 기반으로 사용자 비밀번호를 찾음)
   private String findUserPasswordByIdAndEmail(String username, String email) {
       // 이 부분에 DB 조회 로직을 추가하여 사용자 비밀번호를 찾습니다.
       // 예시:
       // SELECT userPwd FROM Users WHERE userId = ? AND email = ?
       return "sampleUserPassword";  // 찾은 비밀번호를 반환
   }

   // 랜덤 인증번호 생성 로직 (기존 로직)
   private String generateVerificationCode() {
       Random random = new Random();
       return String.format("%04d", random.nextInt(10000)); // 4자리 인증번호 생성
   }

   // 이메일 전송 로직
   private void sendEmail(String userEmail, String subject, String content) {
       Properties props = new Properties();
       props.put("mail.smtp.host", "smtp.naver.com");
       props.put("mail.smtp.port", "465");
       props.put("mail.smtp.auth", "true");
       props.put("mail.smtp.ssl.enable", "true");
       props.put("mail.smtp.ssl.trust", "smtp.naver.com");
       props.put("mail.smtp.ssl.protocols", "TLSv1.2");

       Session session = Session.getDefaultInstance(props, new Authenticator() {
           protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication("shasha401@naver.com", "gnsska7266!");
           }
       });

       try {
           Message message = new MimeMessage(session);
           message.setFrom(new InternetAddress("shasha401@naver.com"));
           message.setRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
           message.setSubject(subject);
           message.setText(content);
           Transport.send(message);
       } catch (MessagingException e) {
           e.printStackTrace();
       }
   }
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
