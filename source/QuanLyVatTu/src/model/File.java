package model;

import java.io.Serializable;

public class File implements Serializable {
	private int fileId;
	private String diaChi;
	private String moTa;
	
	public File() {
		this.fileId = fileId;
		this.diaChi = diaChi;
		this.moTa = moTa;
	}
	
	/**
	 * @param fileId
	 * @param diaChi
	 * @param moTa
	 */
	public File(String fileDiaChi, String fileMoTa) {
		this.diaChi = fileDiaChi;
		this.moTa = fileMoTa;
	}
	
	/**
	 * @param fileId
	 * @param diaChi
	 * @param moTa
	 */
	public File(int fileId, String fileDiaChi, String fileMoTa) {
		this.fileId = fileId;
		this.diaChi = fileDiaChi;
		this.moTa = fileMoTa;
	}
	/**
	 * @return the fileId
	 */
	public int getFileId() {
		return fileId;
	}
	/**
	 * @param fileId the fileId to set
	 */
	public void setFileId(int fileId) {
		this.fileId = fileId;
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
	public void setDiaChi(String fileDiaChi) {
		this.diaChi = fileDiaChi;
	}
	/**
	 * @return the moTa
	 */
	public String getMoTa() {
		return moTa;
	}
	/**
	 * @param moTa the moTa to set
	 */
	public void setMoTa(String fileMoTa) {
		this.moTa = fileMoTa;
	}
	
}
