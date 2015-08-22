package model;

import java.io.Serializable;


public class VatTu implements Serializable{

	/**
	 * NOT NULL true
	 * DomainName 
	 * DatatypeName CHAR
	 * DataTypeLength/Precision 16
	 */
	private String vtMa;
	private int daXoa;
	/**
	 * NOT NULL false
	 * DomainName 
	 * DatatypeName VARCHAR
	 * DataTypeLength/Precision 50
	 */
	private String vtTen;

	/**
	 * NOT NULL false
	 * DomainName 
	 * DatatypeName INT
	 * DataTypeLength/Precision 10
	 */
	private String dvt;
	
	public VatTu() {
		this.vtMa = "";
		this.vtTen = "";
		this.dvt = "";
		this.daXoa =0;
	}
	/**
	 * @param vtMa
	 */
	public VatTu(String vtMa) {
		this.vtMa = vtMa;
	}
	
	
	/**
	 * @param vtMa
	 * @param vtTen
	 */
	public VatTu(String vtMa, String vtTen) {
		this.vtMa = vtMa;
		this.vtTen = vtTen;
	}
	
	/**
	 * @param vtMa
	 * @param vtTen
	 * @param dvt
	 */
	public VatTu(String vtMa, String vtTen, String dvt,int daXoa) {
		this.vtMa = vtMa;
		this.vtTen = vtTen;
		this.dvt = dvt;
		this.daXoa = daXoa;
	}

	/**
	 * @return the vtMa
	 */
	public  String getVtMa() {
		return vtMa;
	}

	/**
	 * @param vtMa the vtMa to set
	 */
	public  void setVtMa(String vtMa) {
		this.vtMa = vtMa;
	}

	/**
	 * @return the vtTen
	 */
	public  String getVtTen() {
		return vtTen;
	}

	public int getDaXoa() {
		return daXoa;
	}
	public void setDaXoa(int daXoa) {
		this.daXoa = daXoa;
	}
	/**
	 * @param vtTen the vtTen to set
	 */
	public  void setVtTen(String vtTen) {
		this.vtTen = vtTen;
	}

	/**
	 * @return the dvt
	 */
	public  String getDvt() {
		return dvt;
	}

	/**
	 * @param dvt the dvt to set
	 */
	public  void setDvt(String dvt) {
		this.dvt = dvt;
	}

}
