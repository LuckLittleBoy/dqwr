package com.ybc.dqwr.dao;
/**
 * @author 于步超
 * policy政策的数据库操作类
 */
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.ybc.dqwr.entity.Policy;
import com.ybc.dqwr.entity.PolicyIdParentid;
import com.ybc.dqwr.entity.PolicyTree;

/**
 * @author ybc
 *
 */
public class PolicyDao
{
	private DataBaseDao dataBase = null;
	private Connection con=null;
	private ResultSet rs=null;
	private PreparedStatement pstm = null;
	
	/**
	 * 根据政策文号获取政策
	 * 
	 * @param policyId 政策文号
	 * @return
	 * @throws SQLException
	 */
	public Policy getPolicyByPolicyId(String policyId) throws SQLException
	{
		dataBase =new DataBaseDao();
		con = dataBase.connection();
		String sql="select * from ZCB where ZCWH=?";
		pstm=con.prepareStatement(sql);
		pstm.setObject(1, policyId);
		rs = pstm.executeQuery(); // 执行查询操作
		Policy policy = new Policy();
		if(rs.next())
		{
			policy.setId(rs.getInt("ZCID"));
			policy.setPolicyId(rs.getString("ZCWH"));
			policy.setName(rs.getString("ZCMC"));
			policy.setContent(rs.getString("ZCNR"));
		}
		closeDB();
		return policy;
	}
	
	/**
	 * 根据政策名称获取政策
	 * 
	 * @param name 政策名称
	 * @return
	 * @throws SQLException
	 */
	public Policy getPolicyByName(String name) throws SQLException
	{
		dataBase =new DataBaseDao();
		con = dataBase.connection();
		String sql="select * from ZCB where ZCMC=?";
		pstm=con.prepareStatement(sql);
		pstm.setObject(1, name);
		rs = pstm.executeQuery(); // 执行查询操作
		Policy policy = new Policy();
		if(rs.next())
		{
			policy.setId(rs.getInt("ZCID"));
			policy.setPolicyId(rs.getString("ZCWH"));
			policy.setName(rs.getString("ZCMC"));
			policy.setContent(rs.getString("ZCNR"));
		}
		closeDB();
		return policy;
	}
	
	/**
	 * 根据政策文号获取政策Id
	 * 
	 * @param policyId 政策文号
	 * @return
	 */
	public int getIdByPolicyId(String policyId)throws SQLException
	{
		int id=0;
		dataBase =new DataBaseDao();
		con = dataBase.connection();
		String sql="select ZCID from ZCB where ZCWH=?";
		pstm=con.prepareStatement(sql);
		pstm.setObject(1, policyId);
		rs = pstm.executeQuery(); // 执行查询操作
		if(rs.next())
		{
			id=rs.getInt("ZCID");
		}
		closeDB();
		return id;
	}
	
	/**
	 * 根据政策Id获取政策文号
	 * 
	 * @param policyId 政策文号
	 * @return
	 */
	public String getPolicyIdById(String id)throws SQLException
	{
		String policyId="";
		dataBase =new DataBaseDao();
		con = dataBase.connection();
		String sql="select ZCWH from ZCB where ZCID=?";
		pstm=con.prepareStatement(sql);
		pstm.setObject(1, id);
		rs = pstm.executeQuery(); // 执行查询操作
		if(rs.next())
		{
			policyId=rs.getString("ZCWH");
		}
		closeDB();
		return policyId;
	}
	
	/**
	 * 根据政策policyId获取政策名称
	 * 
	 * @param policyId 政策文号
	 * @return
	 */
	public String getPolicyNameByPolicyId(String policyId)throws SQLException
	{
		String name="";
		dataBase =new DataBaseDao();
		con = dataBase.connection();
		String sql="select ZCMC from ZCB where ZCWH=?";
		pstm=con.prepareStatement(sql);
		pstm.setObject(1, policyId);
		rs = pstm.executeQuery(); // 执行查询操作
		if(rs.next())
		{
			name=rs.getString("ZCMC");
		}
		closeDB();
		return name;
	}
	
	/**
	 * 
	 * 
	 * @param policyId 政策Id
	 * @return
	 * @throws SQLException
	 */
	public String getIdFromPolicyId(String policyId) throws SQLException
	{
		String id="";
		String policyIds[]=policyId.split(";");
		int i;
		for(i=0;i<policyIds.length;i++)
		{
			id+=getIdByPolicyId(policyIds[i]);
		}
		return id;
	}
	
	/**
	 * 根据政策Id返回上位政策的文号
	 * 
	 * @param id 政策Id
	 * @return
	 * @throws SQLException
	 */
	public String getPolicyParentById(String id) throws SQLException
	{
		dataBase =new DataBaseDao();
		con = dataBase.connection();
		String sql="select BSWZC from BYB where ZCID=?";
		pstm=con.prepareStatement(sql);
		pstm.setObject(1, id);
		rs = pstm.executeQuery(); // 执行查询操作
		String BSWZC="";
		if(rs.next())
		{
			BSWZC=rs.getString("BSWZC");
		}
		closeDB();
		return BSWZC;
	}

	
	/**
	 * 根据政策Id返回前驱政策的文号
	 * 
	 * @param id 政策Id
	 * @return
	 * @throws SQLException
	 */
	public String getPolicyBeforeById(String id)throws SQLException
	{
		dataBase =new DataBaseDao();
		con = dataBase.connection();
		String sql="select BQQZC from BYB where ZCID=?";
		pstm=con.prepareStatement(sql);
		pstm.setObject(1, id);
		rs = pstm.executeQuery(); // 执行查询操作
		String BQQZC="";
		if(rs.next())
		{
			BQQZC=rs.getString("BQQZC");
		}
		closeDB();
		return BQQZC;
	}

	/**
	 * 根据政策Id返回后继政策的文号
	 * 
	 * @param id 政策Id
	 * @return
	 * @throws SQLException
	 */
	public String getPolicyAfterById(String id)throws SQLException
	{
		dataBase =new DataBaseDao();
		con = dataBase.connection();
		String sql="select BHJZC from BYB where ZCID=?";
		pstm=con.prepareStatement(sql);
		pstm.setObject(1, id);
		rs = pstm.executeQuery(); // 执行查询操作
		String BHJZC="";
		if(rs.next())
		{
			BHJZC=rs.getString("BHJZC");
		}
		closeDB();
		return BHJZC;
	}
	
	
	/**
	 * 根据政策Id返回树形结构
	 * 
	 * @param id 政策Id
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<PolicyTree> getPolicyParentTreeById(String id)throws SQLException
	{
		ArrayList<PolicyTree>policyList=new ArrayList<PolicyTree>();
		PolicyTree policyTree=new PolicyTree();
    	policyTree.setPolicyId(getPolicyIdById(id));
    	policyTree.setParentPolicyId(getPolicyParentById(id));
    	policyList.add(policyTree);
		dataBase =new DataBaseDao();
		con = dataBase.connection();
		String sql="select BSWZC from BYB where ZCID=?";
		pstm=con.prepareStatement(sql);
		pstm.setObject(1, id);
		rs = pstm.executeQuery(); // 执行查询操作
		if(rs.next())
		{
			getPolicyParentTree(rs.getString("BSWZC"),policyList);
		}
		closeDB();
		return policyList;
	}

	/**
	 * @param parentPolicyId
	 * @param policyList
	 * @throws SQLException
	 */
	private void getPolicyParentTree(String parentPolicyId,ArrayList<PolicyTree>policyList)throws SQLException
	{
		if(parentPolicyId!=null&&!parentPolicyId.equals(""))
		{
			int i;
			int id;
			String idString;
			String parent2PolicyId;
		    String parentPolicyIds[] = parentPolicyId.split(";");
		    for(i=0;i<parentPolicyIds.length;i++)
		    {
		    	id=getIdByPolicyId(parentPolicyIds[i]);
		    	idString=String.valueOf(id);
		    	parent2PolicyId=getPolicyParentById(idString);
		    	PolicyTree policyTree=new PolicyTree();
		    	policyTree.setPolicyId(parentPolicyIds[i]);
		    	policyTree.setParentPolicyId(parent2PolicyId);
		    	policyList.add(policyTree);
				getPolicyParentTree(parent2PolicyId,policyList);
		    }
		}
		else
		{
			return;
		}
	}
	
	
	/*
	 * 族谱分析(获取父亲)
	 */
	public ArrayList<ArrayList<PolicyTree>> getPolicyFamilyTreeById(String id, String timeselect, String starttime, String endtime)throws SQLException
	{
		ArrayList<ArrayList<PolicyTree>>policyLists=new ArrayList<ArrayList<PolicyTree>>();
		
		ArrayList<PolicyTree> policyListOld=getPolicyParentTreeById(id);
		int i;
		String policyId;
		String policyIdOld=getPolicyIdById(id);
		String[] firstPoint=new String[policyListOld.size()];
		isFirstPoint(policyIdOld,policyIdOld,policyListOld,firstPoint);
		int pointDepth;
		int depth=treeDepth(policyIdOld,policyListOld);
		Map<String,String> parentPoints = new HashMap<String,String>();
		parentPoint(policyIdOld,policyIdOld,policyListOld,parentPoints);
		for(int j=0;j<depth;j++)
		{
			ArrayList<PolicyTree> policyList=new ArrayList<PolicyTree>();
			policyLists.add(policyList);
		}
		for(i=0;i<policyListOld.size();i++)
		{
			policyId=policyListOld.get(i).getPolicyId();
			pointDepth=btreedepth(policyIdOld,policyId,policyListOld);
			PolicyTree policyTree=new PolicyTree();
			policyTree.setId(getIdByPolicyId(policyId));
			policyTree.setPolicyId(policyId);
			policyTree.setName(getPolicyNameByPolicyId(policyId));
			policyTree.setParentPolicyId(parentPoints.get(policyId));
			policyTree.setIsnew(getIsnewBypolicyId(policyId,timeselect,starttime,endtime));
			policyLists.get(pointDepth-1).add(policyTree);
		}
		return policyLists;
	}
	
	/*
	 * 族谱分析(获取孩子)
	 */
	public ArrayList<ArrayList<PolicyTree>> getChildPolicyFamilyTreeById(String id, String timeselect, String starttime, String endtime)throws SQLException
	{
		ArrayList<ArrayList<PolicyTree>>policyLists=new ArrayList<ArrayList<PolicyTree>>();
		ArrayList<PolicyTree> policyListOld=getPolicyChildTreeById(id);
		int i;
		String policyId;
		String policyIdOld=getPolicyIdById(id);
		String[] firstPoint=new String[policyListOld.size()];
		isFirstPoint(policyIdOld,policyIdOld,policyListOld,firstPoint);
		int pointDepth;
		int depth=treeDepth(policyIdOld,policyListOld);
		Map<String,String> parentPoints = new HashMap<String,String>();
		parentPoint(policyIdOld,policyIdOld,policyListOld,parentPoints);
		for(int j=0;j<depth;j++)
		{
			ArrayList<PolicyTree> policyList=new ArrayList<PolicyTree>();
			policyLists.add(policyList);
		}
		for(i=0;i<policyListOld.size();i++)
		{
			policyId=policyListOld.get(i).getPolicyId();
			pointDepth=btreedepth(policyIdOld,policyId,policyListOld);
			PolicyTree policyTree=new PolicyTree();
			policyTree.setPolicyId(policyId);
			policyTree.setId(getIdByPolicyId(policyId));
			policyTree.setName(getPolicyNameByPolicyId(policyId));
			policyTree.setParentPolicyId(parentPoints.get(policyId));
			policyTree.setIsnew(getIsnewBypolicyId(policyId,timeselect,starttime,endtime));
			policyLists.get(pointDepth-1).add(policyTree);
		}
		return policyLists;
	}
	
	/*
	 * 时效分析(获取前驱)
	 */
	public ArrayList<ArrayList<PolicyTree>> getBeforePolicyFamilyTreeById(String id, String timeselect, String starttime, String endtime)throws SQLException
	{
		ArrayList<ArrayList<PolicyTree>>policyLists=new ArrayList<ArrayList<PolicyTree>>();
		
		ArrayList<PolicyTree> policyListOld=getBeforePolicyTreeById(id);
		int i;
		String policyId;
		String policyIdOld=getPolicyIdById(id);
		String[] firstPoint=new String[policyListOld.size()];
		isFirstPoint(policyIdOld,policyIdOld,policyListOld,firstPoint);
		int pointDepth;
		int depth=treeDepth(policyIdOld,policyListOld);
		Map<String,String> parentPoints = new HashMap<String,String>();
		parentPoint(policyIdOld,policyIdOld,policyListOld,parentPoints);
		for(int j=0;j<depth;j++)
		{
			ArrayList<PolicyTree> policyList=new ArrayList<PolicyTree>();
			policyLists.add(policyList);
		}
		for(i=0;i<policyListOld.size();i++)
		{
			policyId=policyListOld.get(i).getPolicyId();
			pointDepth=btreedepth(policyIdOld,policyId,policyListOld);
			PolicyTree policyTree=new PolicyTree();
			policyTree.setPolicyId(policyId);
			policyTree.setId(getIdByPolicyId(policyId));
			policyTree.setName(getPolicyNameByPolicyId(policyId));
			policyTree.setIsnew(getIsnewBypolicyId(policyId,timeselect,starttime,endtime));
			policyTree.setParentPolicyId(parentPoints.get(policyId));
			policyLists.get(pointDepth-1).add(policyTree);
		}
		return policyLists;
	}
	
	/*
	 * 时效分析(获取后继)
	 */
	public ArrayList<ArrayList<PolicyTree>> getAfterPolicyFamilyTreeById(String id, String timeselect, String starttime, String endtime)throws SQLException
	{
		ArrayList<ArrayList<PolicyTree>>policyLists=new ArrayList<ArrayList<PolicyTree>>();
		
		ArrayList<PolicyTree> policyListOld=getAfterPolicyTreeById(id);
		int i;
		String policyId;
		String policyIdOld=getPolicyIdById(id);
		String[] firstPoint=new String[policyListOld.size()];
		isFirstPoint(policyIdOld,policyIdOld,policyListOld,firstPoint);
		int pointDepth;
		int depth=treeDepth(policyIdOld,policyListOld);
		Map<String,String> parentPoints = new HashMap<String,String>();
		parentPoint(policyIdOld,policyIdOld,policyListOld,parentPoints);
		for(int j=0;j<depth;j++)
		{
			ArrayList<PolicyTree> policyList=new ArrayList<PolicyTree>();
			policyLists.add(policyList);
		}
		for(i=0;i<policyListOld.size();i++)
		{
			policyId=policyListOld.get(i).getPolicyId();
			pointDepth=btreedepth(policyIdOld,policyId,policyListOld);
			PolicyTree policyTree=new PolicyTree();
			policyTree.setPolicyId(policyId);
			policyTree.setId(getIdByPolicyId(policyId));
			policyTree.setName(getPolicyNameByPolicyId(policyId));
			policyTree.setIsnew(getIsnewBypolicyId(policyId,timeselect,starttime,endtime));
			policyTree.setParentPolicyId(parentPoints.get(policyId));
			policyLists.get(pointDepth-1).add(policyTree);
		}
		return policyLists;
	}
	
	/*
	 * 获取政策树的深度
	 */
	public int getPolicyDepth(String id)throws Exception
	{
		ArrayList<PolicyTree> policyListOld=getPolicyParentTreeById(id);
		return treeDepth(getPolicyIdById(id),policyListOld);
	}

	
	/*
	 * 根据policyTree的polcy获取ParentPolicyId
	 */
	private String getParentPolicyIdByPolicyId(String policyId,ArrayList<PolicyTree>policyTree)
	{
		int i;
		for(i=0;i<policyTree.size();i++)
		{
			if(policyId!=null&&!policyId.equals("")&&policyId.equals(policyTree.get(i).getPolicyId()))
			{
				return policyTree.get(i).getParentPolicyId();
			}
		}
		return null;
	}
	
	/*
	 * 求树的深度
	 */
	private int treeDepth(String policyId,ArrayList<PolicyTree> policyTree)
	{
		if(policyId!=null&&!policyId.equals("")){
			String parentPolicyId=getParentPolicyIdByPolicyId(policyId,policyTree);
			if(parentPolicyId!=null&&!parentPolicyId.equals("")){
				String[] parentPolicyIds=parentPolicyId.split(";");// 在每个逗号(,)处进行分解
				int i;
				int max;
				int []a=new int[policyTree.size()];
				for(i=0;i<parentPolicyIds.length;i++){
					a[i]=treeDepth(parentPolicyIds[i],policyTree)+1;
				}
				max=a[0];
				for(i=0;i<a.length;i++){
					if(a[i]>max){
						max=a[i];
					}
				}
				return max;
			}
			return 1;
		}
		else{
			return 0;
		}
	}

	/*
	 * 求节点在树中的层次
	 */
	private int btreedepth(String policyId,String pointPolicyId,ArrayList<PolicyTree> policyTree)
	{
		if(policyId!=null&&!policyId.equals("")){
			if(policyId.equals(pointPolicyId)){
				return 1;
			}
			int max;
			String parentPolicyId=getParentPolicyIdByPolicyId(policyId,policyTree);
			if(parentPolicyId!=null&&!parentPolicyId.equals("")){
				if(parentPolicyId.indexOf(";")!=-1){
					String[] parentPolicyIds=parentPolicyId.split(";");// 在每个逗号(,)处进行分解
					int i;
					int[] a=new int[policyTree.size()];
					for(i=0;i<parentPolicyIds.length;i++){
						a[i]=btreedepth(parentPolicyIds[i],pointPolicyId,policyTree);
					}
					max=a[0];
					for(i=0;i<a.length;i++){
						if(a[i]>max){
							max=a[i];
						}
					}
					return max+1;
				}
				else if(parentPolicyId.indexOf(";")==-1){
					return btreedepth(parentPolicyId,pointPolicyId,policyTree)+1;
				}
			}
		}
		return 0;
	}

	//求每个节点的父节点
	private void parentPoint(String policyId,String policyIdNow,ArrayList<PolicyTree> policyTree,Map<String,String> parentPoints)
	{
		if(policyIdNow!=null&&!policyIdNow.equals("")){
			String parentPolicyId=getParentPolicyIdByPolicyId(policyIdNow,policyTree);
			if(parentPolicyId!=null&&!parentPolicyId.equals("")){
				String[] parentPolicyIds=parentPolicyId.split(";");// 在每个逗号(,)处进行分解
				int i;
				for(i=0;i<parentPolicyIds.length;i++){
					parentPoints.put(parentPolicyIds[i], policyIdNow);
					parentPoint(policyId,parentPolicyIds[i],policyTree,parentPoints);
				}
			}
			return;
		}
		else{
			return;
		}
	}

	//求该层的第一个节点
	private void isFirstPoint(String policyId,String policyIdNow,ArrayList<PolicyTree> policyTree,String[]firstPoint)
	{
		if(policyIdNow!=null&&!policyIdNow.equals("")){
			String parentPolicyId=getParentPolicyIdByPolicyId(policyIdNow,policyTree);
			if(parentPolicyId!=null&&!parentPolicyId.equals("")){
				String[] parentPolicyIds=parentPolicyId.split(";");// 在每个逗号(,)处进行分解
				int i;
				int shengdu;
				for(i=0;i<parentPolicyIds.length;i++){
					shengdu=btreedepth(policyId,parentPolicyIds[i],policyTree);
					if(firstPoint[shengdu-1]==null||(firstPoint[shengdu-1]!=null&&firstPoint[shengdu-1].equals(""))){
						firstPoint[shengdu-1]=parentPolicyIds[i];
					}
					isFirstPoint(policyId,parentPolicyIds[i],policyTree,firstPoint);
				}
			}
			return;
		}
		else{
			return;
		}
	}

	
	/**
	 * 断开数据库
	 * 
	 * @throws SQLException
	 */
	public void closeDB() throws SQLException
	{
		if (pstm != null)
		{
			pstm.close();
		}
		if (rs != null)
		{
			rs.close();
		}
		if (con != null)
		{
			con.close();
		}
	}

	/**
	 * 根据政策Id返回孩子树形结构
	 * 
	 * @param id 政策Id
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<PolicyTree> getPolicyChildTreeById(String id)throws SQLException
	{
		ResultSet rs1;
		PreparedStatement pstm1;
		String policyId="";
		String policyIds="";
		String parent="";
		String ZCID;
		policyId=getPolicyIdById(id);
		ArrayList<PolicyTree>policyList1=new ArrayList<PolicyTree>();
		dataBase =new DataBaseDao();
		con = dataBase.connection();
		String sql="select ZCID,BSWZC from BYB";
		pstm=con.prepareStatement(sql);
		rs = pstm.executeQuery(); // 执行查询操作
		int i;
		Boolean isFirst=true;
		String parents[];
		while(rs.next())
		{
			parent=rs.getString("BSWZC");
			ZCID=rs.getString("ZCID");
			if(parent!=null&&!parent.equals(""))
			{
				parents=parent.split(";");
				for(i=0;i<parents.length;i++)
				{
					if(policyId!=null&&!policyId.equals("")&&parents[i].equals(policyId)&&isFirst)
					{
						String sql1="select ZCWH from ZCB where ZCID=?";
						pstm1=con.prepareStatement(sql1);
						pstm1.setObject(1, ZCID);
						rs1 = pstm1.executeQuery(); // 执行查询操作
						if(rs1.next())
						{
							policyIds+=rs1.getString("ZCWH");
						}
						isFirst=false;
					}
					else if(policyId!=null&&!policyId.equals("")&&parents[i].equals(policyId)&&isFirst==false)
					{
						String sql1="select ZCWH from ZCB where ZCID=?";
						pstm1=con.prepareStatement(sql1);
						pstm1.setObject(1, ZCID);
						rs1 = pstm1.executeQuery(); // 执行查询操作
						if(rs1.next())
						{
							policyIds+=";"+rs1.getString("ZCWH");
						}
					}
				}
			}
		}
		PolicyTree policyTree=new PolicyTree();
    	policyTree.setPolicyId(policyId);
    	policyTree.setParentPolicyId(policyIds);
    	policyList1.add(policyTree);
		getPolicyChildTree(policyIds,policyList1);
		closeDB();
		return policyList1;
	}
	
	/**
	 * @param parentPolicyId
	 * @param policyList1
	 * @throws SQLException
	 */
	private void getPolicyChildTree(String parentPolicyId,ArrayList<PolicyTree>policyList1)throws SQLException
	{
		if(parentPolicyId!=null&&!parentPolicyId.equals(""))
		{
			int i,j,k;
		    String parentPolicyIds[] = parentPolicyId.split(";");
		    String policyIds="";
		    Boolean isFirst=true;
			ResultSet rs1;
			PreparedStatement pstm1;
			ArrayList<PolicyIdParentid>policyIdParentids=new ArrayList<PolicyIdParentid>();
			dataBase =new DataBaseDao();
			con = dataBase.connection();
			String sql="select ZCID,BSWZC from BYB";
			pstm=con.prepareStatement(sql);
			rs = pstm.executeQuery(); // 执行查询操作
			String parents[];
			while(rs.next())
			{
				PolicyIdParentid policyIdParentid=new PolicyIdParentid();
				policyIdParentid.setId(rs.getInt("ZCID"));
				policyIdParentid.setParentId(rs.getString("BSWZC"));
				policyIdParentids.add(policyIdParentid);
			}
		    for(i=0;i<parentPolicyIds.length;i++)
		    {
		    	policyIds="";
		    	for(j=0;j<policyIdParentids.size();j++)
		    	{
		    		parents=null;
		    		if(policyIdParentids.get(j).getParentId()!=null&&!policyIdParentids.get(j).getParentId().equals(""))
					{
		    			parents=policyIdParentids.get(j).getParentId().split(";");
						for(k=0;k<parents.length;k++)
						{
							if(parents!=null&&parents[k]!=null&&!parents[k].equals("")&&parents[k].equals(parentPolicyIds[i])&&isFirst)
							{
								String sql1="select ZCWH from ZCB where ZCID=?";
								pstm1=con.prepareStatement(sql1);
								pstm1.setObject(1, policyIdParentids.get(j).getId());
								rs1 = pstm1.executeQuery(); // 执行查询操作
								if(rs1.next())
								{
									policyIds+=rs1.getString("ZCWH");
								}
								isFirst=false;
							}
							else if(parents!=null&&parents[k]!=null&&!parents[k].equals("")&&parents[k].equals(parentPolicyIds[i])&&isFirst==false)
							{
								String sql1="select ZCWH from ZCB where ZCID=?";
								pstm1=con.prepareStatement(sql1);
								pstm1.setObject(1, policyIdParentids.get(j).getId());
								rs1 = pstm1.executeQuery(); // 执行查询操作
								if(rs1.next())
								{
									policyIds+=";"+rs1.getString("ZCWH");
								}
							}
						}
					}
		    	}
		    	PolicyTree policyTree=new PolicyTree();
		    	policyTree.setPolicyId(parentPolicyIds[i]);
		    	policyTree.setParentPolicyId(policyIds);
		    	policyList1.add(policyTree);
		    	getPolicyChildTree(policyIds,policyList1);
		    }
		}
		else
		{
			return;
		}
	}

	/**
	 * 根据政策ID获取前驱政策的树结构
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<PolicyTree> getBeforePolicyTreeById(String id)throws SQLException
	{
		ArrayList<PolicyTree>policyList=new ArrayList<PolicyTree>();
		PolicyTree policyTree=new PolicyTree();
    	policyTree.setPolicyId(getPolicyIdById(id));
    	policyTree.setParentPolicyId(getPolicyBeforeById(id));
    	policyList.add(policyTree);
		dataBase =new DataBaseDao();
		con = dataBase.connection();
		String sql="select BQQZC from BYB where ZCID=?";
		pstm=con.prepareStatement(sql);
		pstm.setObject(1, id);
		rs = pstm.executeQuery(); // 执行查询操作
		if(rs.next())
		{
			getBeforePolicyTree(rs.getString("BQQZC"),policyList);
		}
		closeDB();
		return policyList;
	}
	
	/**
	 * @param parentPolicyId
	 * @param policyList
	 * @throws SQLException
	 */
	private void getBeforePolicyTree(String parentPolicyId,ArrayList<PolicyTree>policyList)throws SQLException
	{
		if(parentPolicyId!=null&&!parentPolicyId.equals(""))
		{
			int i;
			int id;
			String idString;
			String parent2PolicyId;
		    String parentPolicyIds[] = parentPolicyId.split(";");
		    for(i=0;i<parentPolicyIds.length;i++)
		    {
		    	id=getIdByPolicyId(parentPolicyIds[i]);
		    	idString=String.valueOf(id);
		    	parent2PolicyId=getPolicyBeforeById(idString);
		    	PolicyTree policyTree=new PolicyTree();
		    	policyTree.setPolicyId(parentPolicyIds[i]);
		    	policyTree.setParentPolicyId(parent2PolicyId);
		    	policyList.add(policyTree);
		    	getBeforePolicyTree(parent2PolicyId,policyList);
		    }
		}
		else
		{
			return;
		}
	}

	/**
	 * 根据政策ID获取后继政策的树结构
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public ArrayList<PolicyTree> getAfterPolicyTreeById(String id)throws SQLException
	{
		ResultSet rs1;
		PreparedStatement pstm1;
		String policyId="";
		String policyIds="";
		String parent="";
		String ZCID;
		policyId=getPolicyIdById(id);
		ArrayList<PolicyTree>policyList1=new ArrayList<PolicyTree>();
		dataBase =new DataBaseDao();
		con = dataBase.connection();
		String sql="select ZCID,BQQZC from BYB";
		pstm=con.prepareStatement(sql);
		rs = pstm.executeQuery(); // 执行查询操作
		int i;
		Boolean isFirst=true;
		String parents[];
		while(rs.next())
		{
			parent=rs.getString("BQQZC");
			ZCID=rs.getString("ZCID");
			if(parent!=null&&!parent.equals(""))
			{
				parents=parent.split(";");
				for(i=0;i<parents.length;i++)
				{
					if(parents[i].equals(policyId)&&isFirst)
					{
						String sql1="select ZCWH from ZCB where ZCID=?";
						pstm1=con.prepareStatement(sql1);
						pstm1.setObject(1, ZCID);
						rs1 = pstm1.executeQuery(); // 执行查询操作
						if(rs1.next())
						{
							policyIds+=rs1.getString("ZCWH");
						}
						isFirst=false;
					}
					else if(parents[i].equals(policyId)&&isFirst==false)
					{
						String sql1="select ZCWH from ZCB where ZCID=?";
						pstm1=con.prepareStatement(sql1);
						pstm1.setObject(1, ZCID);
						rs1 = pstm1.executeQuery(); // 执行查询操作
						if(rs1.next())
						{
							policyIds+=";"+rs1.getString("ZCWH");
						}
					}
				}
			}
		}
		PolicyTree policyTree=new PolicyTree();
    	policyTree.setPolicyId(policyId);
    	policyTree.setParentPolicyId(policyIds);
    	policyList1.add(policyTree);
    	getAfterPolicyTree(policyIds,policyList1);
		closeDB();
		return policyList1;
	}
	
	/**
	 * @param parentPolicyId
	 * @param policyList
	 * @throws SQLException
	 */
	private void getAfterPolicyTree(String parentPolicyId,ArrayList<PolicyTree>policyList1)throws SQLException
	{
		if(parentPolicyId!=null&&!parentPolicyId.equals(""))
		{
			int i,j,k;
		    String parentPolicyIds[] = parentPolicyId.split(";");
		    String policyIds="";
		    Boolean isFirst=true;
			ResultSet rs1;
			PreparedStatement pstm1;
			ArrayList<PolicyIdParentid>policyIdParentids=new ArrayList<PolicyIdParentid>();
			dataBase =new DataBaseDao();
			con = dataBase.connection();
			String sql="select ZCID,BQQZC from BYB";
			pstm=con.prepareStatement(sql);
			rs = pstm.executeQuery(); // 执行查询操作
			String parents[];
			while(rs.next())
			{
				PolicyIdParentid policyIdParentid=new PolicyIdParentid();
				policyIdParentid.setId(rs.getInt("ZCID"));
				policyIdParentid.setParentId(rs.getString("BQQZC"));
				policyIdParentids.add(policyIdParentid);
			}
		    for(i=0;i<parentPolicyIds.length;i++)
		    {
		    	policyIds="";
		    	for(j=0;j<policyIdParentids.size();j++)
		    	{
		    		parents=null;
		    		if(policyIdParentids.get(j).getParentId()!=null&&!policyIdParentids.get(j).getParentId().equals(""))
					{
		    			parents=policyIdParentids.get(j).getParentId().split(";");
						for(k=0;k<parents.length;k++)
						{
							if(parents!=null&&parents[k]!=null&&!parents[k].equals("")&&parents[k].equals(parentPolicyIds[i])&&isFirst)
							{
								String sql1="select ZCWH from ZCB where ZCID=?";
								pstm1=con.prepareStatement(sql1);
								pstm1.setObject(1, policyIdParentids.get(j).getId());
								rs1 = pstm1.executeQuery(); // 执行查询操作
								if(rs1.next())
								{
									policyIds+=rs1.getString("ZCWH");
								}
								isFirst=false;
							}
							else if(parents!=null&&parents[k]!=null&&!parents[k].equals("")&&parents[k].equals(parentPolicyIds[i])&&isFirst==false)
							{
								String sql1="select ZCWH from ZCB where ZCID=?";
								pstm1=con.prepareStatement(sql1);
								pstm1.setObject(1, policyIdParentids.get(j).getId());
								rs1 = pstm1.executeQuery(); // 执行查询操作
								if(rs1.next())
								{
									policyIds+=";"+rs1.getString("ZCWH");
								}
							}
						}
					}
		    	}
		    	PolicyTree policyTree=new PolicyTree();
		    	policyTree.setPolicyId(parentPolicyIds[i]);
		    	policyTree.setParentPolicyId(policyIds);
		    	policyList1.add(policyTree);
		    	getAfterPolicyTree(policyIds,policyList1);
		    }
		}
		else
		{
			return;
		}
	}
	
	/*
	 * 根据政策id，日期类型，日期范围，获取是否为新政策
	 */
	private String getIsnewBypolicyId(String id,String timeselect, String starttime, String endtime) throws SQLException
	{
		String isnew;
		if(timeselect!=null&&timeselect.equals("publishtime")){
			timeselect="BGBRQ";
		}else if( timeselect!=null&& timeselect.equals("applytime")){
			timeselect="BSXRQ";
		}else if(timeselect!=null&& timeselect.equals("breaktime")){
			timeselect="BFZRQ";
		}
		String sql;
		int policyId=0;
		sql="select ZCID from ZCB where ZCWH=?";
		dataBase =new DataBaseDao();
		con = dataBase.connection();
		pstm=con.prepareStatement(sql);
		pstm.setObject(1, id);
		rs = pstm.executeQuery(); // 执行查询操作
		if(rs.next())
		{
			policyId=rs.getInt("ZCID");
		}
		
		sql="select * from BYB ";
		if((starttime!=null)&&(endtime!=null))
		{
			if((!starttime.equals(""))||(!endtime.equals("")))
			{
				sql+=" where ZCID="+policyId+" and ";
				if((!starttime.equals(""))&&(!endtime.equals("")))
				{
					sql+=timeselect+" between '"+starttime+"' and '"+endtime+"'";
				}
				else if(!starttime.equals(""))
				{
					sql+=timeselect+" > '"+starttime+"'";
				}
				else if(!endtime.equals(""))
				{
					sql+=timeselect+" < '"+endtime+"'";
				}
			}
		}
		pstm=con.prepareStatement(sql);
		rs = pstm.executeQuery(); // 执行查询操作
		if(rs.next())
		{
			isnew="1";
		}
		else{
			isnew="0";
		}
		if((starttime==null||starttime.equals(""))&&(endtime==null||endtime.equals("")))
		{
			isnew="0";
		}
		closeDB();
		return isnew;
	}
}