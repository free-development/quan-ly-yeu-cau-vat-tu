package model;

import java.io.Serializable;



public class ChatLuong implements Serializable {

	/**
	 * NOT NULL true
	 * DomainName 
	 * DatatypeName CHAR
	 * DataTypeLength/Precision 3
	 */
	private String clMa;

	/**
	 * NOT NULL false
	 * DomainName 
	 * DatatypeName VARCHAR
	 * DataTypeLength/Precision 20
	 */
	private String clTen;
	
	public ChatLuong() {
		this.clMa = "";
		this.clTen = "";
	}
	/**
	 * @param clMa
	 * @param clTen
	 */
	public ChatLuong(String clMa, String clTen) {
		this.clMa = clMa;
		this.clTen = clTen;
	}
	/**
	 * @return the clMa
	 */
	public String getClMa() {
		return clMa;
	}
	/**
	 * @param clMa the clMa to set
	 */
	public void setClMa(String clMa) {
		this.clMa = clMa;
	}
	/**
	 * @return the clTen
	 */
	public String getClTen() {
		return clTen;
	}
	/**
	 * @param clTen the clTen to set
	 */
	public void setClTen(String clTen) {
		this.clTen = clTen;
	}


}
