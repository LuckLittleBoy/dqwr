package com.satp.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import jxl.*;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.Colour;
import jxl.format.Orientation;
import jxl.format.UnderlineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.BorderLineStyle;
import jxl.write.Label;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.satp.entity.Highcharts;

/**
 * Servlet implementation class Excelout
 */
public class Excelout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Excelout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String path =request.getSession().getServletContext().getRealPath("");
		HttpSession session = request.getSession();
		ArrayList<Highcharts> highchartlist=(ArrayList<Highcharts>) session.getAttribute("highchartslist1");
		int count=highchartlist.size();
		File file = new File("ZCTest");
		String CXZD1=(String) session.getAttribute("CXZD1");
        String url=path+"\\"+CXZD1+".xls";
		try {	
			WritableWorkbook book = Workbook.createWorkbook(new File(url));
			WritableSheet sheet = book.createSheet(CXZD1, 0);
			//设置字体样式
			jxl.write.WritableFont font = new jxl.write.WritableFont(WritableFont.ARIAL, 15, WritableFont.BOLD, false,UnderlineStyle.NO_UNDERLINE, jxl.format.Colour.GREEN);
			jxl.write.WritableCellFormat cellFormat = new jxl.write.WritableCellFormat(font);	
			cellFormat.setAlignment(Alignment.CENTRE);
			cellFormat.setVerticalAlignment(VerticalAlignment.CENTRE);//设置单元格内容两端对齐
			cellFormat.setBackground(Colour.GRAY_25);//背景颜色
			Label label_title = new Label(0,0,CXZD1,cellFormat);
			sheet.mergeCells(0,0,count-1,0);//合并第一行的第1个到第5个单元格				
			sheet.setRowView(0, 500,false);//设置第一行的行高	
			int i=0;
			int j=0;
			sheet.setColumnView(4, 15);
			sheet.addCell(label_title);
			for(Highcharts high:highchartlist)
			{
				sheet.addCell(new Label(i,1,high.getName()));
				i++;
			}
			for(Highcharts high:highchartlist)
			{
				sheet.addCell(new Label(j,2,high.getNumber()+""));
				j++;
			}
			book.write();
			book.close();
			StringBuffer jsonresult = new StringBuffer();
			JSONArray jsonArrayResult = new JSONArray();
			jsonresult.append("[");
			jsonArrayResult.add("数据导出成功");
			PrintWriter out = response.getWriter();
			out.write(jsonArrayResult.toString());
			out.flush();
			out.close();
		} catch (Exception e) {
			System.out.println("异常信息："+e.getMessage());
			e.printStackTrace();
		}
	}

}
