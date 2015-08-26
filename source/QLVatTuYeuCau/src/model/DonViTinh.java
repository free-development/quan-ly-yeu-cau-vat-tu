package model;

import java.io.Serializable;

public class DonViTinh implements Serializable{
	private int dvtId;	
	private String dvtTen;
	private int daXoa;
	public DonViTinh() {
		this.dvtId = 0;
		this.dvtTen = "";
		this.daXoa = 0;
	}
	
	/**
	 * @param dvtTen
	 */

	public DonViTinh(int dvtId) {
		this.dvtId = dvtId;
	}
	public DonViTinh(String dvtTen,int daXoa) {
		this.dvtTen = dvtTen;
		this.daXoa = daXoa;
	}
	public DonViTinh(int dvtId, String dvtTen, int daXoa) {
		this.dvtId = dvtId;
		this.dvtTen = dvtTen;
		this.daXoa = daXoa;
	}
	public final int getDvtId() {
		return dvtId;
	}

	public final void setDvtId(int dvtId) {
		this.dvtId = dvtId;
	}

	public final String getDvtTen() {
		return dvtTen;
	}

	public final void setDvtTen(String dvtTen) {
		this.dvtTen = dvtTen;
	}


	public final int getDaXoa() {
		return daXoa;
	}

	public final void setDaXoa(int daXoa) {
		this.daXoa = daXoa;
	}

	
	
}