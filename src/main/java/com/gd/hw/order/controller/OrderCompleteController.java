package com.gd.hw.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gd.hw.order.model.service.OrderService;
import com.gd.hw.order.model.vo.Person;

/**
 * Servlet implementation class OrderCompleteController
 */
@WebServlet("/complete.or")
public class OrderCompleteController extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public OrderCompleteController() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // 2. 세션에 올라가있는 merUid 값 가져와서
      HttpSession session = request.getSession();
      // 3. select로 필요한 정보들 가져오고 다음페이지로 넘김
      String merchantUid =  (String) session.getAttribute("merchantUid");
      session.removeAttribute("merchantUid");
      
      Person p = new OrderService().selectComletePerson(merchantUid);
      request.setAttribute("merchantUid", merchantUid);
      request.setAttribute("p", p);
      request.getRequestDispatcher("/views/order/paymentSuccess.jsp").forward(request, response);
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
