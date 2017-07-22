package com.dqwr.technology.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dqwr.dao.DataBaseDao;
import com.dqwr.entity.YH;
import com.dqwr.publishinfo.dao.impl.PublishHyInfoImpl;
import com.dqwr.publishinfo.entity.Info;
import com.dqwr.requirement.dao.impl.OrgaDaoImpl;
import com.dqwr.requirement.dao.impl.RequireDaoImpl;
import com.dqwr.requirement.entity.Orga;
import com.dqwr.requirement.entity.Requirement;
import com.dqwr.technology.dao.impl.CaseDaoImpl;
import com.dqwr.technology.dao.impl.TechnologyDaoImpl;
import com.dqwr.technology.entity.Case;
import com.dqwr.technology.entity.Technology;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class TechServletqt extends HttpServlet{
    private DataBaseDao database = null;
    private ServletConfig config;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TechServletqt() {
        super();
        database = new DataBaseDao();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config) throws ServletException {
    	this.config = config;
    	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("GBK");
		String Case1Path="";
	    String Case2Path="";
	    String Case3Path="";
		SmartUpload mySmartUpload = new SmartUpload();
		mySmartUpload.initialize(config,request,response);
		Case case1=new Case();
		Case case2=new Case();
		Case case3=new Case();
		try {
			  //mySmartUpload.setAllowedFilesList("rar,htm,html,jar");//设置允许上传的文件
				mySmartUpload.setDeniedFilesList("exe,jsp,asp");// 禁止上传的文件
				mySmartUpload.setDenyPhysicalPath(false); // 拒绝物理路径
				mySmartUpload.setMaxFileSize(5000000);// 设置允许上传文件最大为50000bytes
				mySmartUpload.setTotalMaxFileSize(50000000);// 一次上传文件大小最多不超过5000000bytes
				mySmartUpload.upload();
				//获取案例1、2、3分别上传文件的数量
				String casenumber=mySmartUpload.getRequest().getParameter("casenumber");
				String filltime=mySmartUpload.getRequest().getParameter("filltime");
				if(casenumber.equals("1")){
					int num1=Integer.parseInt(mySmartUpload.getRequest().getParameter("num1"));
					for (int i = 0; i <num1; i++) {
						com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);
						if(!myFile.isMissing()){
						Random rd = new Random();
						Calendar cd = Calendar.getInstance();
						String fileName = String.valueOf(cd.get(Calendar.YEAR))+String.valueOf(cd.get(Calendar.MONTH)+1)+String.valueOf(cd.get(Calendar.DATE))+
						String.valueOf(cd.get(Calendar.MINUTE))+String.valueOf(cd.get(Calendar.SECOND))+String.valueOf(rd.nextInt(100))+"."+myFile.getFileExt();
						String path = "D:/temp/";
						path += fileName;
				        if(i==num1-1){
				        	Case1Path+=path;
				        }else{
				        	Case1Path+=path+";";
				        }
						myFile.saveAs(path,2);
						} 
						}
					String casename=mySmartUpload.getRequest().getParameter("casename");
				    String starttime=mySmartUpload.getRequest().getParameter("starttime");
				    String implement=mySmartUpload.getRequest().getParameter("implement");
				    String cooperation=mySmartUpload.getRequest().getParameter("cooperation");
				    String contact=mySmartUpload.getRequest().getParameter("contact");
				    String casetel=mySmartUpload.getRequest().getParameter("casetel");
				    String caseoverview=mySmartUpload.getRequest().getParameter("caseoverview");
				    String effect=mySmartUpload.getRequest().getParameter("effect");
				    String benefit=mySmartUpload.getRequest().getParameter("benefit");
				    String appraisal=mySmartUpload.getRequest().getParameter("appraisal");
				      
				    
				    if(casename!=null){
				    	case1.setCaseName(casename);	
				    }
					if(starttime!=null){
						case1.setStartTime(starttime);	
					}
					if(implement!=null){
						case1.setImplement(implement);	
					}
					if(cooperation!=null){
						case1.setCooperation(cooperation);	
					}
					if(contact!=null){
						case1.setContact(contact);	
					}
					if(casetel!=null){
						case1.setTel(casetel);	
					}
					if(caseoverview!=null){
						case1.setCaseOverview(caseoverview);	
					}
					if(effect!=null){
						case1.setEffect(effect);	
					}
					if(benefit!=null){
						case1.setBenefit(benefit);	
					}
					if(appraisal!=null){
						case1.setAppraisal(appraisal);	
					}

					case1.setEvidencePath01(Case1Path);	
					if(filltime!=null){
						case1.setFillTime(filltime); 	
					}
						
				}
				if(casenumber.equals("2")){
					int num1=Integer.parseInt(mySmartUpload.getRequest().getParameter("num1"));
					int num2=Integer.parseInt(mySmartUpload.getRequest().getParameter("num2"));
					
					//上传案例1文件
					for (int i = 0; i <num1; i++) {
						com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);
						if(!myFile.isMissing()){
						Random rd = new Random();
						Calendar cd = Calendar.getInstance();
						String fileName = String.valueOf(cd.get(Calendar.YEAR))+String.valueOf(cd.get(Calendar.MONTH)+1)+String.valueOf(cd.get(Calendar.DATE))+
						String.valueOf(cd.get(Calendar.MINUTE))+String.valueOf(cd.get(Calendar.SECOND))+String.valueOf(rd.nextInt(1000))+"."+myFile.getFileExt();
						String path = "D:/temp/";
						path += fileName;
				        if(i==num1-1){
				        	Case1Path+=path;
				        }else{
				        	Case1Path+=path+";";
				        }
						myFile.saveAs(path,2);
						} 
						}
					System.out.print(Case1Path);
					String casename=mySmartUpload.getRequest().getParameter("casename");
				    String starttime=mySmartUpload.getRequest().getParameter("starttime");
				    String implement=mySmartUpload.getRequest().getParameter("implement");
				    String cooperation=mySmartUpload.getRequest().getParameter("cooperation");
				    String contact=mySmartUpload.getRequest().getParameter("contact");
				    String casetel=mySmartUpload.getRequest().getParameter("casetel");
				    String caseoverview=mySmartUpload.getRequest().getParameter("caseoverview");
				    String effect=mySmartUpload.getRequest().getParameter("effect");
				    String benefit=mySmartUpload.getRequest().getParameter("benefit");
				    String appraisal=mySmartUpload.getRequest().getParameter("appraisal");
				      
				  
				    if(casename!=null){
				    	case1.setCaseName(casename);	
				    }
					if(starttime!=null){
						case1.setStartTime(starttime);	
					}
					if(implement!=null){
						case1.setImplement(implement);	
					}
					if(cooperation!=null){
						case1.setCooperation(cooperation);	
					}
					if(contact!=null){
						case1.setContact(contact);	
					}
					if(casetel!=null){
						case1.setTel(casetel);	
					}
					if(caseoverview!=null){
						case1.setCaseOverview(caseoverview);	
					}
					if(effect!=null){
						case1.setEffect(effect);	
					}
					if(benefit!=null){
						case1.setBenefit(benefit);	
					}
					if(appraisal!=null){
						case1.setAppraisal(appraisal);	
					}

						case1.setEvidencePath01(Case1Path);	

					if(filltime!=null){
						case1.setFillTime(filltime); 	
					} 	
					//上传文件1结束	
					
					//上传案例2文件	
					for (int j=num1; j <num1+num2; j++) {
						com.jspsmart.upload.File myFile2 = mySmartUpload.getFiles().getFile(j);
						if(!myFile2.isMissing()){
						Random rd = new Random();
						Calendar cd = Calendar.getInstance();
						String fileName = String.valueOf(cd.get(Calendar.YEAR))+String.valueOf(cd.get(Calendar.MONTH)+1)+String.valueOf(cd.get(Calendar.DATE))+
						String.valueOf(cd.get(Calendar.MINUTE))+String.valueOf(cd.get(Calendar.SECOND))+String.valueOf(rd.nextInt(100))+"."+myFile2.getFileExt();
						String path2 = "D:/temp/";
						path2 += fileName;
				        if(j==num1+num2-1){
				        	Case2Path+=path2;
				        }else{
				        	Case2Path+=path2+";";
				        }
						myFile2.saveAs(path2,2);
						} 
						}
					System.out.println(Case2Path);
					String casename2=mySmartUpload.getRequest().getParameter("casename2");
				    String starttime2=mySmartUpload.getRequest().getParameter("starttime2");
				    String implement2=mySmartUpload.getRequest().getParameter("implement2");
				    String cooperation2=mySmartUpload.getRequest().getParameter("cooperation2");
				    String contact2=mySmartUpload.getRequest().getParameter("contact2");
				    String casetel2=mySmartUpload.getRequest().getParameter("casetel2");
				    String caseoverview2=mySmartUpload.getRequest().getParameter("caseoverview2");
				    String effect2=mySmartUpload.getRequest().getParameter("effect2");
				    String benefit2=mySmartUpload.getRequest().getParameter("benefit2");
				    String appraisal2=mySmartUpload.getRequest().getParameter("appraisal2");
				      
				    if(casename2!=null){
				    	case2.setCaseName(casename2);	
				    }
					if(starttime2!=null){
						case2.setStartTime(starttime2);	
					}
					if(implement2!=null){
						case2.setImplement(implement2);	
					}
					if(cooperation2!=null){
						case2.setCooperation(cooperation2);	
					}
					if(contact2!=null){
						case2.setContact(contact2);	
					}
					if(casetel2!=null){
						case2.setTel(casetel2);	
					}
					if(caseoverview2!=null){
						case2.setCaseOverview(caseoverview2);	
					}
					if(effect2!=null){
						case2.setEffect(effect2);	
					}
					if(benefit2!=null){
						case2.setBenefit(benefit2);	
					}
					if(appraisal2!=null){
						case2.setAppraisal(appraisal2);	
					}
						case2.setEvidencePath01(Case2Path);	
					if(filltime!=null){
						case2.setFillTime(filltime); 	
					}
					//上传文件2结束
				}
				if(casenumber.equals("3")){
					int num1=Integer.parseInt(mySmartUpload.getRequest().getParameter("num1"));
					int num2=Integer.parseInt(mySmartUpload.getRequest().getParameter("num2"));
					int num3=Integer.parseInt(mySmartUpload.getRequest().getParameter("num3"));
					//上传案例1文件
					for (int i = 0; i <num1; i++) {
						com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(i);
						if(!myFile.isMissing()){
						Random rd = new Random();
						Calendar cd = Calendar.getInstance();
						String fileName = String.valueOf(cd.get(Calendar.YEAR))+String.valueOf(cd.get(Calendar.MONTH)+1)+String.valueOf(cd.get(Calendar.DATE))+
						String.valueOf(cd.get(Calendar.MINUTE))+String.valueOf(cd.get(Calendar.SECOND))+String.valueOf(rd.nextInt(100))+"."+myFile.getFileExt();
						String path = "D:/temp/";
						path += fileName;
				        if(i==num1-1){
				        	Case1Path+=path;
				        }else{
				        	Case1Path+=path+";";
				        }
						myFile.saveAs(path,2);
						} 
						}
					String casename=mySmartUpload.getRequest().getParameter("casename");
				    String starttime=mySmartUpload.getRequest().getParameter("starttime");
				    String implement=mySmartUpload.getRequest().getParameter("implement");
				    String cooperation=mySmartUpload.getRequest().getParameter("cooperation");
				    String contact=mySmartUpload.getRequest().getParameter("contact");
				    String casetel=mySmartUpload.getRequest().getParameter("casetel");
				    String caseoverview=mySmartUpload.getRequest().getParameter("caseoverview");
				    String effect=mySmartUpload.getRequest().getParameter("effect");
				    String benefit=mySmartUpload.getRequest().getParameter("benefit");
				    String appraisal=mySmartUpload.getRequest().getParameter("appraisal");
				      
				  
				    if(casename!=null){
				    	case1.setCaseName(casename);	
				    }
					if(starttime!=null){
						case1.setStartTime(starttime);	
					}
					if(implement!=null){
						case1.setImplement(implement);	
					}
					if(cooperation!=null){
						case1.setCooperation(cooperation);	
					}
					if(contact!=null){
						case1.setContact(contact);	
					}
					if(casetel!=null){
						case1.setTel(casetel);	
					}
					if(caseoverview!=null){
						case1.setCaseOverview(caseoverview);	
					}
					if(effect!=null){
						case1.setEffect(effect);	
					}
					if(benefit!=null){
						case1.setBenefit(benefit);	
					}
					if(appraisal!=null){
						case1.setAppraisal(appraisal);	
					}
						case1.setEvidencePath01(Case1Path);	
					if(filltime!=null){
						case1.setFillTime(filltime); 	
					} 		
					//上传文件1结束
					
					//上传案例2文件	
					for (int j=num1; j <num1+num2; j++) {
						com.jspsmart.upload.File myFile2 = mySmartUpload.getFiles().getFile(j);
						if(!myFile2.isMissing()){
						Random rd = new Random();
						Calendar cd = Calendar.getInstance();
						String fileName = String.valueOf(cd.get(Calendar.YEAR))+String.valueOf(cd.get(Calendar.MONTH)+1)+String.valueOf(cd.get(Calendar.DATE))+
						String.valueOf(cd.get(Calendar.MINUTE))+String.valueOf(cd.get(Calendar.SECOND))+String.valueOf(rd.nextInt(100))+"."+myFile2.getFileExt();
						String path2 = "D:/temp/";
						path2 += fileName;
				        if(j==num1+num2-1){
				        	Case2Path+=path2;
				        }else{
				        	Case2Path+=path2+";";
				        }
						myFile2.saveAs(path2,2);
						} 
						}
					String casename2=mySmartUpload.getRequest().getParameter("casename2");
				    String starttime2=mySmartUpload.getRequest().getParameter("starttime2");
				    String implement2=mySmartUpload.getRequest().getParameter("implement2");
				    String cooperation2=mySmartUpload.getRequest().getParameter("cooperation2");
				    String contact2=mySmartUpload.getRequest().getParameter("contact2");
				    String casetel2=mySmartUpload.getRequest().getParameter("casetel2");
				    String caseoverview2=mySmartUpload.getRequest().getParameter("caseoverview2");
				    String effect2=mySmartUpload.getRequest().getParameter("effect2");
				    String benefit2=mySmartUpload.getRequest().getParameter("benefit2");
				    String appraisal2=mySmartUpload.getRequest().getParameter("appraisal2");
				      
				   
				    if(casename2!=null){
				    	case2.setCaseName(casename2);	
				    }
					if(starttime2!=null){
						case2.setStartTime(starttime2);	
					}
					if(implement2!=null){
						case2.setImplement(implement2);	
					}
					if(cooperation2!=null){
						case2.setCooperation(cooperation2);	
					}
					if(contact2!=null){
						case2.setContact(contact2);	
					}
					if(casetel2!=null){
						case2.setTel(casetel2);	
					}
					if(caseoverview2!=null){
						case2.setCaseOverview(caseoverview2);	
					}
					if(effect2!=null){
						case2.setEffect(effect2);	
					}
					if(benefit2!=null){
						case2.setBenefit(benefit2);	
					}
					if(appraisal2!=null){
						case2.setAppraisal(appraisal2);	
					}
						case2.setEvidencePath01(Case2Path);	
					if(filltime!=null){
						case2.setFillTime(filltime); 	
					} 	
					//上传文件2结束
					
					//上传案例3文件
					for (int k=num1+num2; k <num1+num2+num3; k++) {
						com.jspsmart.upload.File myFile3 = mySmartUpload.getFiles().getFile(k);
						if(!myFile3.isMissing()){
						Random rd = new Random();
						Calendar cd = Calendar.getInstance();
						String fileName = String.valueOf(cd.get(Calendar.YEAR))+String.valueOf(cd.get(Calendar.MONTH)+1)+String.valueOf(cd.get(Calendar.DATE))+
						String.valueOf(cd.get(Calendar.MINUTE))+String.valueOf(cd.get(Calendar.SECOND))+String.valueOf(rd.nextInt(100))+"."+myFile3.getFileExt();
						String path3 = "D:/temp/";
						path3 += fileName;
				        if(k==num1+num2+num3-1){
				        	Case3Path+=path3;
				        }else{
				        	Case3Path+=path3+";";
				        }
						myFile3.saveAs(path3,2);
						} 
						}
					String casename3=mySmartUpload.getRequest().getParameter("casename3");
				    String starttime3=mySmartUpload.getRequest().getParameter("starttime3");
				    String implement3=mySmartUpload.getRequest().getParameter("implement3");
				    String cooperation3=mySmartUpload.getRequest().getParameter("cooperation3");
				    String contact3=mySmartUpload.getRequest().getParameter("contact3");
				    String casetel3=mySmartUpload.getRequest().getParameter("casetel3");
				    String caseoverview3=mySmartUpload.getRequest().getParameter("caseoverview3");
				    String effect3=mySmartUpload.getRequest().getParameter("effect3");
				    String benefit3=mySmartUpload.getRequest().getParameter("benefit3");
				    String appraisal3=mySmartUpload.getRequest().getParameter("appraisal3");
				      
				   
				    if(casename3!=null){
				    	case3.setCaseName(casename3);	
				    }
					if(starttime3!=null){
						case3.setStartTime(starttime3);	
					}
					if(implement3!=null){
						case3.setImplement(implement3);	
					}
					if(cooperation3!=null){
						case3.setCooperation(cooperation3);	
					}
					if(contact3!=null){
						case3.setContact(contact3);	
					}
					if(casetel3!=null){
						case3.setTel(casetel3);	
					}
					if(caseoverview3!=null){
						case3.setCaseOverview(caseoverview3);	
					}
					if(effect3!=null){
						case3.setEffect(effect3);	
					}
					if(benefit3!=null){
						case3.setBenefit(benefit3);	
					}
					if(appraisal3!=null){
						case3.setAppraisal(appraisal3);	
					}
						case3.setEvidencePath01(Case3Path);	
					if(filltime!=null){
						case3.setFillTime(filltime); 	
					} 	
					//上传文件3结束
				}
				byte[] nature=new byte[4];
				for(int i=0;i<4;i++){
					nature[i]=0;
				}
				
				//获取、设置组织结构相关提交信息,加上用户信息
				
				String orgaid=mySmartUpload.getRequest().getParameter("orgaid");
				String organame=mySmartUpload.getRequest().getParameter("organame");
				String legalperson=mySmartUpload.getRequest().getParameter("legalperson");
				String contacts=mySmartUpload.getRequest().getParameter("contacts");
				String address=mySmartUpload.getRequest().getParameter("address");
				String email=mySmartUpload.getRequest().getParameter("email");
				String tel=mySmartUpload.getRequest().getParameter("tel");
				String cel=mySmartUpload.getRequest().getParameter("cel");
				String natureid=mySmartUpload.getRequest().getParameter("natureid");
				String othernature=mySmartUpload.getRequest().getParameter("othernature");
				String introduction=mySmartUpload.getRequest().getParameter("introduction");
				String username=mySmartUpload.getRequest().getParameter("username");
				Orga orga=new Orga();
				orga.setOrgaId(orgaid);
				orga.setOrgaName(organame);
				orga.setLegalPerson(legalperson);
				orga.setContacts(contacts);
				orga.setAddress(address);
				orga.setEmail(email);
				orga.setTel(tel);
				orga.setCel(cel);
				orga.setIntroduction(introduction);
				orga.setUsername(username);

				if(natureid!=null){
					if(natureid.equals("企业")){
						nature[3]=1;
					}else if(natureid.equals("高等院校")){
						nature[2]=1;
					}else if(natureid.equals("研究机构")){
						nature[1]=1;
					}else if(natureid.equals("其他")){
						nature[0]=1;
						orga.setOtherNature(othernature);
					}
					orga.setNatureID(nature);	
				}			

				//获取、设置成熟技术信息
				
				String techname=mySmartUpload.getRequest().getParameter("techname");
				System.out.println(techname);
				String sourceid=mySmartUpload.getRequest().getParameter("sourceid");
				String techowner=mySmartUpload.getRequest().getParameter("techowner");
				String othersource=mySmartUpload.getRequest().getParameter("othersource");
				String[] fieldid=mySmartUpload.getRequest().getParameterValues("fieldid");
				String otherfield=mySmartUpload.getRequest().getParameter("otherfield");
				String techoverview=mySmartUpload.getRequest().getParameter("techoverview");
				String scope=mySmartUpload.getRequest().getParameter("scope");
				String progressid=mySmartUpload.getRequest().getParameter("progressid");
				String stateid=mySmartUpload.getRequest().getParameter("stateid");
				System.out.println("stateid"+stateid);
				String econindicator=mySmartUpload.getRequest().getParameter("econindicator");
				String result=mySmartUpload.getRequest().getParameter("result");
				String transid=mySmartUpload.getRequest().getParameter("transid");
				String othertransfrom=mySmartUpload.getRequest().getParameter("othertransfrom");
				String finaneedid=mySmartUpload.getRequest().getParameter("finaneedid");
		        String otherneed=mySmartUpload.getRequest().getParameter("otherneed");
			    String money=mySmartUpload.getRequest().getParameter("money");
 
				Technology tech=new Technology();
				byte[] source=new byte[5];
				byte[] progress=new byte[4];
				byte[] state=new byte[3];
				byte[] trans=new byte[5];
				byte[] finaneed=new byte[3];
				for(int i=0;i<5;i++){
					source[i]=0;
				}
				for(int i=0;i<4;i++){
					progress[i]=0;
				}
				for(int i=0;i<3;i++){
					state[i]=0;
				}
				for(int i=0;i<5;i++){
					trans[i]=0;
				}
				for(int i=0;i<3;i++){
					finaneed[i]=0;
				}
				if(sourceid!=null){
					if(sourceid.equals("自主研发")){
						source[4]=1;
					}else if(sourceid.equals("合作开发")){
						source[3]=1;
					}else if(sourceid.equals("技术引进吸收再创新")){
						source[2]=1;
					}else if(sourceid.equals("技术引进")){
						source[1]=1;
						tech.setTechOwner(techowner);
					}else if(sourceid.equals("其他")){
						source[0]=1;
						tech.setOtherSource(othersource);
					}
					tech.setSourceID(source);
				}
				
				if(progressid!=null){
					if(progressid.equals("国际领先")){
						progress[3]=1;
					}else if(progressid.equals("国际先进")){
						progress[2]=1;
					}else if(progressid.equals("国内领先")){
						progress[1]=1;
					}else if(progressid.equals("国内先进")){
						progress[0]=1;
					}
					tech.setProgessId(progress);	
				}
				
				if(stateid!=null){
					if(stateid.equals("示范应用")){
						state[2]=1;
					}else if(stateid.equals("规模化应用")){
						state[1]=1;
					}else if(stateid.equals("未产业化")){
						state[0]=1;
					}
					tech.setStateId(state);
				}
				if(transid!=null){
					if(transid.equals("技术转让")){
						trans[4]=1;
					}else if(transid.equals("技术授权")){
						trans[3]=1;
					}else if(transid.equals("技术服务")){
						trans[2]=1;
					}else if(transid.equals("已转化")){
						trans[1]=1;
						tech.setTechOwner(techowner);
					}else if(transid.equals("其他")){
						trans[0]=1;
						tech.setOtherTransfrom(othertransfrom);
					}
					tech.setTransID(trans);
				}
				
				if(finaneedid!=null){
					if(finaneedid.equals("股权融资")){
						finaneed[2]=1;
					}else if(finaneedid.equals("债券融资")){
						finaneed[1]=1;
					}else if(finaneedid.equals("其他")){
						finaneed[0]=1;
						tech.setOtherNeed(otherneed);
					}
					tech.setFinaNeedId(finaneed);	
				}
				
				/*if(fieldid!=null){
					String field="";
 					for(int i=0;i<fieldid.length;i++){
						if(fieldid[i].equals("其他")){
						  tech.setOtherField(otherfield);
						  field+=fieldid[i]+";"; 	
						}else if(i==(fieldid.length-1))
						{
							field+=fieldid[i];
							
						}else{
							field+=fieldid[i]+";";
						}
					}
					tech.setFieldId(field);	
				}*/
				if(fieldid!=null){
					String field="";
					for(int i=0;i<fieldid.length;i++){
						if(fieldid[i].equals("其他")){
						  tech.setOtherField(otherfield);
						  	
						}else if(i==(fieldid.length-1))
						{
							field+=fieldid[i];
							
						}else{
							field+=fieldid[i]+";";
						}
					}
					tech.setFieldId(field);	
				}
				 
				tech.setOrgaId(orgaid);
				tech.setTechName(techname);
				tech.setTechOverview(techoverview);
				tech.setScope(scope);
				tech.setEconIndicator(econindicator);
				tech.setResult(result);
				tech.setUsername(username);

				if(money.equals("")){
					
				}else{
					tech.setMoney(Float.parseFloat(money));		
				}
				tech.setCaseNumber(Integer.parseInt(casenumber));
				tech.setFillTime(filltime);
				tech.setXSSH(0);
				tech.setJSSH(0);
				tech.setReject(0);
				
				
				
				Connection con = database.connection();
				OrgaDaoImpl orgaimpl=new OrgaDaoImpl();
				TechnologyDaoImpl techimpl=new TechnologyDaoImpl();
				CaseDaoImpl  caseimpl=new CaseDaoImpl();
				String orgaresult=orgaimpl.insertOrga111(con, orga);
				String techresult=techimpl.insertInfo1(con, tech);

				int techid=techimpl.selectTech(con,orgaid,techname);
				if(casenumber.equals("1")){
					case1.setTechId(techid);
					String caseresult=caseimpl.insertInfo(con, case1);
				}else if(casenumber.equals("2")){
					case1.setTechId(techid);
					case2.setTechId(techid);
					String caseresult=caseimpl.insertInfo(con, case1);
					String caseresult2=caseimpl.insertInfo(con, case2);
				}else if(casenumber.equals("3")){
					case1.setTechId(techid);
					case2.setTechId(techid);
					case3.setTechId(techid);
					String caseresult=caseimpl.insertInfo(con, case1);
					String caseresult3=caseimpl.insertInfo(con, case2);
					String caseresult4=caseimpl.insertInfo(con, case3);
				}	
				database.closeConnection(con);
				response.setContentType("text/html;charset=gbk");
				PrintWriter out=response.getWriter();
				out.print("<script language=javascript>" + "alert('填写成功！');"+"document.location.href='qt/qtcx1.jsp?tag=1'"+"</script>");
			   }catch (Exception e) {
				   e.printStackTrace();
			   }
		}
	}
