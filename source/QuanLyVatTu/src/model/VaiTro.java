package model;

import java.io.Serializable;

public class VaiTro implements Serializable{
	private int vtId;
	private String vtTen;
	
	public VaiTro() {
		this.vtId = 0;
		this.vtTen = "";
	}
	
	/**
	 * @param vtTen
	 */
	public VaiTro(String vtTen) {
		this.vtTen = vtTen;
	}
	
	/**
	 * @param vtId
	 * @param vtTen
	 */
	public VaiTro(int vtId, String vtTen) {
		this.vtId = vtId;
		this.vtTen = vtTen;
	}

	/**
	 * @return the vtId
	 */
	public final int getVtId() {
		return vtId;
	}

	/**
	 * @param vtId the vtId to set
	 */
	public final void setVtId(int vtId) {
		this.vtId = vtId;
	}

	/**
	 * @return the vtTen
	 */
	public final String getVtTen() {
		return vtTen;
	}

	/**
	 * @param vtTen the vtTen to set
	 */
	public final void setVtTen(String vtTen) {
		this.vtTen = vtTen;
	}
	
	
}