package com.dqwr.model;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringWriter;

import org.apache.pdfbox.exceptions.COSVisitorException;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDDocumentInformation;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.edit.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.util.PDFTextStripper;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;

public class PdfTool {
	public static String getText(String path){
	    InputStream inputStream;	
	    System.out.println("222");
	    String contents="";
		try {
			inputStream = new BufferedInputStream(
			        new FileInputStream(new File(path)));
			 PDDocument pdfDocument = PDDocument.load(inputStream);
			    StringWriter writer = new StringWriter();
			    PDFTextStripper stripper = new PDFTextStripper();
			    stripper.writeText(pdfDocument, writer);
			   contents = writer.getBuffer().toString();
			   System.out.println("�ĵ����ݣ�"+contents);
			    PDDocumentInformation documentInformation = pdfDocument.getDocumentInformation();
			   System.out.println("���⣺"+documentInformation.getTitle());
		} catch (Exception e) {	
			e.printStackTrace();
		}
	   
	    return contents;
	}
	public static void textToPdf (String path,String value) {
		Document document = new Document();  
        
        try {
			PdfWriter.getInstance(document, new FileOutputStream(path));
			//BaseFont chinese = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);   
	        //ʹ��windows�Դ������  
	        BaseFont chinese;
				chinese = BaseFont.createFont("C:/windows/fonts/simsun.ttc,1", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
				 Font font = new Font(chinese, 14, Font.NORMAL);        
			        document.addAuthor("WESTDREAM");  
			        document.addTitle("Test iText");  
			        document.addSubject("This is an iText demo");  
			        document.addKeywords("iText keywords");  
			        document.addCreator("Using iText");  
			        document.open();  
			        String[] values=value.split("\n");
			        for(int i=0;i<values.length;i++){
						
			        	 document.add(new Paragraph(values[i], font)); 
					}
			        document.close();  
		} catch ( DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
         catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
       
	}
}