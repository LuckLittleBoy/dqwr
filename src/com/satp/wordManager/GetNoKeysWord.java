package com.satp.wordManager;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.ResultSet;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.db.Sqlcon;

import net.sf.json.JSONArray;
import net.sourceforge.pinyin4j.PinyinHelper;

import beans.Article;
import beans.Word;

/**
 * Servlet implementation class GetKeysWord
 */
public class GetNoKeysWord extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public GetNoKeysWord() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
		request.setCharacterEncoding("utf-8");	//设置编码
		response.setCharacterEncoding("utf-8");	//设置编码
		ResultSet rs=null;
		List<Word> list=new ArrayList<Word>();
		String sql="SELECT * from WYGJCK";
		System.out.println(sql);
		rs = Sqlcon.executeQuery(sql);
		try {
			while(rs.next()){
				Word a= new Word();
				a.setId(rs.getString("id").replace(" ", ""));
				a.setKeys(rs.getString("name").replace(" ", ""));
				//System.out.println(rs.getString("name"));
				a.setZimu(PinyinHelper.toHanyuPinyinStringArray(rs.getString("name").charAt(0))[0].charAt(0)+"");
				list.add(a);
			}		
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		rs.close();
		Sqlcon.close();
		JSONArray msg=JSONArray.fromObject(list);	
		String strmsg=msg.toString();
		strmsg="{'keys':"+strmsg+"}";	
		System.out.println(strmsg);
		response.getWriter().print(strmsg);
	}
	catch(Exception e){
		e.printStackTrace();
		response.getWriter().print("{'keys':'fail'}");
	}
	
	
	
		
	}

}
