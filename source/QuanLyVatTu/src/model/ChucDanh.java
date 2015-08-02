package model;

import java.io.Serializable;


public class ChucDanh implements Serializable{
	
	/**
	 * NOT NULL true DomainName DatatypeName VARCHAR DataTypeLength/Precision 10
	 */
	private String cdMa;
	
	/**
	 * NOT NULL false DomainName DatatypeName VARCHAR DataTypeLength/Precision
	 * 30
	 */
	private String cdTen;

	public ChucDanh() {
		this.cdMa = "";
		this.cdTen = "";
	}
	
	/**
	 * @param cdMa
	 * @param cdTen
	 */
	public ChucDanh(String cdMa, String cdTen) {
		this.cdMa = cdMa;
		this.cdTen = cdTen;
	}

	/**
	 * @return the cdMa
	 */
	public String getCdMa() {
		return cdMa;
	}

	/**
	 * @param cdMa the cdMa to set
	 */
	public void setCdMa(String cdMa) {
		this.cdMa = cdMa;
	}

	/**
	 * @return the cdTen
	 */
	public String getCdTen() {
		return cdTen;
	}

	/**
	 * @param cdTen the cdTen to set
	 */
	public void setCdTen(String cdTen) {
		this.cdTen = cdTen;
	}
	
}
