package model;

import java.io.Serializable;

public class YeuCau implements Serializable{
	
	private int ycId;
	
	private int cvId;
	private CTVatTu ctVatTu;
	

	/**
	 * NOT NULL false
	 * DomainName 
	 * DatatypeName INT
	 * DataTypeLength/Precision 10
	 */
	private int ycSoLuong;

	/**
	 * NOT NULL false
	 * DomainName 
	 * DatatypeName BIT
	 * DataTypeLength/Precision 0
	 */
	private int daXoa;
	
	public YeuCau() {
		this.cvId = 0;
		this.ctVatTu = new CTVatTu();
		this.ycSoLuong = 0;
		this.daXoa = 0;
		this.ycId = 0;
	}

	/**
	 * @param cvId
	 * @param ctVatTu
	 * @param ycSoLuong
	 * @param daXoa
	 */
	public YeuCau(int cvId, CTVatTu ctVatTu, int ycSoLuong, int daXoa) {
		this.cvId = cvId;
		this.ctVatTu = ctVatTu;
		this.ycSoLuong = ycSoLuong;
		this.daXoa = daXoa;
	}
	
	/**
	 * @param cvId
	 * @param ctVatTu
	 * @param ycSoLuong
	 * @param daXoa
	 */
	public YeuCau(int ycId, int cvId, CTVatTu ctVatTu, int ycSoLuong, int daXoa) {
		this.ycId = ycId;
		this.cvId = cvId;
		this.ctVatTu = ctVatTu;
		this.ycSoLuong = ycSoLuong;
		this.daXoa = daXoa;
	}

	/**
	 * @return the cvId
	 */
	public final int getCvId() {
		return cvId;
	}

	/**
	 * @param cvId the cvId to set
	 */
	public final void setCvId(int cvId) {
		this.cvId = cvId;
	}

	public int getYcId() {
		return ycId;
	}

	public void setYcId(int ycId) {
		this.ycId = ycId;
	}

	public int getDaXoa() {
		return daXoa;
	}

	/**
	 * @return the ctVatTu
	 */
	public final CTVatTu getCtVatTu() {
		return ctVatTu;
	}

	/**
	 * @param ctVatTu the ctVatTu to set
	 */
	public final void setCtVatTu(CTVatTu ctVatTu) {
		this.ctVatTu = ctVatTu;
	}

	/**
	 * @return the ycSoLuong
	 */
	public final int getYcSoLuong() {
		return ycSoLuong;
	}

	/**
	 * @param ycSoLuong the ycSoLuong to set
	 */
	public final void setYcSoLuong(int ycSoLuong) {
		this.ycSoLuong = ycSoLuong;
	}

	
	/**
	 * @param daXoa the daXoa to set
	 */
	public final void setDaXoa(int daXoa) {
		this.daXoa = daXoa;
	}
}
