package com.satp.model;

import java.text.Collator;
import java.text.RuleBasedCollator;
import java.util.Locale;

public class Sqlconvert {
      public static String convert(String sql,String name,String term,String xun,String condition){
    	  String sqlList[]=term.split(";");
    	   java.util.Arrays.sort(sqlList, 
    	              (RuleBasedCollator )Collator .getInstance(Locale .CHINA)); 
    	   for (String  key : sqlList)
    	   {
    	          System .out.println(key);
        	} 
    	  int l=sqlList.length;
    	  if("2".equals(xun))
    	  {
    		  for(int i=0;i<l;i++)
        	  {
    			 if(condition.equals("and")||condition.equals("or"))
    				sql+=name+" like '%"+sqlList[i]+"%'";
    			 else
    			   sql+=name+" not like '%"+sqlList[i]+"%'";
        		 if(i<l-1)
        			 sql+=" and ";
        	  }
    	  }
    	  else
    	  {

    		  sql+=name+"='"+term+"'";
    	  }
    	  
    	  return sql;
      }
}
