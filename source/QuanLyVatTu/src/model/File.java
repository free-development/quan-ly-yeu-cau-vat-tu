package model;

import java.io.Serializable;

public class File implements Serializable {
	private int fileId;
	private String fileDiaChi;
	private String fileMoTa;
	
	public File() {
		this.fileId = fileId;
		this.fileDiaChi = fileDiaChi;
		this.fileMoTa = fileMoTa;
	}
	
	/**
	 * @param fileId
	 * @param fileDiaChi
	 * @param fileMoTa
	 */
	public File(String fileDiaChi, String fileMoTa) {
		this.fileDiaChi = fileDiaChi;
		this.fileMoTa = fileMoTa;
	}
	
	/**
	 * @param fileId
	 * @param fileDiaChi
	 * @param fileMoTa
	 */
	public File(int fileId, String fileDiaChi, String fileMoTa) {
		this.fileId = fileId;
		this.fileDiaChi = fileDiaChi;
		this.fileMoTa = fileMoTa;
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
	 * @return the fileDiaChi
	 */
	public String getFileDiaChi() {
		return fileDiaChi;
	}
	/**
	 * @param fileDiaChi the fileDiaChi to set
	 */
	public void setFileDiaChi(String fileDiaChi) {
		this.fileDiaChi = fileDiaChi;
	}
	/**
	 * @return the fileMoTa
	 */
	public String getFileMoTa() {
		return fileMoTa;
	}
	/**
	 * @param fileMoTa the fileMoTa to set
	 */
	public void setFileMoTa(String fileMoTa) {
		this.fileMoTa = fileMoTa;
	}
	
}
