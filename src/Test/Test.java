package Test;
import java.io.File;
import java.io.IOException;
 
import org.apache.commons.io.FileUtils;
 
public class Test {
     public static int Sum(int n){
    	 int result = 2;
    	 for(int i=n;i>0;i--){
    		 if(i==1){
    			 result=result*1;
    		 }else{
    		     result=2*Sum(n-1); 
    		 }
    	 }
    	 return result;
    } 
    public static void main(String[] args) {
      System.out.println(Sum(11));
    }
}