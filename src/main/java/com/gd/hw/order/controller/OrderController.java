package com.gd.hw.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gd.hw.order.model.service.OrderService;
import com.gd.hw.order.model.vo.Order;
import com.gd.hw.order.model.vo.Person;

import com.gd.hw.order.model.service.OrderService;
import com.gd.hw.order.model.vo.Order;
import com.gd.hw.order.model.vo.Person;

/**
 * Servlet implementation class Kakaopay
 */
@WebServlet("/insert.or")
public class OrderController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public OrderController() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

         request.setCharacterEncoding("UTF-8");
         
         String merchantUid = request.getParameter("merchant_uid");
         String impUid = request.getParameter("imp_uid");
         
         System.out.println("m:"+merchantUid+", i:"+impUid);
        // 가지고온 데이터 PAYMENT, ORDER 테이블에 들어갈 정보들 ORDER객체 하나에 다 담음
         
        int userNo = Integer.parseInt(request.getParameter("userNo"));
        System.out.println(userNo);
        int productId = Integer.parseInt(request.getParameter("productId"));
        System.out.println(productId);
        int bhNo = Integer.parseInt(request.getParameter("bhNo"));
        System.out.println(bhNo);
        int adult = Integer.parseInt(request.getParameter("adult"));
        System.out.println(adult);
        int child = Integer.parseInt(request.getParameter("child"));
        System.out.println(child);
        String flight = request.getParameter("flight");
        System.out.println(flight);
        int pointU = Integer.parseInt(request.getParameter("pointU"));
        System.out.println(pointU);
        int totalPay = Integer.parseInt(request.getParameter("totalPay"));
        System.out.println(totalPay);
      
        Order o = new Order(merchantUid,userNo,productId,bhNo,impUid,adult,child,flight,pointU,totalPay);
        System.out.println(o.toString());
        // PERSON은 한 결제에 여러행 INSERT일 수 있음 넘어오는 값도 배열형태
        
        String surName = request.getParameter("CustomerEnLastNM");
        System.out.println(pointU);
        String engName = request.getParameter("CustomerEnFirstNM");
        System.out.println(pointU);
        String birthday = request.getParameter("CustomerBirthday");
        System.out.println(pointU);
        String phone = request.getParameter("CustomerPhone");
        System.out.println(pointU);
        String gender = request.getParameter("Gender");
        System.out.println(pointU);
        String nation = request.getParameter("CustomerNationality");
        System.out.println(pointU);
        String passport = request.getParameter("CustomerPPNO");
        System.out.println(pointU);
        String passportEx = request.getParameter("CustomerPPExpirationDT");
        System.out.println(pointU);
        String status = "A";
        String div = "A";
        
         Person p = new Person(merchantUid,surName,engName,birthday,phone,gender,nation,
               passport,passportEx,status,div); // 원래는 배열형태로 넘어온걸 잘 까서 넣어줘야하는데
         System.out.println(p.toString());
         int result = new OrderService().insertOrder(o,p);

         
         response.setContentType("text/html; charset=UTF-8");

         
         if(result>2) {
           // 1. 세션에 merUid값 올려놓고
           HttpSession session = request.getSession();
            session.setAttribute("merchantUid", merchantUid); 
            response.getWriter().print("0001");
            
         }else {
            response.getWriter().print("0000");
         }
      
      }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}
