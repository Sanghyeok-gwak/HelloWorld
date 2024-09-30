package com.gd.hw.product.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gd.hw.common.utils.MyFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AjaxAddProductImgController
 */
@WebServlet("/imageUpload.pro")
public class AjaxAddProductImgController extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxAddProductImgController() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String savePath = request.getServletContext().getRealPath("/assets/uploaded_images/");
        
        
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        
        int maxSize = 1024 * 1024 * 10;
        
        MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
        
        String fileName = multiRequest.getFilesystemName("image");
        
        if (fileName != null) {
            String fileUrl = request.getContextPath() + "/assets/uploaded_images/" + fileName;
            
            response.setContentType("text/html; charset=UTF-8");
            response.getWriter().print(fileUrl);
        } else {
        	
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "File upload failed.");
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // doPost가 doGet을 호출하게 설정
        doGet(request, response);
    }
}
