package com.gd.hw.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.product.model.service.ProductfavoriteService;
import com.gd.hw.user.model.vo.User;
import com.google.gson.Gson;

/**
 * Servlet implementation class AjaxFavoritesGetController
 */
@WebServlet("/getFavoriteList.pr")
public class AjaxFavoritesGetController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxFavoritesGetController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User loginUser = (User) request.getSession().getAttribute("loginUser");
		
		// 세션에서 로그인한 사용자 정보를 가져옵니다. 이건 구글에서 가져옴 널방지
		// loginUser가 null인지 확인하여 처리
				if (loginUser == null) {
					// 로그인하지 않은 경우 401 Unauthorized 상태 반환
					response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
					response.getWriter().write("로그인된 사용자가 아닙니다.");
					return;  // 이후 코드 실행 방지
				}
				
		
				int userNo = ((User)request.getSession().getAttribute("loginUser")).getUserNo();
		
		// 서비스 호출하여 찜한 상품 목록 조회
		ProductfavoriteService productService = new ProductfavoriteService();
		List<Integer> list = productService.getFavoriteList(userNo);

		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
