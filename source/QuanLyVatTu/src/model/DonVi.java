package model;

import java.io.Serializable;

public class DonVi implements Serializable{
	private String dvMa;
	private String dvTen;
	private String sdt;
	private String email;
	private String diaChi;
	
	public DonVi() {
		this.dvMa = "";
		this.dvTen = "";
		this.sdt = "";
		this.email = "";
		this.diaChi = "";
	}
	
	/**
	 * @param dvMa
	 * @param dvTen
	 * @param sdt
	 * @param email
	 * @param diaChi
	 */
	public DonVi(String dvMa, String dvTen, String sdt, String email,
			String diaChi) {
		this.dvMa = dvMa;
		this.dvTen = dvTen;
		this.sdt = sdt;
		this.email = email;
		this.diaChi = diaChi;
	}

	/**
	 * @return the dvMa
	 */
	public String getDvMa() {
		return dvMa;
	}

	/**
	 * @param dvMa the dvMa to set
	 */
	public void setDvMa(String dvMa) {
		this.dvMa = dvMa;
	}

	/**
	 * @return the dvTen
	 */
	public String getDvTen() {
		return dvTen;
	}

	/**
	 * @param dvTen the dvTen to set
	 */
	public void setDvTen(String dvTen) {
		this.dvTen = dvTen;
	}

	/**
	 * @return the sdt
	 */
	public String getSdt() {
		return sdt;
	}

	/**
	 * @param sdt the sdt to set
	 */
	public void setSdt(String dvSdt) {
		this.sdt = dvSdt;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String dvEmail) {
		this.email = dvEmail;
	}

	/**
	 * @return the diaChi
	 */
	public String getDiaChi() {
		return diaChi;
	}

	/**
	 * @param diaChi the diaChi to set
	 */
	public void setDiaChi(String dvDiaChi) {
		this.diaChi = dvDiaChi;
	}
	
}
