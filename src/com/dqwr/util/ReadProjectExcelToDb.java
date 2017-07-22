package com.dqwr.util;

import java.io.IOException;
import java.io.InputStream;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class ReadProjectExcelToDb {
	  public boolean readexceltodb(InputStream inputstream){
		boolean  count=false;
		try {
			HSSFWorkbook workbook=new HSSFWorkbook(inputstream);
			HSSFSheet sheet=workbook.getSheet("Sheet1");
			int rows=sheet.getPhysicalNumberOfRows();
			for(int r=1;r<rows;r++){
				String value="";
				HSSFRow row=sheet.getRow(r);
				if(row!=null){
					int cells=row.getLastCellNum();
					System.out.println("cells:"+cells);
					for(int c=1;c<cells;c++){
						HSSFCell cell=row.getCell(c);
						if(cell!=null){
							if(cell.getCellType()==HSSFCell.CELL_TYPE_STRING){
								value+=cell.getStringCellValue()+",";
							}else if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
								value+=cell.getNumericCellValue()+",";
							}else if(cell.getCellType()==HSSFCell.CELL_TYPE_BOOLEAN){
								value+=cell.getBooleanCellValue()+",";
							}
						}
						else
						{
							value+="NULL"+",";
						}
					}
				}
				String[] str=value.split(",");

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