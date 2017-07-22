package com.dqwr.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dqwr.dowithWord.DoWithWord;
import com.dqwr.model.PdfTool;
import com.dqwr.model.Word;
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

/**
 * Servlet implementation class PdfToText
 */
public class PdfToText extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public PdfToText() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost( request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String path=(String) request.getSession().getAttribute("path");
		
		String uploadfilename=(String) request.getSession().getAttribute("uploadfilename");
		path=path+"\\"+uploadfilename;

		String content = null;
		
		
		if(uploadfilename.indexOf(".pdf")>0){
			content=PdfTool.getText(path);
		}else 
			content=DoWithWord.getWord(path, uploadfilename);
		
		
		/*
		
		if(uploadfilename.indexOf(".pdf")>0){
			content=PdfTool.getText(path);
		}else if(uploadfilename.indexOf(".doc")>0||uploadfilename.indexOf(".docx")>0){

			try {
				//文件保存目录路径
				
				String savePath = request.getSession().getServletContext().getRealPath("\\attached") ;
				//文件保存目录URL
				String saveUrl  = request.getContextPath() + "/attached/";
				System.out.println();
				content = Word.getWordAndStyle(path,savePath,saveUrl);
			} catch (Exception e) {

				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}*/
		
		session.setAttribute("content1", content);
		response.getWriter().print(content);
	}
	

}
