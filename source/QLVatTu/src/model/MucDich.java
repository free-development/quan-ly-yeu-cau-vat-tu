/**
 * 
 */
package model;

import java.io.Serializable;

/**
 * @author QUOI
 *
 */
public class MucDich implements Serializable{
	private String mdMa;
	private String mdTen;
	
	public MucDich() {
		this.mdMa = "";
		this.mdTen = "";
	}
	
	/**
	 * @param mdMa
	 * @param mdTen
	 */
	public MucDich(String mdMa, String mdTen) {
		this.mdMa = mdMa;
		this.mdTen = mdTen;
	}

	/**
	 * @return the mdMa
	 */
	public String getMdMa() {
		return mdMa;
	}

	/**
	 * @param mdMa the mdMa to set
	 */
	public void setMdMa(String mdMa) {
		this.mdMa = mdMa;
	}

	/**
	 * @return the mdTen
	 */
	public String getMdTen() {
		return mdTen;
	}

	/**
	 * @param mdTen the mdTen to set
	 */
	public void setMdTen(String mdTen) {
		this.mdTen = mdTen;
	}
	
	
}
