package model;

import java.io.Serializable;

public class NoiSanXuat implements Serializable{

	/**
	 * NOT NULL true
	 * DomainName 
	 * DatatypeName CHAR
	 * DataTypeLength/Precision 3
	 */
	private String nsxMa;

	/**
	 * NOT NULL false
	 * DomainName 
	 * DatatypeName VARCHAR
	 * DataTypeLength/Precision 20
	 */
	private String nsxTen;

	public NoiSanXuat() {
		this.nsxMa = "";
		this.nsxTen = "";
	}
	/**
	 * @param nsxMa
	 * @param nsxTen
	 */
	public NoiSanXuat(String nsxMa, String nsxTen) {
		this.nsxMa = nsxMa;
		this.nsxTen = nsxTen;
	}
	public NoiSanXuat(String nsxMa) {
		this.nsxMa = nsxMa;
	}
	/**
	 * @return the nsxMa
	 */
	public String getNsxMa() {
		return nsxMa;
	}
	/**
	 * @param nsxMa the nsxMa to set
	 */
	public void setNsxMa(String nxsMa) {
		this.nsxMa = nxsMa;
	}
	/**
	 * @return the nsxTen
	 */
	public String getNsxTen() {
		return nsxTen;
	}
	/**
	 * @param nsxTen the nsxTen to set
	 */
	public void setNsxTen(String nsxTen) {
		this.nsxTen = nsxTen;
	}

}
