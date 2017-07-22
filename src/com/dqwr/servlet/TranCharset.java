package com.dqwr.servlet;

public class TranCharset {
	  
    private static final String PRE_FIX_UTF = "&#x";  
    private static final String POS_FIX_UTF = ";";  
  
    public TranCharset() {  
    }  
  
      
    public static String XmlFormalize(String sTemp) {  
        StringBuffer sb = new StringBuffer();  
  
        if (sTemp == null || sTemp.equals("")) {  
            return "";  
        }  
        String s = TranCharset.TranEncodeTOGB(sTemp);  
        for (int i = 0; i < s.length(); i++) {  
            char cChar = s.charAt(i);  
            if (TranCharset.isGB2312(cChar)) {  
                sb.append(PRE_FIX_UTF);  
                sb.append(Integer.toHexString(cChar));  
                sb.append(POS_FIX_UTF);  
            } else {  
                switch ((int) cChar) {  
                    case 32:  
                        sb.append("&#32;");  
                        break;  
                    case 34:  
                        sb.append("&quot;");  
                        break;  
                    case 38:  
                        sb.append("&amp;");  
                        break;  
                    case 60:  
                        sb.append("&lt;");  
                        break;  
                    case 62:  
                        sb.append("&gt;");  
                        break;  
                    default:  
                        sb.append(cChar);  
                }  
            }  
        }  
        return sb.toString();  
    }  
  
      
    public static String TranEncodeTOGB(String str) {  
        try {
            String strEncode = TranCharset.getEncoding(str);
            String temp = new String(str.getBytes(strEncode),"gb2312");
            return temp;  
        } catch (java.io.IOException ex) {  
  
            return null;  
        }  
    }  
  
      
    public static boolean isGB2312(char c) {  
        Character ch = new Character(c);  
        String sCh = ch.toString();  
        try {  
            byte[]   bb = sCh.getBytes("gb2312");  
            if (bb.length > 1) {  
                return true;  
            }  
        } catch (java.io.UnsupportedEncodingException ex) {  
            return false;  
        }  
        return false;  
    }  
  
      
    public static String getEncoding(String str) {  
        String encode = "GB2312";  
        try {  
            if (str.equals(new String(str.getBytes(encode), encode))) {  
                String s = encode;  
                return s;  
            }  
        } catch (Exception exception) {  
        }  
        encode = "ISO-8859-1";  
        try {  
            if (str.equals(new String(str.getBytes(encode), encode))) {  
                String s1 = encode;  
                return s1;  
            }  
        } catch (Exception exception1) {  
        }  
        encode = "UTF-8";  
        try {  
            if (str.equals(new String(str.getBytes(encode), encode))) {  
                String s2 = encode;  
                return s2;  
            }  
        } catch (Exception exception2) {  
        }  
        encode = "GBK";  
        try {  
            if (str.equals(new String(str.getBytes(encode), encode))) {  
                String s3 = encode;  
                return s3;  
            }  
        } catch (Exception exception3) {  
        }  
        return "";  
    }  
}