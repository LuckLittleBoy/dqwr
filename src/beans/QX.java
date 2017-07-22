package beans;

import java.util.ArrayList;
import java.util.List;

public class QX {
	private String id;
	private String nc;
	private String jb;
	private String sm;
	public String getSm() {
		return sm;
	}
	public void setSm(String sm) {
		this.sm = sm;
	}
	public List<QX> xp=new ArrayList<QX>();
	
	public List<QX> getXp() {
		return xp;
	}
	public void setXp(List<QX> xp) {
		this.xp = xp;
	}
	public String getJb() {
		return jb;
	}
	public void setJb(String jb) {
		this.jb = jb;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNc() {
		return nc;
	}
	public void setNc(String nc) {
		this.nc = nc;
	}

}
