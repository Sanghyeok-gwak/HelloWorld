package com.gd.hw.user.cotroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.user.model.service.UserService;

/**
 * Servlet implementation class UserIdCheckController
 */
@WebServlet("/idCheck.me")
public class UserIdCheckController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserIdCheckController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String inputId = request.getParameter("userId");
        int result = new UserService().idCheck(inputId);

        response.setContentType("text/html; charset=UTF-8");
        if(result > 0) {
            response.getWriter().print("fail");  // 아이디 중복
        } else {
            response.getWriter().print("success");  // 사용 가능한 아이디
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}

