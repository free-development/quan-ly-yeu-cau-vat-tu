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
	 * @param dvt
	 */
	public VatTu(String vtMa, String vtTen, String dvt) {
		this.vtMa = vtMa;
		this.vtTen = vtTen;
		this.dvt = dvt;
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
