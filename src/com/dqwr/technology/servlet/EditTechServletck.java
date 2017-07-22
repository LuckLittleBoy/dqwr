package com.dqwr.technology.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.jasper.tagplugins.jstl.core.Out;

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
import com.dqwr.topic.dao.impl.TopicDaoImpl;
import com.dqwr.topic.entity.Topic;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

public class EditTechServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7815581986172658792L;
	Connection conn=null;
   
    public EditTechServlet() {
    	DataBaseDao db=new DataBaseDao();
        conn=db.connection();
    }
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   request.setCharacterEncoding("utf-8");
		   response.setCharacterEncoding("utf-8");
		   String pageno=request.getParameter("pageno");
		   Case case1=new Case();
		   Case case2=new Case();
		   Case case3=new Case();
		   Orga orga=new Orga();
		   Technology tech=new Technology();
		   byte[] nature=new byte[4];
			for(int i=0;i<4;i++){
				nature[i]=0;
			}
           String orgaid=request.getParameter("orgaid");
           String organame=request.getParameter("organame");
           String legalperson=request.getParameter("legalperson");
           String contacts=request.getParameter("contacts");
           String address=request.getParameter("address");
           String email=request.getParameter("email");
           String tel=request.getParameter("tel");
           String cel=request.getParameter("cel");
           String natureid=request.getParameter("natureid");
           String othernature=request.getParameter("othernature");
           String introduction=request.getParameter("introduction");
           if(orgaid!=null){
        	   orga.setOrgaId(orgaid);
           }
           if(organame!=null){
        	   orga.setOrgaName(organame);
           }
           if(legalperson!=null){
        	   orga.setLegalPerson(legalperson);
           }
           if(contacts!=null){
        	   orga.setContacts(contacts);   
           }
           if(address!=null){
        	   orga.setAddress(address); 
           }
           if(email!=null){
        	   orga.setEmail(email); 
           }
           if(tel!=null){
        	   orga.setTel(tel); 
           }
           if(cel!=null){
        	   orga.setCel(cel); 
           }
           if(introduction!=null){
        	   orga.setIntroduction(introduction);
           }
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
                     String techname=request.getParameter("techname");
           String sourceid=request.getParameter("sourceid");
           String techowner=request.getParameter("techowner");
           String othersource=request.getParameter("othersource");
           String[] fieldid=request.getParameterValues("fieldid");
           String otherfield=request.getParameter("otherfield");
           String techoverview=request.getParameter("techoverview");
           String scope=request.getParameter("scope");
           String progressid=request.getParameter("progressid");
           String stateid=request.getParameter("stateid");
           String econindicator=request.getParameter("econindicator");
           String result=request.getParameter("result");
           String transid=request.getParameter("transid");
           String othertransfrom=request.getParameter("othertransfrom");
           String finaneedid=request.getParameter("finaneedid");
           String otherneed=request.getParameter("otherneed");
           String money=request.getParameter("money");
           String casenumber=request.getParameter("casenumber");
           String filltime=request.getParameter("filltime");
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
					finaneed[0]=1;
				}else if(finaneedid.equals("债权融资")){
					finaneed[1]=1;
				}else if(finaneedid.equals("其他")){
					finaneed[2]=1;
					tech.setOtherNeed(otherneed);
				}
				tech.setFinaNeedId(finaneed);
			}
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
			if(orgaid!=null){
				tech.setOrgaId(orgaid);
			}
			if(techname!=null){
				tech.setTechName(techname);
			}
			if(techoverview!=null){
				tech.setTechOverview(techoverview);
			}
			if(scope!=null){
				tech.setScope(scope);
			}
			if(econindicator!=null){
				tech.setEconIndicator(econindicator);
			}
			if(result!=null){
				tech.setResult(result);
			}
			if(money!=null){
				tech.setMoney(Float.parseFloat(money));
			}
			if(casenumber!=null){
				tech.setCaseNumber(Integer.parseInt(casenumber));
			}
			if(filltime!=null){
				tech.setFillTime(filltime);
			}
			if(casenumber.equals("0")){
				System.out.println("无典型案例"); 
			} 
			else if (casenumber.equals("1")){
				String caseid1=request.getParameter("caseid1");
				System.out.println(caseid1);
				String casename=request.getParameter("casename");
			    String starttime=request.getParameter("starttime");
			    String implement=request.getParameter("implement");
			    String cooperation=request.getParameter("cooperation");
			    String contact=request.getParameter("contact");
			    String casetel=request.getParameter("casetel");
			    String caseoverview=request.getParameter("caseoverview");
			    String effect=request.getParameter("effect");
			    String benefit=request.getParameter("benefit");
			    String appraisal=request.getParameter("appraisal");
			    if(caseid1!=null){
			    	case1.setCaseId(Integer.parseInt(caseid1));
			    }
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
				if(filltime!=null){
					case1.setFillTime(filltime); 	
				} 	
			}else if(casenumber.equals("2")){
				
				String caseid1=request.getParameter("caseid1");
				String casename=request.getParameter("casename");
			    String starttime=request.getParameter("starttime");
			    String implement=request.getParameter("implement");
			    String cooperation=request.getParameter("cooperation");
			    String contact=request.getParameter("contact");
			    String casetel=request.getParameter("casetel");
			    String caseoverview=request.getParameter("caseoverview");
			    String effect=request.getParameter("effect");
			    String benefit=request.getParameter("benefit");
			    String appraisal=request.getParameter("appraisal");
			    if(caseid1!=null){
			    	case1.setCaseId(Integer.parseInt(caseid1));
			    }
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
				if(filltime!=null){
					case1.setFillTime(filltime); 	
				} 	
				
				String caseid2=request.getParameter("caseid2");
				String casename2=request.getParameter("casename2");
			    String starttime2=request.getParameter("starttime2");
			    String implement2=request.getParameter("implement2");
			    String cooperation2=request.getParameter("cooperation2");
			    String contact2=request.getParameter("contact2");
			    String casetel2=request.getParameter("casetel2");
			    String caseoverview2=request.getParameter("caseoverview2");
			    String effect2=request.getParameter("effect2");
			    String benefit2=request.getParameter("benefit2");
			    String appraisal2=request.getParameter("appraisal2");
			    if(caseid2!=null){
			    	case2.setCaseId(Integer.parseInt(caseid2));
			    }
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
				if(filltime!=null){
					case2.setFillTime(filltime); 	
				} 	
				
			}else if(casenumber.equals("3")){
				String caseid1=request.getParameter("caseid1");
				String casename=request.getParameter("casename");
			    String starttime=request.getParameter("starttime");
			    String implement=request.getParameter("implement");
			    String cooperation=request.getParameter("cooperation");
			    String contact=request.getParameter("contact");
			    String casetel=request.getParameter("casetel");
			    String caseoverview=request.getParameter("caseoverview");
			    String effect=request.getParameter("effect");
			    String benefit=request.getParameter("benefit");
			    String appraisal=request.getParameter("appraisal");
			    if(caseid1!=null){
			    	case1.setCaseId(Integer.parseInt(caseid1));
			    }
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
				if(filltime!=null){
					case1.setFillTime(filltime); 	
				} 	
				
				String caseid2=request.getParameter("caseid2");
				String casename2=request.getParameter("casename2");
			    String starttime2=request.getParameter("starttime2");
			    String implement2=request.getParameter("implement2");
			    String cooperation2=request.getParameter("cooperation2");
			    String contact2=request.getParameter("contact2");
			    String casetel2=request.getParameter("casetel2");
			    String caseoverview2=request.getParameter("caseoverview2");
			    String effect2=request.getParameter("effect2");
			    String benefit2=request.getParameter("benefit2");
			    String appraisal2=request.getParameter("appraisal2");
			    if(caseid2!=null){
			    	case2.setCaseId(Integer.parseInt(caseid2));
			    }
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
				if(filltime!=null){
					case2.setFillTime(filltime); 	
				} 	
				
				String caseid3=request.getParameter("caseid3");
				String casename3=request.getParameter("casename3");
			    String starttime3=request.getParameter("starttime3");
			    String implement3=request.getParameter("implement3");
			    String cooperation3=request.getParameter("cooperation3");
			    String contact3=request.getParameter("contact3");
			    String casetel3=request.getParameter("casetel3");
			    String caseoverview3=request.getParameter("caseoverview3");
			    String effect3=request.getParameter("effect3");
			    String benefit3=request.getParameter("benefit3");
			    String appraisal3=request.getParameter("appraisal3");
			    if(caseid3!=null){
			    	case3.setCaseId(Integer.parseInt(caseid3));
			    }
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
				if(filltime!=null){
					case3.setFillTime(filltime); 	
				} 	
			}
			
			OrgaDaoImpl orgaimpl=new OrgaDaoImpl();
			TechnologyDaoImpl techimpl=new TechnologyDaoImpl();
		    CaseDaoImpl caseimpl=new CaseDaoImpl();
		    response.setContentType("text/html;charset=utf-8");
		    PrintWriter out=response.getWriter();
		    if(orgaimpl.edittechOrga(conn, orga)){
		    	if(techimpl.updatetech(conn, tech, Integer.parseInt(techid)).equals("success")){
		    		//添加典型案例数目为1的情况
		    		if(casenumber.equals("0")){
		    			
		 				  out.print("<script language=javascript>"+"alert('修改成功！');"+"document.location.href='ws/edittechnology.jsp?orgaid="+orgaid+"&techid="+techid+"&pageno="+pageno+"';"+"</script>");
   
			 		   }
		    		else if(casenumber.equals("1")){
		 			   if(caseimpl.updatetechcase(conn, case1).equals("success")){

		 				  out.print("<script language=javascript>"+"alert('修改成功！');"+"document.location.href='ws/edittechnology.jsp?orgaid="+orgaid+"&techid="+techid+"&pageno="+pageno+"';"+"</script>");
		 			   }else{
		 				   out.print("<script language=javascript>"+"alert('典型案例修改失败!')"+"</script>");
		 			   }
		 		   }else if(casenumber.equals("2")){
		 			   if(caseimpl.updatetechcase(conn, case1).equals("success")&&caseimpl.updatetechcase(conn, case2).equals("success")){
		 				  out.print("<script language=javascript>"+"alert('修改成功！');"+"document.location.href='ws/edittechnology.jsp?orgaid="+orgaid+"&techid="+techid+"&pageno="+pageno+"';"+"</script>");
		 			   }else{
		 				  out.print("<script language=javascript>"+"alert('典型案例修改失败!')"+"</script>");
		 			   }
		 		   }else if(casenumber.equals("3")){
		 			   if(caseimpl.updatetechcase(conn, case1).equals("success")&&caseimpl.updatetechcase(conn, case2).equals("success")&&caseimpl.updatetechcase(conn, case3).equals("success")){
		 				 out.print("<script language=javascript>"+"alert('修改成功！');"+"document.location.href='ws/edittechnology.jsp?orgaid="+orgaid+"&techid="+techid+"&pageno="+pageno+"';"+"</script>");
		 			   }else{
		 				  out.print("<script language=javascript>"+"alert('典型案例修改失败!')"+"</script>");
		 			   }
		 		   }
		    	}else{
		    		out.print("<script language=javascript>"+"alert('成熟技术修改失败!')"+"</script>");
		    	}
		    }else{
		    	out.print("<script language=javascript>"+"alert('组织结构修改失败!')"+"</script>");
		    }
		   
         }  
	}
