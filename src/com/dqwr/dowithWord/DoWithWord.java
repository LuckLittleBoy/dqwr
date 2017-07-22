package com.dqwr.dowithWord;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Date;

import org.apache.commons.httpclient.DefaultHttpMethodRetryHandler;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

public class DoWithWord {
	public static String getWord(String path,String filename){

		String data_str=(new java.text.SimpleDateFormat("yyyy_MM_dd_HH_mm_ss")).format(new Date());
		String newpath=path.substring(0,path.indexOf(filename))+data_str;
		if(filename.indexOf(".pdf")>0){
			newpath+=".pdf";
		}else if(filename.indexOf(".doc")>0){
			newpath+=".doc";
		}else if(filename.indexOf(".docx")>0){
			newpath+=".docx";
		}else if(filename.indexOf(".wps")>0){
			newpath+=".wps";
		}
		File file=new File(path);  
		if(file.exists())
		{
			file.renameTo(new File(newpath));
		}
		String pathhtml=newpath.replace(".pdf", ".html").replace(".doc", ".html").replace(".docx", ".html").replace(".wps", ".html");
		//String filenamehtml=filename.replace(".pdf", ".html").replace(".doc", ".html").replace(".docx", ".html");
		wordToHtml(newpath,pathhtml);
		String result=select("http://localhost:6060/dqwr/attached/file/document/"+data_str+".html");
		result=result.replace("src=\"", "src=\"http://localhost:6060/dqwr/attached/file/document/");
		//result=result.replace("<table", "<table border='1px solid' ");
		String newresult=result;
		int a=result.indexOf("<table");
		if(a>0){
			newresult=result.substring(0,a);;
			String nex=result.substring(a,result.length());
			if(nex.indexOf("border-left")<600){
				nex=nex.replaceFirst("<table", "<table border='1px solid' ");
			}else{
				nex=nex.replaceFirst("<table", "<table border='0px' ");
			}
			System.out.println("re+"+result);
			System.out.println("new+"+newresult);
			System.out.println("nex+"+nex);
			while(nex.indexOf("<table",600)>=0){
				System.out.println("++++++++++"+newresult);
				System.out.println("++++++++++"+newresult);
				a=nex.indexOf("<table",600);
				newresult+=nex.substring(0, a);
				nex=nex.substring(a,nex.length());
				if(nex.indexOf("border-left")<600&&nex.indexOf("border-left")>0){
					System.out.println("-----+"+nex.indexOf("border-left"));
					nex=nex.replaceFirst("<table", "<table border='1px solid' ");
				}else{
					nex=nex.replaceFirst("<table", "<table border='0' class='ke-zeroborder' bordercolor='#000000' ");
					System.out.println("-----+"+nex.indexOf("border-left"));
				}
				
				System.out.println("new+"+newresult);
				System.out.println("nex+"+nex);
			}
			newresult=newresult+nex;
		}
		newresult=newresult.substring(newresult.indexOf("</title>")+8, newresult.length());
		return newresult;
		
	}
	public static void wordToHtml(String docfile, String htmlfile)     
    {     
        // ��wordӦ�ó���(Microsoft Office Word 2003)  
        ActiveXComponent app = new ActiveXComponent("kwps.Application");  
        System.out.println("开始转化");  
        try    
        {     
            // ����wordӦ�ó��򲻿ɼ�    
            app.setProperty("Visible", new Variant(false));    
            // documents��ʾword����������ĵ����ڣ���word�Ƕ��ĵ�Ӧ�ó���  
            Dispatch docs = app.getProperty("Documents").toDispatch();    
            // ��Ҫת����word�ļ�  
            Dispatch doc = Dispatch.invoke(     
                    docs,     
                    "Open",     
                    Dispatch.Method,     
                    new Object[] { docfile, new Variant(false),   
                            new Variant(true) }, new int[1]).toDispatch();     
            
            Dispatch.invoke(doc, "SaveAs", Dispatch.Method, new Object[] {     
                    htmlfile, new Variant(8) }, new int[1]);     
            
            Dispatch.call(doc, "Close", new Variant(false));     
        }     
        catch (Exception e)     
        {     
            e.printStackTrace();     
        }     
        finally    
        {     
            
            app.invoke("Quit", new Variant[] {});     
        }   
        System.out.println("完成");  
    }  
	public static String select(String address) {
		String result = "";
		// 构�?HttpClient的实�?
		HttpClient httpClient = new HttpClient();
		// 创建GET方法的实�?
		GetMethod getMethod = new GetMethod(address);
		System.out.println(address);
		// 使用系统提供的默认的恢复策略
		getMethod.getParams().setParameter(HttpMethodParams.RETRY_HANDLER,
				new DefaultHttpMethodRetryHandler());
		// 定义�?��输入�?
		InputStream ins = null;
		// 定义文件�?
		BufferedReader br = null;
		try {
			// 执行getMethod
			int statusCode = httpClient.executeMethod(getMethod);
			if (statusCode != HttpStatus.SC_OK) {
				System.err.println("方法失败: " + getMethod.getStatusLine());
			}

			// 使用getResponseBodyAsStream读取页面内容，这个方法对于目标地�?��有大量数据需要传输是�?��的�?
			ins = getMethod.getResponseBodyAsStream();
			String charset = getMethod.getResponseCharSet();
			if (charset.toUpperCase().equals("ISO-8859-1")) {
				charset = "gb2312";
			}
			// 按服务器编码字符集构建文件流，这里的CHARSET要根据实际情况设�?
			br = new BufferedReader(new InputStreamReader(ins,
					getMethod.getResponseCharSet()));
			StringBuffer sbf = new StringBuffer();
			String line = null;
			while ((line = br.readLine()) != null) {
				sbf.append(line);
			}
			result = new String(sbf.toString().getBytes(
					getMethod.getResponseCharSet()), charset);
			// 输出内容
			//System.out.println(result);
			// 服务器编�?
			System.out.println("服务器编码是" + getMethod.getResponseCharSet());
		} catch (HttpException e) {
			// 发生致命的异常，可能是协议不对或者返回的内容有问�?
			System.out.println("请检查您�?��供的HTTP地址�");
			e.printStackTrace();
		} catch (IOException e) {
			// 发生网络异常
			e.printStackTrace();
		} finally {
			// 关闭流，释放连接
			ins = null;
			br = null;
		}
		return result;
	}

}
