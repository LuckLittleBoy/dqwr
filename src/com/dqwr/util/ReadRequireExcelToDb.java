package com.dqwr.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ReadRequireExcelToDb {
	  public boolean readexceltodb(InputStream inputstream){
		boolean  count=false;
		try {
			HSSFWorkbook workbook=new HSSFWorkbook(inputstream);
			HSSFSheet sheet=workbook.getSheet("员工表");
			int rows=sheet.getPhysicalNumberOfRows();
			for(int r=1;r<rows;r++){
				String value="";
				HSSFRow row=sheet.getRow(r);
				if(row!=null){
					int cells=row.getPhysicalNumberOfCells();
					for(short c=0;c<cells;c++){
						HSSFCell cell=row.getCell((short)c);
						if(cell!=null){
							if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
								value+=cell.getStringCellValue()+",";
							}else if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
								value+=cell.getNumericCellValue()+",";
							}else if(cell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
								value+=cell.getBooleanCellValue()+",";
							}
						}
					}
				}
				String[] str=value.split(",");
				for(int i=0;i<str.length;i++){
					System.out.println(str[i]);
				}
				JDBCUtil util=new JDBCUtil();
				if(util.insertEmp(str)){
					count=true;
				}else{
					count=false;
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;	  
	  }
	  
}
